package dao;

import model.Customer;
import model.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {
    public void addItem(Item item) throws Exception{
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();

        String sql = "INSERT INTO item(name,price, quantity) VALUES (?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, item.getName());
        stmt.setDouble(2, item.getPrice());
        stmt.setInt(3, item.getQuantity());

        stmt.executeUpdate();
        stmt.close();

    }

    public List<Item> getItems() throws Exception{
        List<Item> items = new ArrayList<Item>();
        Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
        String sql = "SELECT * FROM items";
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

        while(rs.next()){
            Item item = new Item();
            item.setName(rs.getString("name"));
            item.setPrice(rs.getDouble("price"));
            item.setQuantity(rs.getInt("quantity"));
            items.add(item);

        }
        stmt.close();
        return items;
    }
}
