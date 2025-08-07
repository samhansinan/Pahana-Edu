package dao;

import model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;


public class ItemDAO {

    public boolean addItem(Item item) {
        boolean success = false;
        try (Connection conn = com.pahanaEdu.util.DBUtil.getConnection()) {
            String sql = "INSERT INTO items (name, price, quantity) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, item.getName());
            stmt.setDouble(2, item.getPrice());
            stmt.setInt(3, item.getQuantity());

            int rows = stmt.executeUpdate();
            success = rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }


}
