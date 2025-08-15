package servlet;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;

import java.io.IOException;

@WebServlet("/displayCustomer")
public class DisplayCustomerServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");

        if (accountNumber == null || accountNumber.isEmpty()) {
            request.setAttribute("error", "Please enter a valid account number.");
            request.getRequestDispatcher("displayCustomer.jsp").forward(request, response);
            return;
        }

        try {
            CustomerDAO dao = new CustomerDAO();
            Customer customer = dao.getCustomerByAccount(accountNumber);

            if (customer != null) {
                request.setAttribute("customer", customer);
            } else {
                request.setAttribute("error", "Customer account not found.");
            }

            request.getRequestDispatcher("displayCustomer.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error retrieving customer details: " + e.getMessage());
            request.getRequestDispatcher("displayCustomer.jsp").forward(request, response);
        }
    }
}
