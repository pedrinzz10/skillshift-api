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
import br.com.skillshift.dao.RecomendacaoDAO;
import br.com.skillshift.model.Recomendacao;

@ApplicationScoped
public class RecomendacaoDAOImpl implements RecomendacaoDAO {

    private static final String BASE_SELECT = "SELECT id_recomendacao, id_usuario, id_curso, score, fonte, status, data_recomendacao, cluster, payload_ia FROM t_skillshift_recomendacao";

    @Override
    public List<Recomendacao> listarTodos() {
        List<Recomendacao> recomendacoes = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(BASE_SELECT);
                ResultSet rs = statement.executeQuery()) {
            while (rs.next()) {
                recomendacoes.add(mapRecomendacao(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar recomendações", e);
        }
        return recomendacoes;
    }

    @Override
    public List<Recomendacao> listarPorUsuario(Long usuarioId) {
        String sql = BASE_SELECT + " WHERE id_usuario = ?";
        List<Recomendacao> recomendacoes = new ArrayList<>();
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, usuarioId);
            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    recomendacoes.add(mapRecomendacao(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar recomendações por usuário", e);
        }
        return recomendacoes;
    }

    @Override
    public Optional<Recomendacao> buscarPorId(Long id) {
        String sql = BASE_SELECT + " WHERE id_recomendacao = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    return Optional.of(mapRecomendacao(rs));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao buscar recomendação por ID", e);
        }
        return Optional.empty();
    }

    @Override
    public Recomendacao criar(Recomendacao recomendacao) {
        String sql = "INSERT INTO t_skillshift_recomendacao (id_usuario, id_curso, score, fonte, status, data_recomendacao, cluster, payload_ia) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql, new String[] { "id_recomendacao" })) {
            preencherStatementRecomendacao(statement, recomendacao);
            statement.executeUpdate();
            try (ResultSet rs = statement.getGeneratedKeys()) {
                if (rs.next()) {
                    recomendacao.setIdRecomendacao(rs.getLong(1));
                }
            }
            return recomendacao;
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao criar recomendação", e);
        }
    }

    @Override
    public void atualizar(Recomendacao recomendacao) {
        String sql = "UPDATE t_skillshift_recomendacao SET id_usuario = ?, id_curso = ?, score = ?, fonte = ?, status = ?, data_recomendacao = ?, cluster = ?, payload_ia = ? "
                + "WHERE id_recomendacao = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            preencherStatementRecomendacao(statement, recomendacao);
            statement.setLong(9, recomendacao.getIdRecomendacao());
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao atualizar recomendação", e);
        }
    }

    @Override
    public void deletar(Long id) {
        String sql = "DELETE FROM t_skillshift_recomendacao WHERE id_recomendacao = ?";
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao deletar recomendação", e);
        }
    }

    private void preencherStatementRecomendacao(PreparedStatement statement, Recomendacao recomendacao) throws SQLException {
        statement.setLong(1, recomendacao.getIdUsuario());
        statement.setLong(2, recomendacao.getIdCurso());
        if (recomendacao.getScore() != null) {
            statement.setDouble(3, recomendacao.getScore());
        } else {
            statement.setNull(3, Types.DECIMAL);
        }
        statement.setString(4, recomendacao.getFonte());
        statement.setString(5, recomendacao.getStatus());
        setLocalDate(statement, 6, recomendacao.getDataRecomendacao());
        if (recomendacao.getCluster() != null) {
            statement.setInt(7, recomendacao.getCluster());
        } else {
            statement.setNull(7, Types.INTEGER);
        }
        statement.setString(8, recomendacao.getPayloadIa());
    }

    private Recomendacao mapRecomendacao(ResultSet rs) throws SQLException {
        Recomendacao recomendacao = new Recomendacao();
        recomendacao.setIdRecomendacao(rs.getObject("id_recomendacao", Long.class));
        recomendacao.setIdUsuario(rs.getObject("id_usuario", Long.class));
        recomendacao.setIdCurso(rs.getObject("id_curso", Long.class));
        Object score = rs.getObject("score");
        recomendacao.setScore(score == null ? null : ((Number) score).doubleValue());
        recomendacao.setFonte(rs.getString("fonte"));
        recomendacao.setStatus(rs.getString("status"));
        var data = rs.getDate("data_recomendacao");
        recomendacao.setDataRecomendacao(data != null ? data.toLocalDate() : null);
        recomendacao.setCluster(rs.getObject("cluster", Integer.class));
        recomendacao.setPayloadIa(rs.getString("payload_ia"));
        return recomendacao;
    }

    private void setLocalDate(PreparedStatement statement, int index, LocalDate date) throws SQLException {
        if (date != null) {
            statement.setDate(index, java.sql.Date.valueOf(date));
        } else {
            statement.setNull(index, Types.DATE);
        }
    }
}

