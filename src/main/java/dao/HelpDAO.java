package dao;

import model.HelpTopic;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class HelpDAO {
    private static HelpDAO instance;

    private HelpDAO() {}

    public static HelpDAO getInstance() {
        if(instance == null) instance = new HelpDAO();
        return instance;
    }

    public List<HelpTopic> getAllTopics() {
        List<HelpTopic> topics = new ArrayList<>();
        String sql = "SELECT * FROM help_topics";
        try (Connection conn = com.pahanaEdu.util.DBUtil.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while(rs.next()) {
                HelpTopic topic = new HelpTopic();
                topic.setId(rs.getInt("id"));
                topic.setTitle(rs.getString("title"));
                topic.setContent(rs.getString("content"));
                topic.setCategory(rs.getString("category"));
                topics.add(topic);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return topics;
    }
}
