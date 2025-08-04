package com.pahanaEdu.dao;

import com.pahanaEdu.model.User;

import java.sql.*;

public class UserDAO {
    private final String jdbcURL = "jdbc:mysql://localhost:3306/pahanaedudb";
            ;
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "";

    private static final String LOGIN_SQL = "SELECT * FROM users WHERE username = ? AND password = ?";

    public boolean validate(User user) throws ClassNotFoundException{
        boolean status = false;
        Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement ps = connection.prepareStatement(LOGIN_SQL)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}
