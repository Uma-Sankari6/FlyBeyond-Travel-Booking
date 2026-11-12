
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="admin-dashboard.jsp" class="logo">FlyBeyond Admin</a>
    <nav>
        <a href="admin-dashboard.jsp">Dashboard</a>
        <a href="admin-bookings">Bookings</a>
        <a href="admin-logout">Logout</a>
    </nav>
</header>

<section class="section">
    <div class="dashboard-container">

        <h1>Admin Dashboard</h1>
        <p>Welcome to FlyBeyond Administration.</p>

        <div class="card-container">

            <div class="feature-card">
                <h3>Manage Bookings</h3>
                <p>View all customer travel bookings.</p>
                <a href="admin-bookings" class="btn">
                    View Bookings
                </a>
            </div>

            <div class="feature-card">
                <h3>Customer Bookings</h3>
                <p>Confirm or cancel customer bookings.</p>
                <a href="admin-bookings" class="btn">
                    Manage Bookings
                </a>
            </div>

        </div>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
