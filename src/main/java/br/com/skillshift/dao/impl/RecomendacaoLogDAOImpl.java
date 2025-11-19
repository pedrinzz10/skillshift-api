package br.com.skillshift.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

import br.com.skillshift.config.ConnectionFactory;
import br.com.skillshift.dao.RecomendacaoLogDAO;
import jakarta.enterprise.context.ApplicationScoped;

@ApplicationScoped
public class RecomendacaoLogDAOImpl implements RecomendacaoLogDAO {

    private static final String INSERT = "INSERT INTO t_skillshift_recomendacao_ia_log "
            + "(id_usuario, cluster, payload_envio, payload_retorno, status, erro) VALUES (?, ?, ?, ?, ?, ?)";

    @Override
    public void registrar(Long usuarioId, Integer cluster, String payloadEnvio, String payloadRetorno, String status, String erro) {
        try (Connection connection = ConnectionFactory.getConnection();
                PreparedStatement statement = connection.prepareStatement(INSERT)) {
            statement.setLong(1, usuarioId);
            if (cluster != null) {
                statement.setInt(2, cluster);
            } else {
                statement.setNull(2, Types.INTEGER);
            }
            statement.setString(3, payloadEnvio);
            statement.setString(4, payloadRetorno);
            statement.setString(5, status);
            statement.setString(6, erro);
            statement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao registrar log da IA", e);
        }
    }
}

