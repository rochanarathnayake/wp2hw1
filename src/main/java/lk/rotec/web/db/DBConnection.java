package lk.rotec.web.db;

import lk.rotec.web.util.ApplicationProperties;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.ResultSet;

public class DBConnection {
    private static Connection connection;


    private static Statement createConnection() throws Exception {
        ApplicationProperties properties = ApplicationProperties.getInstance();
        if (connection == null) {
            Class.forName(properties.get("sql.connection.driver"));
            connection = DriverManager.getConnection(
                    properties.get("sql.connection.url"),
                    properties.get("sql.connection.username"),
                    properties.get("sql.connection.password"));
        }
        Statement statement = connection.createStatement();
        return statement;
    }

    public static void iud(String query) {
        try {
            createConnection().executeUpdate(query);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static ResultSet search(String query) throws Exception {
        return createConnection().executeQuery(query);
    }


    public static Connection getConnection() throws Exception {
        ApplicationProperties properties = ApplicationProperties.getInstance();
        Class.forName(properties.get("sql.connection.driver"));

        connection = DriverManager.getConnection(
                properties.get("sql.connection.url"),
                properties.get("sql.connection.username"),
                properties.get("sql.connection.password"));

        return connection;
    }
}
