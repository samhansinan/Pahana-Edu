<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Customer, model.BillItem, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link href="Css/addcustomer.css" rel="stylesheet">
</head>
<style>
    /* Container inside main content */
    .display-container {
        background: white;
        border-radius: 12px;
        padding: 32px;
        border: 1px solid #e5e9f2;
        box-shadow: 0 1px 5px rgba(0,0,0,0.05);
        max-width: 800px;
        margin: 0 auto;
        animation: fadeInUp 0.5s ease-out;
    }

    /* Header */
    .display-container h2 {
        font-size: 24px;
        font-weight: 600;
        color: #1e293b;
        margin-bottom: 24px;
        text-align: center;
    }

    /* Form Styling */
    .display-container form {
        display: flex;
        gap: 12px;
        justify-content: center;
        margin-bottom: 24px;
    }

    .display-container input[type="text"] {
        padding: 12px 16px;
        border-radius: 8px;
        border: 1px solid #d1d5db;
        font-size: 14px;
        flex: 1;
        transition: all 0.2s;
    }

    .display-container input[type="text"]:focus {
        border-color: #4f46e5;
        box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.1);
        outline: none;
    }

    .display-container input[type="submit"] {
        background: #4f46e5;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 14px;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s;
    }

    .display-container input[type="submit"]:hover {
        background: #4338ca;
        transform: translateY(-1px);
        box-shadow: 0 4px 12px rgba(79,70,229,0.3);
    }

    /* Error Message */
    .display-container .error {
        color: #ef4444;
        font-weight: 500;
        text-align: center;
        margin-bottom: 20px;
    }

    /* Customer Details Table */
    .display-container table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        color: #334155;
        margin-top: 16px;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 1px 3px rgba(0,0,0,0.05);
    }

    .display-container table th,
    .display-container table td {
        padding: 12px 16px;
        text-align: left;
        border-bottom: 1px solid #e5e9f2;
    }

    .display-container table th {
        background-color: #f1f5f9;
        font-weight: 600;
        color: #1e293b;
    }

    .display-container table tr:nth-child(even) {
        background-color: #f9fafb;
    }

    .display-container table tr:hover {
        background-color: #f1f7ff;
    }

    /* Label column */
    .display-container table td:first-child {
        font-weight: 500;
        color: #64748b;
        width: 40%;
    }

    /* Value column */
    .display-container table td:last-child {
        color: #1e293b;
    }

    /* Animation */
    @keyframes fadeInUp {
        from {opacity: 0; transform: translateY(20px);}
        to {opacity: 1; transform: translateY(0);}
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
        .display-container form {
            flex-direction: column;
        }

        .display-container input[type="text"],
        .display-container input[type="submit"] {
            width: 100%;
        }
    }


</style>
<body>
<div class="container">
    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="Home.jsp" class="nav-link">Dashboard</a></li>
            <li class="nav-item"><a href="addCustomer.jsp" class="nav-link">Add Customer</a></li>
            <li class="nav-item"><a href="calculateBill.jsp" class="nav-link">Calculate & Print Bill</a></li>
            <li class="nav-item"><a href="additem.jsp" class="nav-link ">Manage Item</a></li>
            <li class="nav-item"><a href="displayCustomer.jsp" class="nav-link active">Display Account</a></li>
            <li class="nav-item"><a href="help" class="nav-link">Help</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Exit</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="display-container">
            <h2>Display Customer Account Details</h2>

            <form action="displayCustomer" method="get">
                <input type="text" name="accountNumber" placeholder="Enter Account Number" required>
                <input type="submit" value="Search">
            </form>

            <%
                String error = (String) request.getAttribute("error");
                Customer customer = (Customer) request.getAttribute("customer");

                if (error != null) {
            %>
            <p class="error"><%= error %></p>
            <%
            } else if (customer != null) {
            %>
            <table>
                <tr><td>Account Number</td><td><%= customer.getAccountNumber() %></td></tr>
                <tr><td>Name</td><td><%= customer.getName() %></td></tr>
                <tr><td>Address</td><td><%= customer.getAddress() %></td></tr>
                <tr><td>Telephone</td><td><%= customer.getTelephone() %></td></tr>
                <tr><td>Units Consumed</td><td><%= customer.getUnitsConsumed() %></td></tr>
            </table>

            <%
                List<BillItem> purchasedItems = (List<BillItem>) request.getAttribute("purchasedItems");
                if (purchasedItems != null && !purchasedItems.isEmpty()) {
                    double totalBill = 0;
            %>
            <h3>Purchased Items</h3>
            <table>
                <tr>
                    <th>Item Id</th>
                    <th>Price</th>
                    <th>Units</th>
                    <th>Subtotal</th>
                </tr>
                <%
                    for (BillItem item : purchasedItems) {
                        totalBill += item.getSubtotal();
                %>
                <tr>
                    <td><%= item.getItemName() %></td>
                    <td><%= item.getPrice() %></td>
                    <td><%= item.getUnits() %></td>
                    <td><%= item.getSubtotal() %></td>
                </tr>
                <%
                    }
                %>
                <tr>
                    <td colspan="3" style="text-align: right; font-weight: bold;">Total Bill</td>
                    <td style="font-weight: bold;"><%= totalBill %></td>
                </tr>
            </table>
            <%
            } else {
            %>
            <p>No purchased items found for this account.</p>
            <%
                }
            %>
            <%
                }
            %>
        </div>
    </main>
</div>
</body>
</html>
