package org.example.utilities;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import  java.sql.Statement;

public class DBconnection {
    String PILOTE = "com.mysql.jdbc.Driver";
    static String user = "root";
    static String password = "";
    static String url = "jdbc:mysql://localhost:3306/gestion-app-absence";
    static Connection connection=null;

    // Connexion à la base de données
    public static Connection getMyConnexion() throws ClassNotFoundException,
            SQLException {
        Class.forName("com.mysql.jdbc.Driver");

        connection = DriverManager.getConnection(url, user, password);

        return connection;
    }


}
