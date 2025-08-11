package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Bill;
import service.BillService;

import java.io.IOException;
@WebServlet("/calculateBill")
public class CalculateBillServlet extends HttpServlet {
    private BillService billService = new BillService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumber = request.getParameter("accountNumber");
        String rateStr = request.getParameter("ratePerUnit");
        String totalAmountStr = request.getParameter("totalAmount");

        try {
            if (accountNumber == null || accountNumber.trim().isEmpty() ||
                    rateStr == null || rateStr.trim().isEmpty() ||
                    totalAmountStr == null || totalAmountStr.trim().isEmpty()) {

                request.setAttribute("error", "Account number, rate per unit and total amount are required.");
                request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
                return;
            }

            double ratePerUnit = Double.parseDouble(rateStr);
            double totalAmount = Double.parseDouble(totalAmountStr);

            Bill bill = billService.calculateBill(accountNumber, ratePerUnit);
            bill.setTotalAmount(totalAmount);  // Set totalAmount from form

            boolean saved = billService.saveBill(bill);

            if (!saved) {
                request.setAttribute("error", "Failed to save bill to database.");
                request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
                return;
            }

            request.setAttribute("bill", bill);
            request.getRequestDispatcher("printBill.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.getRequestDispatcher("calculateBill.jsp").forward(request, response);
        }

    }
}

