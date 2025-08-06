package servlet;

import dao.ItemDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Item;

import java.io.IOException;

public class AddItemServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       String Itemname =  request.getParameter("name");
      Double price =  Double.parseDouble(request.getParameter("price"));
        int qty = Integer.parseInt(request.getParameter("qty"));

        Item item = new Item();
        item.setName(Itemname);
        item.setPrice(price);
        item.setQuantity(qty);

        try {
            ItemDAO itemDAO = new ItemDAO();
            itemDAO.addItem(item);
            response.sendRedirect("addItem.jsp");

        }catch(Exception e){
            e.printStackTrace();
            request.setAttribute("Error", "ailed to add Item: " + e.getMessage());
            request.getRequestDispatcher("addItem.jsp").forward(request, response);
        }
    }
}
