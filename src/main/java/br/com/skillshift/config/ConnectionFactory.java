package br.com.skillshift.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.eclipse.microprofile.config.ConfigProvider;

/**
 * Fabrica simples para obter conexoes Oracle via DriverManager.
 */
public final class ConnectionFactory {

    private static final String URL = ConfigProvider.getConfig().getValue("quarkus.datasource.jdbc.url", String.class);
    private static final String USER = ConfigProvider.getConfig().getValue("quarkus.datasource.username", String.class);
    private static final String PASSWORD = ConfigProvider.getConfig().getValue("quarkus.datasource.password", String.class);

    private ConnectionFactory() {
    }

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao conectar ao banco Oracle", e);
        }
    }
}
