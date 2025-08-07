<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ItemDAO" %>
<%@ page import="model.Item" %>

<%
    ItemDAO itemDao = new ItemDAO();
    List<Item> itemList = itemDao.getAllItem();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculate Bill</title>
    <link href="Css/addcustomer.css" rel="stylesheet">
    <script>

        const itemData = {
            <% for (Item item : itemList) { %>
            "<%= item.getItemId() %>": <%= item.getPrice() %>,
            <% } %>
        };

        function updatePrice() {
            const itemId = document.getElementById("item").value;
            const priceField = document.getElementById("price");
            const unitField = document.getElementById("units");
            const totalField = document.getElementById("total");

            priceField.value = itemData[itemId] || 0;
            calculateTotal();
        }

        function calculateTotal() {
            const price = parseFloat(document.getElementById("price").value) || 0;
            const units = parseInt(document.getElementById("units").value) || 0;
            const totalField = document.getElementById("total");

            totalField.value = (price * units).toFixed(2);
        }
    </script>
</head>
<body>
<div class="container">
    <!-- Sidebar (you can reuse your same sidebar here) -->
    <nav class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="Home.jsp" class="nav-link">Dashboard</a></li>
            <li class="nav-item"><a href="addCustomer.jsp" class="nav-link">Add Customer</a></li>
            <li class="nav-item"><a href="calculateBill.jsp" class="nav-link active">Calculate & Print Bill</a></li>
            <li class="nav-item"><a href="additem.jsp" class="nav-link">Manage Item</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Help</a></li>
            <li class="nav-item"><a href="#" class="nav-link">Exit</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">Calculate & Print Bill</h2>
                <p class="form-subtitle">Fill in the details below</p>
            </div>

            <form action="generateBill" method="POST">
                <div class="form-section">
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Customer ID</label>
                            <input type="text" name="customerId" class="form-input" required>
                        </div>

                        <div class="form-group">
                            <label class="form-label required">Select Item</label>
                            <select name="itemId" id="item" class="form-input" onchange="updatePrice()" required>
                                <option value="">-- Select --</option>
                                <% for (Item item : itemList) { %>
                                <option value="<%= item.getItemId() %>"><%= item.getName() %></option>
                                <% } %>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label required">Price (Auto)</label>
                            <input type="text" name="price" id="price" class="form-input" readonly>
                        </div>

                        <div class="form-group">
                            <label class="form-label required">Units Consumed</label>
                            <input type="number" name="units" id="units" class="form-input" oninput="calculateTotal()" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Total</label>
                            <input type="text" name="total" id="total" class="form-input" readonly>
                        </div>
                    </div>

                </div>

                <div class="button-group">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Generate Bill</button>
                </div>
            </form>
        </div>
    </main>
</div>
</body>
</html>
