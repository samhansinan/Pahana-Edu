package dao;

public class FakeUserDAO extends com.pahanaEdu.dao.UserDAO {
    @Override
    public boolean validate(com.pahanaEdu.model.User user) {
        // Fake validation logic
        if ("admin".equals(user.getUsername()) && "password123".equals(user.getPassword())) {
            return true; // valid user
        }
        return false; // invalid user
    }
}
