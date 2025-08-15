package servlet;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Customer;
import service.CustomerService;

import java.io.IOException;

public class UpdateCustomerServlet extends HttpServlet {
    private CustomerService customerService = new CustomerService(); // use service layer

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accountNumber = request.getParameter("accountNumber");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String telephone = request.getParameter("telephone");
        int units = Integer.parseInt(request.getParameter("units"));

        Customer customer = new Customer();
        customer.setAccountNumber(accountNumber);
        customer.setName(name);
        customer.setAddress(address);
        customer.setTelephone(telephone);
        customer.setUnitsConsumed(units);

        String message = customerService.updateCustomer(customer);

        if (message.equals("Customer updated successfully.")) {
            response.sendRedirect("addCustomer.jsp"); // or customer list page
        } else {
            request.setAttribute("error", message);
            request.getRequestDispatcher("editCustomer.jsp").forward(request, response);
        }
    }
}
