package service;
import dao.FakeUserDAO;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;
public class UserServiceTest {
    private UserService userService;

    @Before
    public void setUp() {
        // Inject the fake DAO for testing
        userService = new UserService(new FakeUserDAO());
    }

    @Test
    public void testLoginSuccess() {
        com.pahanaEdu.model.User user = new com.pahanaEdu.model.User("admin", "password123");
        String result = userService.login(user);
        System.out.println("Login Success: " + result.equals("SUCCESS"));
        assertEquals("SUCCESS", result);
    }

    @Test
    public void testLoginInvalidUser() {
        com.pahanaEdu.model.User user = new com.pahanaEdu.model.User("user", "wrongpass");
        String result = userService.login(user);
        System.out.println("Login Invalid User: " + result.equals("Invalid username or password!"));
        assertEquals("Invalid username or password!", result);
    }

    @Test
    public void testLoginEmptyUsername() {
        com.pahanaEdu.model.User user = new com.pahanaEdu.model.User("", "password123");
        String result = userService.login(user);
        System.out.println("Login Empty Username: " + result.equals("Username cannot be empty."));
        assertEquals("Username cannot be empty.", result);
    }

    @Test
    public void testLoginEmptyPassword() {
        com.pahanaEdu.model.User user = new com.pahanaEdu.model.User("admin", "");
        String result = userService.login(user);
        System.out.println("Login Empty Password: " + result.equals("Password cannot be empty."));
        assertEquals("Password cannot be empty.", result);
    }
}
