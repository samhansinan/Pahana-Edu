package dao;

import model.Customer;
import model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


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

    public List<Item> getAllItem() throws Exception{
        List<Item> list = new ArrayList<>();
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT * FROM items";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
            Item c = new Item();
            c.setItemId(rs.getInt("item_id"));
            c.setName(rs.getString("name"));
           c.setPrice(rs.getDouble("price"));
            c.setQuantity(rs.getInt("quantity"));
            list.add(c);
        }
        conn.close();
        return list;
    }

    public Item getItemId(String itemId) throws Exception{
        Item c = null;
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT * FROM items WHERE item_id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
       stmt.setString(1, itemId);

        ResultSet rs = stmt.executeQuery();
        if (rs.next()){
            c = new Item();
            c.setItemId(rs.getInt("item_id"));
            c.setName(rs.getString("name"));
            c.setPrice(rs.getDouble("price"));
            c.setQuantity(rs.getInt("quantity"));

        }
        conn.close();
        return c;
    }

    public void deleteItem(String itemid) throws Exception{
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "DELETE FROM items WHERE item_id=?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(itemid));
        stmt.executeUpdate();
        conn.close();
    }
}
