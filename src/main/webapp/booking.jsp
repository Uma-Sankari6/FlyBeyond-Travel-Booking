
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flybeyond.model.Destination" %>
<%@ page import="com.flybeyond.dao.DestinationDAO" %>

<%
    DestinationDAO dao = new DestinationDAO();
    List<Destination> destinations = dao.getAllDestinations();

    String selectedDestination = request.getParameter("destination");
    String error = request.getParameter("error");
    String success = request.getParameter("success");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Trip | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css?v=30">
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

<section class="booking-section">

    <div class="booking-container">

        <div class="booking-heading">
            <span>YOUR NEXT ADVENTURE STARTS HERE</span>
            <h1>Book Your Dream Trip</h1>
            <p>Choose your destination and plan your perfect journey.</p>
        </div>

        <% if ("1".equals(success)) { %>
            <div class="success">Your booking was submitted successfully!</div>
        <% } %>

        <% if (error != null) { %>
            <div class="error">Unable to process your booking. Please try again.</div>
        <% } %>

        <form action="booking" method="post" class="booking-form">

            <label for="destinationId">Select Destination</label>
            <select id="destinationId" name="destinationId" required>
                <option value="">Choose your destination</option>

                <% if (destinations != null) {
                    for (Destination d : destinations) {
                        String selected = String.valueOf(d.getId()).equals(selectedDestination)
                            ? "selected" : "";
                %>

                    <option value="<%= d.getId() %>" <%= selected %>>
                        <%= d.getName() %> - <%= d.getCountry() %>
                    </option>

                <%  }
                   } %>
            </select>

            <label for="travelDate">Travel Date</label>
            <input type="date" id="travelDate" name="travelDate" required>

            <label for="numberOfPersons">Number of Travellers</label>
            <input type="number"
                   id="numberOfPersons"
                   name="numberOfPersons"
                   min="1"
                   max="20"
                   value="1"
                   required>

            <label for="specialRequests">Special Requests</label>
            <textarea id="specialRequests"
                      name="specialRequests"
                      rows="4"
                      placeholder="Any special requirements?"></textarea>

            <button type="submit" class="btn booking-submit">
                Confirm Booking
            </button>

        </form>

    </div>

</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
