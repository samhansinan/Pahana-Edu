package servlet;


import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

import java.io.IOException;

@WebServlet("/updateItem")
public class UpdateItemServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String itemIdStr = request.getParameter("item_id");
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");

        try {
            int itemId = Integer.parseInt(itemIdStr);
            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            Item item = new Item();
            item.setItemId(itemId);
            item.setName(name);
            item.setPrice(price);
            item.setQuantity(quantity);

            ItemDAO dao = new ItemDAO();
            dao.updateItem(item);

            // ✅ Only redirect on success
            response.sendRedirect("additem.jsp");

        } catch (Exception e) {
            e.printStackTrace();

            // ✅ Only forward on failure — don’t redirect before this
            request.setAttribute("error", "Update failed: " + e.getMessage());
            request.getRequestDispatcher("editItem.jsp").forward(request, response);
        }
    }
}
