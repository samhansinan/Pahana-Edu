package dao;

import model.BillItem;
import model.Customer;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {

    public void addCustomer(Customer customer) throws Exception{
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();

        String sql = "INSERT INTO customers(account_number, name, address, telephone, units_consumed) VALUES (?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, customer.getAccountNumber());
        stmt.setString(2, customer.getName());
        stmt.setString(3, customer.getAddress());
        stmt.setString(4, customer.getTelephone());
        stmt.setInt(5, customer.getUnitsConsumed());

        stmt.executeUpdate();
        conn.close();
    }
    public List<Customer> getAllCustomers() throws Exception {
        List<Customer> list = new ArrayList<>();
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT * FROM customers";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Customer c = new Customer();
            c.setId(rs.getInt("id"));
            c.setAccountNumber(rs.getString("account_number"));
            c.setName(rs.getString("name"));
            c.setAddress(rs.getString("address"));
            c.setTelephone(rs.getString("telephone"));
            c.setUnitsConsumed(rs.getInt("units_consumed"));
            list.add(c);
        }
        conn.close();
        return list;
    }

    public Customer getCustomerByAccount(String accountNumber) throws Exception {
        Customer c = null;
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT * FROM customers WHERE account_number = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNumber);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            c = new Customer();
            c.setId(rs.getInt("id"));
            c.setAccountNumber(rs.getString("account_number"));
            c.setName(rs.getString("name"));
            c.setAddress(rs.getString("address"));
            c.setTelephone(rs.getString("telephone"));
            c.setUnitsConsumed(rs.getInt("units_consumed"));
        }
        conn.close();
        return c;
    }

    public void updateCustomer(Customer customer) throws Exception {
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "UPDATE customers SET name=?, address=?, telephone=?, units_consumed=? WHERE account_number=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, customer.getName());
        stmt.setString(2, customer.getAddress());
        stmt.setString(3, customer.getTelephone());
        stmt.setInt(4, customer.getUnitsConsumed());
        stmt.setString(5, customer.getAccountNumber());
        stmt.executeUpdate();
        conn.close();
    }

    public void deleteCustomer(String accountNumber) throws Exception {
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "DELETE FROM customers WHERE account_number=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNumber);
        stmt.executeUpdate();
        conn.close();
    }
    // New method: Get purchased items by account number
    public List<BillItem> getPurchasedItemsByAccount(String accountNumber) throws Exception {
        List<BillItem> items = new ArrayList<>();
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT bi.item_name, bi.price, bi.units, bi.subtotal " +
                "FROM bills b JOIN bill_items bi ON b.bill_id = bi.bill_id " +
                "WHERE b.account_number = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, accountNumber);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            BillItem item = new BillItem();
            item.setItemName(rs.getString("item_name"));
            item.setPrice(rs.getDouble("price"));
            item.setUnits(rs.getInt("units"));
            item.setSubtotal(rs.getDouble("subtotal"));
            items.add(item);
        }
        conn.close();
        return items;
    }
}
