
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flybeyond.model.Booking" %>
<%@ page import="com.flybeyond.model.User" %>

<%
    User user = (User) session.getAttribute("loggedInUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Booking> bookings =
        (List<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>
    <nav>
        <a href="dashboard.jsp">Dashboard</a>
        <a href="destinations">Destinations</a>
        <a href="logout">Logout</a>
    </nav>
</header>

<section class="section">
    <h2>My Travel Bookings</h2>

    <% if ("booked".equals(request.getParameter("success"))) { %>
        <p class="success">Your booking was submitted successfully!</p>
    <% } %>

    <% if (bookings != null && !bookings.isEmpty()) { %>

        <div class="table-container">
            <table>
                <tr>
                    <th>Booking ID</th>
                    <th>Destination</th>
                    <th>Travel Date</th>
                    <th>Travellers</th>
                    <th>Status</th>
                </tr>

                <% for (Booking booking : bookings) { %>
                    <tr>
                        <td><%= booking.getId() %></td>
                        <td><%= booking.getDestination() %></td>
                        <td><%= booking.getTravelDate() %></td>
                        <td><%= booking.getTravellers() %></td>
                        <td><%= booking.getBookingStatus() %></td>
                    </tr>
                <% } %>

            </table>
        </div>

    <% } else { %>

        <p>No bookings found.</p>
        <a href="destinations" class="btn">Explore Destinations</a>

    <% } %>

</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
