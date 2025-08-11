<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bill Success</title>
    <link href="Css/success.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>✅ Bill Generated Successfully!</h2>
    <p>Total Amount: <strong>Rs. <%= request.getAttribute("grandTotal") %></strong></p>
    <a href="calculateBill.jsp">➕ Generate Another Bill</a>
</div>
</body>
</html>
