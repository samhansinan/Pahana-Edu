<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Bill" %>
<%
    Bill bill = (Bill) request.getAttribute("bill");
    if (bill == null) {
        out.println("No bill data available.");
        return;
    }
%>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f9fafb;
        color: #333;
        padding: 20px;
    }

    h2 {
        color: #2c3e50;
        font-weight: 600;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        max-width: 600px;
        border-collapse: collapse;
        margin-bottom: 30px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        background: #fff;
        border-radius: 8px;
        overflow: hidden;
    }

    table tr {
        border-bottom: 1px solid #e1e8ed;
    }

    table tr:last-child {
        border-bottom: none;
    }

    table td {
        padding: 15px 20px;
    }

    table td:first-child {
        font-weight: 600;
        background: #f4f7fa;
        width: 40%;
        color: #34495e;
    }

    table td:last-child {
        text-align: right;
        color: #2c3e50;
    }

    a {
        display: inline-block;
        text-decoration: none;
        background-color: #3498db;
        color: white;
        padding: 10px 18px;
        border-radius: 6px;
        font-weight: 600;
        transition: background-color 0.3s ease;
    }

    a:hover {
        background-color: #2980b9;
    }
</style>

<h2>Bill Details</h2>
<table>
    <tr><td>Account Number:</td><td><%= bill.getAccountNumber() %></td></tr>
    <tr><td>Units Consumed:</td><td><%= bill.getUnitsConsumed() %></td></tr>
    <tr><td>Rate Per Unit:</td><td><%= bill.getRatePerUnit() %></td></tr>
    <tr><td>Total Amount:</td><td><%= bill.getTotalAmount() %></td></tr>
</table>

<a href="calculateBill.jsp">Back</a>
