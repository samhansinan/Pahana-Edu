package servlet;


import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

import java.io.IOException;

public class AddItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String qtyStr = request.getParameter("quantity");

        // Basic validation
        if (name == null || name.isEmpty() || priceStr == null || qtyStr == null) {
            request.setAttribute("error", "Please fill in all fields correctly.");
            request.getRequestDispatcher("additem.jsp").forward(request, response);
            return;
        }

        try {
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(qtyStr);

            Item item = new Item(name, price, quantity);
            ItemDAO dao = new ItemDAO();

            if (dao.addItem(item)) {
                request.setAttribute("message", "Item added successfully.");
            } else {
                request.setAttribute("error", "Failed to add item.");
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format.");
        }

        request.getRequestDispatcher("additem.jsp").forward(request, response);
    }
}

