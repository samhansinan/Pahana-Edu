package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bill;
import model.BillItem;
import service.BillService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/calculateBill")
public class CalculateBillServlet extends HttpServlet {
    private BillService billService = new BillService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String accountNumber = request.getParameter("accountNumber");

            String[] itemIds = request.getParameterValues("itemId[]");
            String[] prices = request.getParameterValues("price[]");
            String[] unitsArr = request.getParameterValues("units[]");

            if (accountNumber == null || accountNumber.trim().isEmpty() ||
                    itemIds == null || prices == null || unitsArr == null ||
                    itemIds.length == 0 || prices.length == 0 || unitsArr.length == 0) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
                return;
            }

            Bill bill = new Bill();
            bill.setAccountNumber(accountNumber);

            List<BillItem> items = new ArrayList<>();
            double totalAmount = 0;
            int totalUnitsConsumed = 0;

            for (int i = 0; i < itemIds.length; i++) {
                BillItem item = new BillItem();

                // You can convert item ID to item name here if you want, or send item names in the form
                item.setItemName(itemIds[i]);  // For now using item ID as name

                double price = Double.parseDouble(prices[i]);
                int units = Integer.parseInt(unitsArr[i]);

                item.setPrice(price);
                item.setUnits(units);
                item.setSubtotal(price * units);

                items.add(item);

                totalAmount += item.getSubtotal();
                totalUnitsConsumed += units;
            }

            bill.setItems(items);
            bill.setTotalAmount(totalAmount);
            bill.setUnitsConsumed(totalUnitsConsumed);

            // For simplicity, set ratePerUnit as totalAmount / totalUnitsConsumed or any logic you want
            double ratePerUnit = totalUnitsConsumed > 0 ? totalAmount / totalUnitsConsumed : 0;
            bill.setRatePerUnit(ratePerUnit);

            boolean saved = billService.saveBillWithItems(bill);

            if (!saved) {
                request.setAttribute("error", "Failed to save bill to database.");
                request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
                return;
            }

            request.setAttribute("bill", bill);
            request.getRequestDispatcher("printBill.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error processing bill: " + e.getMessage());
            request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
        }
    }
}

