<%@ page import="model.Item" %>
<%@ page import="dao.ItemDAO" %>

<%
    String itemno = request.getParameter("item_id");
    ItemDAO dao = new ItemDAO();
    Item item = dao.getItemId(itemno);
%>
<html>
<head>
    <title>Edit Customer</title>
    <link rel="stylesheet" href="Css/addcustomer.css">
</head>
<style>
    /* Container */
    .container {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        padding: 40px 20px;
        background-color: #f9fafb;
    }

    /* Page Title */
    .container h2 {
        font-size: 26px;
        color: #1e293b;
        margin-bottom: 24px;
        font-weight: 600;
    }

    /* Form Styling */
    form {
        background-color: white;
        border-radius: 12px;
        padding: 40px 32px;
        width: 100%;
        max-width: 600px;
        box-shadow: 0 4px 24px rgba(0, 0, 0, 0.06);
        border: 1px solid #e2e8f0;
    }

    /* Label + Input Group */
    form label {
        display: block;
        font-weight: 500;
        color: #374151;
        margin-bottom: 8px;
        margin-top: 20px;
        font-size: 15px;
    }

    form input[type="text"],
    form input[type="number"] {
        width: 100%;
        padding: 14px 16px;
        border-radius: 8px;
        border: 1px solid #d1d5db;
        font-size: 14px;
        background-color: white;
        transition: all 0.3s;
    }

    form input:focus {
        border-color: #6366f1;
        box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        outline: none;
    }

    /* Buttons */
    form button {
        padding: 12px 24px;
        margin-top: 30px;
        margin-right: 10px;
        font-size: 14px;
        border: none;
        border-radius: 8px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    form button[type="submit"] {
        background-color: #4f46e5;
        color: white;
    }

    form button[type="submit"]:hover {
        background-color: #4338ca;
        box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
    }

    form button[type="button"] {
        background-color: #f3f4f6;
        color: #374151;
        border: 1px solid #d1d5db;
    }

    form button[type="button"]:hover {
        background-color: #e5e7eb;
    }

    /* Responsive */
    @media (max-width: 768px) {
        form {
            padding: 32px 24px;
        }

        form button {
            width: 100%;
            margin-bottom: 12px;
        }

        form button[type="submit"] {
            margin-right: 0;
        }
    }

</style>
<body>
<div class="container">
    <h2>Edit Item <%= item.getItemId() %></h2>
    <form action="updateItem" method="POST">
        <input type="hidden" name="item_id" value="<%= item.getItemId() %>">

        <label>Name:</label>
        <input type="text" name="name" value="<%= item.getName() %>" required><br>

        <label>Price</label>
        <input type="text" name="price" value="<%= item.getPrice() %>" required><br>

        <label>Quantity:</label>
        <input type="text" name="quantity" value="<%= item.getQuantity()%>" required><br>



        <button type="submit">Update</button>
        <button type="button" onclick="window.location.href='addCustomer.jsp'">Cancel</button>
    </form>
</div>
</body>
</html>
