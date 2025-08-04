package com.pahanaEdu.util;

import java.sql.Connection;
import java.sql.SQLException;

public class DBTest {
    public static void main(String[] args) {
        try (Connection conn = com.pahanaEdu.util.DBUtil.getConnection()) {
            if (conn != null) {
                System.out.println("✅ Database connected successfully!");
            } else {
                System.out.println("❌ Failed to connect to the database.");
            }
        } catch (SQLException e) {
            System.out.println("❌ Database connection error:");
            e.printStackTrace();
        }
    }
}
