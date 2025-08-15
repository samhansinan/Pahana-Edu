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
    <link href="Css/culculate.css" rel="stylesheet">
    <script>

            const itemData = {
            <% for (Item item : itemList) { %>
            "<%= item.getItemId() %>": <%= item.getPrice() %>,
            <% } %>
        };

            function updateRowPrice(select) {
            const row = select.closest('tr');
            const priceField = row.querySelector('.price');
            const unitsField = row.querySelector('.units');
            const subtotalField = row.querySelector('.subtotal');

            const itemId = select.value;
            const price = itemData[itemId] || 0;
            priceField.value = price;

            const units = parseInt(unitsField.value) || 0;
            subtotalField.value = (price * units).toFixed(2);
            updateGrandTotal();
        }

            function updateRowTotal(input) {
            const row = input.closest('tr');
            const price = parseFloat(row.querySelector('.price').value) || 0;
            const units = parseInt(input.value) || 0;
            row.querySelector('.subtotal').value = (price * units).toFixed(2);
            updateGrandTotal();
        }

            function updateGrandTotal() {
                const subtotals = document.querySelectorAll('.subtotal');
                let total = 0;
                subtotals.forEach(field => {
                    total += parseFloat(field.value) || 0;
                });
                document.getElementById("grandTotal").innerText = total.toFixed(2);
                // Set hidden input value
                document.getElementById("totalAmountInput").value = total.toFixed(2);
            }


            function addRow() {
            const rowHtml = `
            <tr>
                <td>
                    <select name="itemId[]" class="form-input item-select" onchange="updateRowPrice(this)" required>
                        <option value="">-- Select --</option>
                        <% for (Item item : itemList) { %>
                        <option value="<%= item.getItemId() %>"><%= item.getName() %></option>
                        <% } %>
                    </select>
                </td>
                <td><input type="text" name="price[]" class="form-input price" readonly></td>
                <td><input type="number" name="units[]" class="form-input units" oninput="updateRowTotal(this)" required></td>
                <td><input type="text" name="subtotal[]" class="form-input subtotal" readonly></td>
                <td><button type="button" onclick="removeRow(this)">Remove</button></td>
            </tr>
        `;
            document.getElementById("itemRows").insertAdjacentHTML("beforeend", rowHtml);
        }

            function removeRow(btn) {
            const row = btn.closest("tr");
            row.remove();
            updateGrandTotal();
        }



    </script>
</head>
<body>
<%
    // Check if user is logged in
    String userName = (String) session.getAttribute("username");
    if(userName == null) {
        // Redirect to login if not logged in
        response.sendRedirect("index.jsp");
        return;
    }
%>
<div class="container">
    <!-- Sidebar (you can reuse your same sidebar here) -->
    <nav class="sidebar" id="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item"><a href="Home.jsp" class="nav-link">Dashboard</a></li>
            <li class="nav-item"><a href="addCustomer.jsp" class="nav-link ">Add Customer</a></li>
            <li class="nav-item"><a href="" class="nav-link active">Calculate & Print Bill</a></li>
            <li class="nav-item"><a href="additem.jsp" class="nav-link">Manage Item</a></li>
            <li class="nav-item"><a href="help" class="nav-link">Help</a></li>
            <li class="nav-item"><a href="logout" onclick="return confirmExit()" class="nav-link">Exit</a></li>
        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <div class="form-container">
            <div class="form-header">
                <h2 class="form-title">Calculate & Print Bill</h2>
                <p class="form-subtitle">Fill in the details below</p>
            </div>

            <form action="calculateBill" method="POST" id="billForm">
                <div class="form-group">
                    <label class="form-label required">Customer ID</label>
                    <input type="text" name="accountNumber" class="form-input" required>
                </div>

                <table id="itemTable" class="item-table">
                    <thead>
                    <tr>
                        <th>Item</th>
                        <th>Price (Auto)</th>
                        <th>Units</th>
                        <th>Subtotal</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody id="itemRows">
                    <tr>
                        <td>
                            <select name="itemId[]" class="form-input item-select" onchange="updateRowPrice(this)" required>
                                <option value="">-- Select --</option>
                                <% for (Item item : itemList) { %>
                                <option value="<%= item.getItemId() %>"><%= item.getName() %></option>
                                <% } %>
                            </select>
                        </td>
                        <td><input type="text" name="price[]" class="form-input price" readonly></td>
                        <td><input type="number" name="units[]" class="form-input units" oninput="updateRowTotal(this)" required></td>
                        <td><input type="text" name="subtotal[]" class="form-input subtotal" readonly></td>
                        <td><button type="button" onclick="removeRow(this)">Remove</button></td>
                    </tr>
                    </tbody>
                </table>

                <button type="button" class="btn btn-secondary" onclick="addRow()">+ Add Item</button>

                <div class="form-group">
                    <label class="form-label-total">Total Amount</label>
                    <h2 id="grandTotal">0.00</h2>
                    <input type="hidden" name="totalAmount" id="totalAmountInput" value="0.00">
                </div>

                <div class="button-group">
                    <button type="reset" class="btn btn-secondary">Reset</button>
                    <button type="submit" class="btn btn-primary">Generate Bill</button>
                </div>
            </form>


        </div>
    </main>
</div>

<script>
    function calculateTotal() {
        const price = parseFloat(document.getElementById("price").value) || 0;
        const units = parseInt(document.getElementById("units").value) || 0;
        const totalField = document.getElementById("total");

        totalField.innerText = (price * units).toFixed(2);
    }


        function confirmExit() {
        return confirm("Are you sure you want to exit?");
    }


</script>
</body>
</html>
