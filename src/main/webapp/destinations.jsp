
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flybeyond.model.Destination" %>
<%@ page import="com.flybeyond.dao.DestinationDAO" %>

<%
    DestinationDAO dao = new DestinationDAO();
    List<Destination> destinations = dao.getAllDestinations();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Destinations | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css?v=25">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="destinations.jsp">Destinations</a>
        <a href="contact.jsp">Contact</a>
        <a href="dashboard.jsp">Dashboard</a>
    </nav>
</header>

<section class="section destinations-section">

    <h2>Explore Our Destinations</h2>
    <p class="destination-intro">
        Discover beautiful places around the world with FlyBeyond.
    </p>

    <% if (destinations == null || destinations.isEmpty()) { %>

        <p class="no-destinations">No destinations available.</p>

    <% } else { %>

        <div class="card-container">

            <% for (Destination d : destinations) { %>

                <div class="destination-card">

                    <img
                        src="images/<%= d.getImage() %>"
                        alt="<%= d.getName() %>">

                    <div class="card-content">

                        <h3><%= d.getName() %></h3>

                        <p class="destination-country">
                            <%= d.getCountry() %>
                        </p>

                        <p>
                            <%= d.getDescription() %>
                        </p>

                        <a href="booking.jsp" class="btn">
                            Book Now
                        </a>

                    </div>
                </div>

            <% } %>

        </div>

    <% } %>

</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
