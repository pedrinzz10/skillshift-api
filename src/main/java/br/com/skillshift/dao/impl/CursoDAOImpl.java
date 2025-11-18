package br.com.skillshift.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jakarta.enterprise.context.ApplicationScoped;

import br.com.skillshift.config.ConnectionFactory;
import br.com.skillshift.dao.CursoDAO;
import br.com.skillshift.model.Curso;

@ApplicationScoped
public class CursoDAOImpl implements CursoDAO {

    private static final String BASE_SELECT = "SELECT id_curso, nome, categoria, duracao_horas, plataforma, nivel, ativo FROM TB_CURSO";

    @Override
    public List<Curso> listarTodos() {
        List<Curso> cursos = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(BASE_SELECT);
                ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                cursos.add(mapCurso(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar cursos", e);
        }
        return cursos;
    }

    @Override
    public Optional<Curso> buscarPorId(Long id) {
        String sql = BASE_SELECT + " WHERE id_curso = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapCurso(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar curso por ID", e);
        }
        return Optional.empty();
    }

    @Override
    public Curso criar(Curso curso) {
        String sql = "INSERT INTO TB_CURSO (nome, categoria, duracao_horas, plataforma, nivel, ativo) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, new String[] { "id_curso" })) {
            preencherStatementCurso(statement, curso);
            statement.executeUpdate();
            try (ResultSet rs = statement.getGeneratedKeys()) {
                if (rs.next()) {
                    curso.setIdCurso(rs.getLong(1));
                }
            }
            return curso;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar curso", e);
        }
    }

    @Override
    public void atualizar(Curso curso) {
        String sql = "UPDATE TB_CURSO SET nome = ?, categoria = ?, duracao_horas = ?, plataforma = ?, nivel = ?, ativo = ? "
                + "WHERE id_curso = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            preencherStatementCurso(statement, curso);
            statement.setLong(7, curso.getIdCurso());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar curso", e);
        }
    }

    @Override
    public void deletar(Long id) {
        String sql = "DELETE FROM TB_CURSO WHERE id_curso = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao deletar curso", e);
        }
    }

    private void preencherStatementCurso(PreparedStatement statement, Curso curso) throws SQLException {
        statement.setString(1, curso.getNome());
        statement.setString(2, curso.getCategoria());
        if (curso.getDuracaoHoras() != null) {
            statement.setInt(3, curso.getDuracaoHoras());
        } else {
            statement.setNull(3, Types.INTEGER);
        }
        statement.setString(4, curso.getPlataforma());
        statement.setString(5, curso.getNivel());
        statement.setString(6, Boolean.TRUE.equals(curso.getAtivo()) ? "S" : "N");
    }

    private Curso mapCurso(ResultSet rs) throws SQLException {
        Curso curso = new Curso();
        curso.setIdCurso(rs.getObject("id_curso", Long.class));
        curso.setNome(rs.getString("nome"));
        curso.setCategoria(rs.getString("categoria"));
        Object duracao = rs.getObject("duracao_horas");
        curso.setDuracaoHoras(duracao == null ? null : ((Number) duracao).intValue());
        curso.setPlataforma(rs.getString("plataforma"));
        curso.setNivel(rs.getString("nivel"));
        curso.setAtivo(parseAtivo(rs.getString("ativo")));
        return curso;
    }

    private Boolean parseAtivo(String value) {
        if (value == null) {
            return null;
        }
        return "S".equalsIgnoreCase(value.trim());
    }
}
