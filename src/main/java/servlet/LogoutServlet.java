package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logout(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        logout(request, response);
    }

    private void logout(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Get the current session, don't create a new one
        HttpSession session = request.getSession(false);

        if (session != null) {
            // Invalidate the session to log the user out
            session.invalidate();
        }

        // Clear any authentication cookies (if you're using them)
        // Cookie[] cookies = request.getCookies();
        // if (cookies != null) {
        //     for (Cookie cookie : cookies) {
        //         if ("JSESSIONID".equals(cookie.getName())) {
        //             cookie.setValue("");
        //             cookie.setPath("/");
        //             cookie.setMaxAge(0);
        //             response.addCookie(cookie);
        //         }
        //     }
        // }

        // Redirect to login page with logout success message
        response.sendRedirect("index.jsp?logout=success");
    }

}
