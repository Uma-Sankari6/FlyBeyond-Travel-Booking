
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flybeyond.model.Booking" %>

<%
    if (session.getAttribute("loggedInAdmin") == null) {
        response.sendRedirect("admin-login.jsp");
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
    <title>Manage Bookings | FlyBeyond</title>
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
    <h2>Manage Customer Bookings</h2>

    <% if ("updated".equals(request.getParameter("success"))) { %>
        <p class="success">Booking status updated successfully.</p>
    <% } %>

    <% if ("invalid".equals(request.getParameter("error"))) { %>
        <p class="error">Invalid booking status.</p>
    <% } %>

    <% if (bookings != null && !bookings.isEmpty()) { %>

        <div class="table-container">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Customer</th>
                    <th>Email</th>
                    <th>Destination</th>
                    <th>Travel Date</th>
                    <th>Travellers</th>
                    <th>Status</th>
                    <th>Update</th>
                </tr>

                <% for (Booking booking : bookings) { %>
                <tr>
                    <td><%= booking.getId() %></td>
                    <td><%= booking.getCustomerName() %></td>
                    <td><%= booking.getEmail() %></td>
                    <td><%= booking.getDestination() %></td>
                    <td><%= booking.getTravelDate() %></td>
                    <td><%= booking.getTravellers() %></td>
                    <td><%= booking.getBookingStatus() %></td>

                    <td>
                        <form action="admin-bookings" method="post">
                            <input type="hidden" name="bookingId"
                                   value="<%= booking.getId() %>">

                            <select name="status" required>
                                <option value="Pending"
                                    <%= "Pending".equals(booking.getBookingStatus()) ? "selected" : "" %>>
                                    Pending
                                </option>

                                <option value="Confirmed"
                                    <%= "Confirmed".equals(booking.getBookingStatus()) ? "selected" : "" %>>
                                    Confirmed
                                </option>

                                <option value="Cancelled"
                                    <%= "Cancelled".equals(booking.getBookingStatus()) ? "selected" : "" %>>
                                    Cancelled
                                </option>
                            </select>

                            <button type="submit" class="btn">
                                Update
                            </button>
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>

    <% } else { %>
        <p>No bookings available.</p>
    <% } %>

</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
