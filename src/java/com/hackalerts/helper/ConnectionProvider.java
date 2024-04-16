package com.hackalerts.helper;

import java.sql.*;

public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con==null) {
                //loading driver class
                Class.forName("com.mysql.jdbc.Driver");
                //creating connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:8081/hackalerts", "root", "root");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}
