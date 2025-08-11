package dao;

import model.Bill;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class BillDAO {
    // Get units consumed for customer
    public int getUnitsConsumed(String accountNumber) throws Exception {
        String sql = "SELECT units_consumed FROM customers WHERE account_number = ?";
        try (Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, accountNumber);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("units_consumed");
            } else {
                throw new Exception("Customer not found with account number: " + accountNumber);
            }
        }
    }

    // Insert bill into DB
    public boolean addBill(Bill bill) {
        String sql = "INSERT INTO bills (account_number, units_consumed, rate_per_unit, total_amount) VALUES (?, ?, ?, ?)";

        try (Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, bill.getAccountNumber());
            stmt.setInt(2, bill.getUnitsConsumed());
            stmt.setDouble(3, bill.getRatePerUnit());
            stmt.setDouble(4, bill.getTotalAmount());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
