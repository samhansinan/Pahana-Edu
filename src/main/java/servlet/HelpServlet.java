package servlet;

import dao.HelpDAO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.HelpTopic;

import java.io.IOException;
import java.util.List;

@WebServlet("/help")
public class HelpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HelpDAO helpDAO = HelpDAO.getInstance();
        List<HelpTopic> topics = helpDAO.getAllTopics();
        request.setAttribute("helpTopics", topics);
        RequestDispatcher dispatcher = request.getRequestDispatcher("help.jsp");
        dispatcher.forward(request, response);
    }
}
