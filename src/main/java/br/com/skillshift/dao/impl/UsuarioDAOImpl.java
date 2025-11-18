package br.com.skillshift.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jakarta.enterprise.context.ApplicationScoped;

import br.com.skillshift.config.ConnectionFactory;
import br.com.skillshift.dao.UsuarioDAO;
import br.com.skillshift.model.Usuario;

@ApplicationScoped
public class UsuarioDAOImpl implements UsuarioDAO {

    private static final String BASE_SELECT = "SELECT id_usuario, nome, email, senha_hash, idade, escolaridade, area_atual, "
            + "nivel_risco, tipo_perfil, criado_em FROM TB_USUARIO";

    @Override
    public List<Usuario> listarTodos() {
        List<Usuario> usuarios = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(BASE_SELECT);
                ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                usuarios.add(mapUsuario(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar usuários", e);
        }
        return usuarios;
    }

    @Override
    public Optional<Usuario> buscarPorId(Long id) {
        String sql = BASE_SELECT + " WHERE id_usuario = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapUsuario(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar usuário por ID", e);
        }
        return Optional.empty();
    }

    @Override
    public Optional<Usuario> buscarPorEmail(String email) {
        String sql = BASE_SELECT + " WHERE email = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapUsuario(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar usuário por email", e);
        }
        return Optional.empty();
    }

    @Override
    public Usuario criar(Usuario usuario) {
        String sql = "INSERT INTO TB_USUARIO (nome, email, senha_hash, idade, escolaridade, area_atual, "
                + "nivel_risco, tipo_perfil, criado_em) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, new String[] { "id_usuario" })) {
            preencherStatementUsuario(statement, usuario);
            statement.executeUpdate();
            try (ResultSet rs = statement.getGeneratedKeys()) {
                if (rs.next()) {
                    usuario.setIdUsuario(rs.getLong(1));
                }
            }
            return usuario;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar usuário", e);
        }
    }

    @Override
    public void atualizar(Usuario usuario) {
        String sql = "UPDATE TB_USUARIO SET nome = ?, email = ?, senha_hash = ?, idade = ?, escolaridade = ?, "
                + "area_atual = ?, nivel_risco = ?, tipo_perfil = ?, criado_em = ? WHERE id_usuario = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            preencherStatementUsuario(statement, usuario);
            statement.setLong(10, usuario.getIdUsuario());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar usuário", e);
        }
    }

    @Override
    public void deletar(Long id) {
        String sql = "DELETE FROM TB_USUARIO WHERE id_usuario = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao deletar usuário", e);
        }
    }

    private void preencherStatementUsuario(PreparedStatement statement, Usuario usuario) throws SQLException {
        statement.setString(1, usuario.getNome());
        statement.setString(2, usuario.getEmail());
        statement.setString(3, usuario.getSenhaHash());
        if (usuario.getIdade() != null) {
            statement.setInt(4, usuario.getIdade());
        } else {
            statement.setNull(4, Types.INTEGER);
        }
        statement.setString(5, usuario.getEscolaridade());
        statement.setString(6, usuario.getAreaAtual());
        if (usuario.getNivelRisco() != null) {
            statement.setDouble(7, usuario.getNivelRisco());
        } else {
            statement.setNull(7, Types.DECIMAL);
        }
        statement.setString(8, usuario.getTipoPerfil());
        setLocalDate(statement, 9, usuario.getCriadoEm());
    }

    private Usuario mapUsuario(ResultSet rs) throws SQLException {
        Usuario usuario = new Usuario();
        usuario.setIdUsuario(rs.getObject("id_usuario", Long.class));
        usuario.setNome(rs.getString("nome"));
        usuario.setEmail(rs.getString("email"));
        usuario.setSenhaHash(rs.getString("senha_hash"));
        Object idade = rs.getObject("idade");
        usuario.setIdade(idade == null ? null : ((Number) idade).intValue());
        usuario.setEscolaridade(rs.getString("escolaridade"));
        usuario.setAreaAtual(rs.getString("area_atual"));
        Object nivel = rs.getObject("nivel_risco");
        usuario.setNivelRisco(nivel == null ? null : ((Number) nivel).doubleValue());
        usuario.setTipoPerfil(rs.getString("tipo_perfil"));
        var criadoEm = rs.getDate("criado_em");
        usuario.setCriadoEm(criadoEm != null ? criadoEm.toLocalDate() : null);
        return usuario;
    }

    private void setLocalDate(PreparedStatement statement, int index, LocalDate date) throws SQLException {
        if (date != null) {
            statement.setDate(index, java.sql.Date.valueOf(date));
        } else {
            statement.setNull(index, Types.DATE);
        }
    }
}
