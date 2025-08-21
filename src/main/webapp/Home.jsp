
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financial Dashboard</title>
    <link href="Css/Homedahboad.css" rel="stylesheet">
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
<div class="dashboard-container">
    <!-- Sidebar -->
    <nav class="sidebar">
        <div class="logo">
            <div class="logo-icon">PE</div>
            <span style="font-weight: 600;">PahanaEdu</span>
        </div>
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="#" class="nav-link active">
                    <div class="nav-icon"></div>
                    Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a href="addCustomer.jsp" class="nav-link">
                    <div class="nav-icon"></div>
                    Add Customer
                </a>
            </li>

            <li class="nav-item">
                <a href="calculateBill.jsp" class="nav-link">
                    <div class="nav-icon"></div>
                    Culculate & Print Bill
                </a>
            </li>
            <li class="nav-item">
                <a href="additem.jsp" class="nav-link">
                    <div class="nav-icon"></div>
                    Manage Item
                </a>
            </li>
            <li class="nav-item">
                <a href="displayCustomer.jsp" class="nav-link">
                    <div class="nav-icon"></div>
                    Display Account
                </a>
            </li>
            <li class="nav-item">
                <a href="help" class="nav-link">
                    <div class="nav-icon"></div>
                    Help
                </a>
            </li>
            <li class="nav-item">
                <a href="logout" class="nav-link" onclick="return confirmExit();">
                    <div class="nav-icon"></div>
                    Exit
                </a>
            </li>

        </ul>
    </nav>

    <!-- Main Content -->
    <main class="main-content">
        <!-- Header -->


        <!-- Stats Section -->
        <div class="stats-section">
            <div class="stat-card">
                <div class="stat-label">Total Customers</div>
                <div class="stat-value">20</div>

            </div>
            <div class="stat-card">
                <div class="stat-label">Members</div>
                <div class="stat-value">1,893</div>

            </div>
            <div class="stat-card">
                <div class="stat-label">Active Now</div>
                <div class="stat-value">189</div>
            </div>
        </div>

        <!-- Dashboard Grid -->

    </main>
</div>

<%-- JSP Code can be added here --%>
<%-- Example:
<%
    // Java code for dynamic content
    String userName = (String) session.getAttribute("userName");
    if(userName == null) {
        userName = "Evano";
    }
%>
--%>

<script>
    // Interactive functionality
    document.addEventListener('DOMContentLoaded', function() {
        // Add hover effects and animations
        const statCards = document.querySelectorAll('.stat-card');
        statCards.forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
                this.style.boxShadow = '0 4px 12px rgba(0,0,0,0.1)';
            });
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = 'none';
            });
        });

        // Animate progress circle
        const progressBar = document.querySelector('.progress-bar');
        if(progressBar) {
            setTimeout(() => {
                progressBar.style.strokeDashoffset = '113'; // 60% progress
            }, 500);
        }
    });

    function confirmExit() {
        return confirm("Are you sure you want to exit?");
    }

</script>
</body>
</html>