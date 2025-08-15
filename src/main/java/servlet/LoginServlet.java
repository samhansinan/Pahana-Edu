package com.pahanaEdu.servlet;
import com.pahanaEdu.model.User;
import com.pahanaEdu.dao.UserDAO;

import jakarta.servlet.ServletException;

import jakarta.servlet.http.*;
import service.UserService;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() {
        userService = new UserService(); // use service layer
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);

        String result = userService.login(user);

        if (result.equals("SUCCESS")) {
            // Login successful
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("user", user);
            session.setMaxInactiveInterval(30 * 60); // 30 mins
            response.sendRedirect("Home.jsp");
        } else {
            // Login failed
            request.setAttribute("errorMessage", result);
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }

}
