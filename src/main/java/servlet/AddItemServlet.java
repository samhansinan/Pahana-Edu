package servlet;


import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;
import service.ItemService;

import java.io.IOException;

public class AddItemServlet extends HttpServlet {
    private ItemService itemService = new ItemService(); // use service layer

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

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

            // Use service instead of DAO directly
            String message = itemService.addItem(item);

            if (message.equals("Item added successfully.")) {
                request.setAttribute("message", message);
            } else {
                request.setAttribute("error", message);
            }

        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid number format for price or quantity.");
        }

        request.getRequestDispatcher("additem.jsp").forward(request, response);
    }
}

