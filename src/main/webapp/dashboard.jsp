
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.flybeyond.model.User" %>

<%
    User user = (User) session.getAttribute("loggedInUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="destinations">Destinations</a>
        <a href="my-bookings">My Bookings</a>
        <a href="contact.jsp">Contact</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<section class="section">
    <div class="dashboard-container">
        <h1>Welcome, <%= user.getFullName() %>!</h1>
        <p>Your travel journey starts here.</p>

        <div class="card-container">

            <div class="feature-card">
                <h3>Explore Destinations</h3>
                <p>Discover beautiful places around the world.</p>
                <a href="destinations" class="btn">Explore</a>
            </div>

            <div class="feature-card">
                <h3>Book Your Trip</h3>
                <p>Plan your next unforgettable journey.</p>
                <a href="booking.jsp" class="btn">Book Now</a>
            </div>

            <div class="feature-card">
                <h3>My Bookings</h3>
                <p>View your travel booking details.</p>
                <a href="my-bookings" class="btn">View Bookings</a>
            </div>

        </div>
    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
