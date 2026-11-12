
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.flybeyond.model.User" %>

<%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FlyBeyond | Explore More</title>
    <link rel="stylesheet" href="css/style.css?v=20">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>

    <nav>
        <a href="index.jsp">Home</a>
        <a href="destinations">Destinations</a>
        <a href="contact.jsp">Contact</a>

        <% if (loggedInUser == null) { %>
            <a href="login.jsp">Login</a>
            <a href="register.jsp" class="nav-button">Register</a>
        <% } else { %>
            <a href="dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        <% } %>
    </nav>
</header>

<!-- Banner image only -->
<section class="hero"></section>

<section class="section">
    <h2>Why Choose FlyBeyond?</h2>

    <div class="card-container">

        <div class="feature-card">
            <h3>Beautiful Destinations</h3>
            <p>Discover amazing places around the world.</p>
        </div>

        <div class="feature-card">
            <h3>Easy Booking</h3>
            <p>Book your dream trip with a simple process.</p>
        </div>

        <div class="feature-card">
            <h3>Travel Memories</h3>
            <p>Make every journey a memorable experience.</p>
        </div>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
