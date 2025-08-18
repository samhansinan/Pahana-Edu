<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.CustomerDAO" %>
<%@ page import="model.Customer" %>

<%
    // Session check
    String userName = (String) session.getAttribute("username");
    if (userName == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    // Fetch customers
    CustomerDAO dao = new CustomerDAO();
    List<Customer> customers = dao.getAllCustomers();

    // Get messages from request
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Customer</title>
    <link href="Css/addcustomer.css" rel="stylesheet">
</head>
<style>
    /* CRUD Table */
    .table-container {
        margin-top: 40px;
        background: white;
        border-radius: 12px;
        padding: 24px;
        border: 1px solid #e5e9f2;
        box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
    }

    .crud-table {
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
        color: #334155;
    }

    .crud-table th,
    .crud-table td {
        padding: 12px 16px;
        text-align: left;
        border-bottom: 1px solid #e5e9f2;
    }

    .crud-table th {
        background-color: #f1f5f9;
        font-weight: 600;
        color: #1e293b;
    }

    .crud-table tr:hover {
        background-color: #f9fafb;
    }

    /* Action Buttons */
    .btn-warning {
        background-color: #f59e0b;
        color: white;
        padding: 6px 12px;
        border-radius: 6px;
        text-decoration: none;
        transition: background 0.3s;
    }

    .btn-warning:hover {
        background-color: #d97706;
    }

    .btn-danger {
        background-color: #ef4444;
        color: white;
        padding: 6px 12px;
        border-radius: 6px;
        text-decoration: none;
        transition: background 0.3s;
    }

    .btn-danger:hover {
        background-color: #dc2626;
    }

    .action-buttons {
        display: flex;
        gap: 8px;
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
            <li class="nav-item"><a href="addCustomer.jsp" class="nav-link active">Add Customer</a></li>
            <li class="nav-item"><a href="calculateBill.jsp" class="nav-link">Calculate & Print Bill</a></li>
            <li class="nav-item"><a href="additem.jsp" class="nav-link">Manage Item</a></li>
            <li class="nav-item"><a href="help" class="nav-link">Help</a></li>
            <li class="nav-item"><a href="logout" onclick="return confirmExit()" class="nav-link">Exit</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">

        <!-- Show success if available -->

        <% if (success != null) { %>
        <div style="color:green; font-weight:bold; margin-bottom:15px;"><%= success %></div>
        <% } %>

        <% if (error != null) { %>
        <div style="color:red; font-weight:bold; margin-bottom:15px;"><%= error %></div>
        <% } %>

        <!-- Success Message -->
        <div class="success-message" id="successMessage" style="display: none;">
            Customer added successfully!
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">Customer Information</h2>
                <p class="form-subtitle">Please fill in all the required information to add a new customer</p>
            </div>

            <form action="addCustomer" method="POST">
                <div class="form-section">
                    <h3 class="section-title">Personal Information</h3>
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Account Number:</label>
                            <input type="text" name="accountNumber" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required">Name:</label>
                            <input type="text" name="name" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Address:</label>
                            <input type="text" name="address" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required">Phone Number:</label>
                            <input type="tel" name="telephone" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required">Units Consumed:</label>
                            <input type="number" name="units" value="0" min="0" class="form-input" required>
                        </div>
                    </div>
                </div>

                <div class="button-group">
                    <button type="reset" class="btn btn-secondary">Reset Form</button>
                    <button type="button" class="btn btn-danger" onclick="window.history.back()">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Customer</button>
                </div>
            </form>
        </div>

        <!-- Customer Table -->
        <div class="table-container">
            <h3 class="section-title">Customer List</h3>
            <table class="crud-table">
                <thead>
                <tr>
                    <th>Account No</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Phone</th>
                    <th>Units</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for (Customer c : customers) {
                %>
                <tr>
                    <td><%= c.getAccountNumber() %></td>
                    <td><%= c.getName() %></td>
                    <td><%= c.getAddress() %></td>
                    <td><%= c.getTelephone() %></td>
                    <td><%= c.getUnitsConsumed() %></td>
                    <td>
                        <a href="editCustomer.jsp?accountNumber=<%= c.getAccountNumber() %>" class="btn btn-warning">Edit</a>
                        <a href="deleteCustomer.jsp?accountNumber=<%= c.getAccountNumber() %>" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this customer?')">Delete</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>

    </main>
</div>
<script>
    function confirmExit() {
        return confirm("Are you sure you want to exit?");
    }

</script>
</body>
</html>
