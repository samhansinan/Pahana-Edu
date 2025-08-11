package dao;

import model.Bill;
import model.BillItem;

import java.sql.*;
import java.util.List;


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

    // Insert bill and bill items in transaction
    public boolean saveBillWithItems(Bill bill) {
        String insertBillSQL = "INSERT INTO bills (account_number, units_consumed, rate_per_unit, total_amount) VALUES (?, ?, ?, ?)";
        String insertItemSQL = "INSERT INTO bill_items (bill_id, item_name, price, units, subtotal) VALUES (?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement billStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet generatedKeys = null;

        try {
            conn = com.pahanaEdu.util.DBUtil.getConnection();
            conn.setAutoCommit(false);  // start transaction

            billStmt = conn.prepareStatement(insertBillSQL, Statement.RETURN_GENERATED_KEYS);
            billStmt.setString(1, bill.getAccountNumber());
            billStmt.setInt(2, bill.getUnitsConsumed());
            billStmt.setDouble(3, bill.getRatePerUnit());
            billStmt.setDouble(4, bill.getTotalAmount());

            int affectedRows = billStmt.executeUpdate();
            if (affectedRows == 0) {
                conn.rollback();
                throw new SQLException("Creating bill failed, no rows affected.");
            }

            generatedKeys = billStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                int billId = generatedKeys.getInt(1);

                itemStmt = conn.prepareStatement(insertItemSQL);
                List<BillItem> items = bill.getItems();
                for (BillItem item : items) {
                    itemStmt.setInt(1, billId);
                    itemStmt.setString(2, item.getItemName());
                    itemStmt.setDouble(3, item.getPrice());
                    itemStmt.setInt(4, item.getUnits());
                    itemStmt.setDouble(5, item.getSubtotal());
                    itemStmt.addBatch();
                }
                itemStmt.executeBatch();

                conn.commit();
                return true;
            } else {
                conn.rollback();
                throw new SQLException("Creating bill failed, no ID obtained.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                if (conn != null) conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            return false;
        } finally {
            try {
                if (generatedKeys != null) generatedKeys.close();
                if (billStmt != null) billStmt.close();
                if (itemStmt != null) itemStmt.close();
                if (conn != null) {
                    conn.setAutoCommit(true);
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
