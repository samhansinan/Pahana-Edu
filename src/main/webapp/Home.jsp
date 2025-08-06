<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Financial Dashboard</title>
    <link href="Css/Homedahboad.css" rel="stylesheet">
</head>
<body>
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
                <a href="#" class="nav-link">
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
                <a href="#" class="nav-link">
                    <div class="nav-icon"></div>
                    Help
                </a>
            </li>
            <li class="nav-item">
                <a href="#" class="nav-link">
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
                <div class="stat-value">5,423</div>

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
        <div class="dashboard-grid">
            <!-- Left Column -->
            <div>
                <!-- Chart Section -->


                <div style="margin-top: 24px;">
                    <!-- Recent Activity -->
                    <div class="recent-activity">
                        <h3 class="activity-header">Recent Orders</h3>
                        <ul class="activity-list">
                            <li class="activity-item">
                                <div class="activity-details">
                                    <span class="activity-name">Wade Warren</span>
                                    <span class="activity-type">Order #15267</span>
                                </div>
                                <span class="activity-amount negative">-$35.25</span>
                            </li>
                            <li class="activity-item">
                                <div class="activity-details">
                                    <span class="activity-name">Jane Cooper</span>
                                    <span class="activity-type">Order #15266</span>
                                </div>
                                <span class="activity-amount negative">-$25.25</span>
                            </li>
                            <li class="activity-item">
                                <div class="activity-details">
                                    <span class="activity-name">Guy Hawkins</span>
                                    <span class="activity-type">Order #15265</span>
                                </div>
                                <span class="activity-amount positive">+$545.00</span>
                            </li>
                            <li class="activity-item">
                                <div class="activity-details">
                                    <span class="activity-name">Kristin Watson</span>
                                    <span class="activity-type">Order #15264</span>
                                </div>
                                <span class="activity-amount positive">+$35.25</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div>
                <!-- Payment Card -->
                <div class="payment-card">
                    <div class="payment-title">Upcoming Payments</div>
                    <div class="payment-amount">$2,145</div>
                    <div class="payment-date">Next payment: August 21</div>
                </div>

                <div style="margin-top: 24px;">
                    <!-- Progress Section -->
                    <div class="progress-section">
                        <h3 style="margin-bottom: 20px; color: #1e293b;">Credit Score</h3>
                        <div class="progress-circle">
                            <svg>
                                <circle class="progress-bg" cx="60" cy="60" r="45"></circle>
                                <circle class="progress-bar" cx="60" cy="60" r="45"></circle>
                            </svg>
                            <div class="progress-text">60%</div>
                        </div>
                        <div class="progress-label">Good Credit Score</div>
                    </div>
                </div>
            </div>
        </div>
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
</script>
</body>
</html>