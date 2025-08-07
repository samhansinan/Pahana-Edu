
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
      <li class="nav-item"><a href="addCustomer.jsp" class="nav-link">Add Customer</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Calculate & Print Bill</a></li>
      <li class="nav-item"><a href="additem.jsp" class="nav-link active">Manage Item</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Help</a></li>
      <li class="nav-item"><a href="#" class="nav-link">Exit</a></li>
    </ul>
  </nav>

  <!-- Main Content -->
  <main class="main-content">

    <div class="message <%= request.getAttribute("message") != null ? "success" : "" %>">
      <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
    </div>
    <div class="message error">
      <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
    </div>


    <!-- Form Container -->
    <div class="form-container">
      <div class="form-header">
        <h2 class="form-title">Manage Items</h2>
        <p class="form-subtitle">Please fill in all the required information to Add Item</p>
      </div>

      <form action="addItem" method="POST">
        <div class="form-section">
          <h3 class="section-title">Item Information</h3>
          <div class="form-row">
            <div class="form-group">
              <label class="form-label required">Item Name: </label>
              <input type="text" name="name" class="form-input" required>
            </div>
            <div class="form-group">
              <label class="form-label required">Price</label>
              <input type="number" step="0.01" name="price" class="form-input" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group">
              <label class="form-label required">Quantity</label>
              <input type="number" name="quantity"  class="form-input" required>
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
