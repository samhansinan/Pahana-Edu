package com.pahanaEdu.servlet;
import com.pahanaEdu.model.User;
import com.pahanaEdu.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        try {
            if (userDAO.validate(user)) {
                // Login successful
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("user", user);

                // Set session timeout (optional - 30 minutes)
                session.setMaxInactiveInterval(30 * 60);

                // Redirect to dashboard/home page
                response.sendRedirect("Home.jsp");

            } else {
                // Login failed
                request.setAttribute("errorMessage", "Invalid username or password!");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database connection error. Please try again.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect("index.jsp");
    }

}
