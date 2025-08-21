package service;

public class UserService {
    private com.pahanaEdu.dao.UserDAO userDAO;

    public UserService() {
        this.userDAO = new com.pahanaEdu.dao.UserDAO();
    }

    // Constructor for injecting fake DAO
    public UserService(com.pahanaEdu.dao.UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public String login(com.pahanaEdu.model.User user) {
        if (user.getUsername() == null || user.getUsername().isEmpty()) {
            return "Username cannot be empty.";
        }
        if (user.getPassword() == null || user.getPassword().isEmpty()) {
            return "Password cannot be empty.";
        }

        try {
            boolean valid = userDAO.validate(user);
            return valid ? "SUCCESS" : "Invalid username or password!";
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return "Database error. Please try again.";
        }
    }
}
