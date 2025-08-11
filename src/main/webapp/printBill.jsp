<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Bill" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    if (bill == null) {
        out.println("No bill data available.");
        return;
    }
%>

<h2>Bill Details</h2>
<table>
    <tr><td>Account Number:</td><td><%= bill.getAccountNumber() %></td></tr>
    <tr><td>Units Consumed:</td><td><%= bill.getUnitsConsumed() %></td></tr>
    <tr><td>Rate Per Unit:</td><td><%= bill.getRatePerUnit() %></td></tr>
    <tr><td>Total Amount:</td><td><%= bill.getTotalAmount() %></td></tr>
</table>

<a href="calculateBill.jsp">Back</a>
