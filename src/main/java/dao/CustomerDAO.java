package dao;

import model.Customer;


import java.sql.Connection;
import java.sql.PreparedStatement;
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

}
