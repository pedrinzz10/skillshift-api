package br.com.skillshift.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import jakarta.enterprise.context.ApplicationScoped;

import br.com.skillshift.config.ConnectionFactory;
import br.com.skillshift.dao.EmpresaDAO;
import br.com.skillshift.model.Empresa;

@ApplicationScoped
public class EmpresaDAOImpl implements EmpresaDAO {

    private static final String BASE_SELECT = "SELECT id_empresa, nome, setor, tamanho, cnpj FROM TB_EMPRESA";

    @Override
    public List<Empresa> listarTodos() {
        List<Empresa> empresas = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(BASE_SELECT);
                ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                empresas.add(mapEmpresa(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar empresas", e);
        }
        return empresas;
    }

    @Override
    public Optional<Empresa> buscarPorId(Long id) {
        String sql = BASE_SELECT + " WHERE id_empresa = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapEmpresa(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar empresa por ID", e);
        }
        return Optional.empty();
    }

    @Override
    public Empresa criar(Empresa empresa) {
        String sql = "INSERT INTO TB_EMPRESA (nome, setor, tamanho, cnpj) VALUES (?, ?, ?, ?)";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, new String[] { "id_empresa" })) {
            preencherStatementEmpresa(statement, empresa);
            statement.executeUpdate();
            try (ResultSet rs = statement.getGeneratedKeys()) {
                if (rs.next()) {
                    empresa.setIdEmpresa(rs.getLong(1));
                }
            }
            return empresa;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar empresa", e);
        }
    }

    @Override
    public void atualizar(Empresa empresa) {
        String sql = "UPDATE TB_EMPRESA SET nome = ?, setor = ?, tamanho = ?, cnpj = ? WHERE id_empresa = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            preencherStatementEmpresa(statement, empresa);
            statement.setLong(5, empresa.getIdEmpresa());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar empresa", e);
        }
    }

    @Override
    public void deletar(Long id) {
        String sql = "DELETE FROM TB_EMPRESA WHERE id_empresa = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao deletar empresa", e);
        }
    }

    private void preencherStatementEmpresa(PreparedStatement statement, Empresa empresa) throws SQLException {
        statement.setString(1, empresa.getNome());
        statement.setString(2, empresa.getSetor());
        statement.setString(3, empresa.getTamanho());
        statement.setString(4, empresa.getCnpj());
    }

    private Empresa mapEmpresa(ResultSet rs) throws SQLException {
        Empresa empresa = new Empresa();
        empresa.setIdEmpresa(rs.getObject("id_empresa", Long.class));
        empresa.setNome(rs.getString("nome"));
        empresa.setSetor(rs.getString("setor"));
        empresa.setTamanho(rs.getString("tamanho"));
        empresa.setCnpj(rs.getString("cnpj"));
        return empresa;
    }
}
