package com.pahanaEdu.servlet;
import com.pahanaEdu.model.User;
import com.pahanaEdu.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

public class LoginServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        User user = new User(username, password);

        try {
            if (userDAO.validate(user) ) {
                request.getSession().setAttribute("loginSuccess", "Login successful!");
                response.sendRedirect("Home.jsp");

            } else {
                response.sendRedirect("index.jsp?error=true");

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

}
