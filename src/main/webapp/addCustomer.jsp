<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Customer</title>
    <link href="Css/addcustomer.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- Sidebar -->
    <nav class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="Home.jsp" class="nav-link">Dashboard</a>
            </li>
            <li class="nav-item">
                <a href="addCustomer.jsp" class="nav-link active">Add Customer</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">Calculate & Print Bill</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">Manage Item</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">Help</a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">Exit</a>
            </li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">

        <!-- Show error message if any -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div class="error-message" style="color:red;"><%= error %></div>
        <% } %>

        <!-- Success Message (optional) -->
        <div class="success-message" id="successMessage" style="display: none;">
            Customer added successfully!
        </div>

        <!-- Form Container -->
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">Customer Information</h2>
                <p class="form-subtitle">Please fill in all the required information to add a new customer</p>
            </div>

            <form  action="addCustomer" method="POST">
                <div class="form-section">
                    <h3 class="section-title">Personal Information</h3>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Account Number:</label>
                            <input type="text" name="accountNumber" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required">Name</label>
                            <input type="text" name="name" class="form-input" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Address:</label>
                            <input type="text" name="address" class="form-input" required>
                        </div>
                        <div class="form-group">
                            <label class="form-label required">Phone Number</label>
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
    </main>
</div>
</body>
</html>
