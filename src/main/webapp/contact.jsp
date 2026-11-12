
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="destinations">Destinations</a>
        <a href="login.jsp">Login</a>
    </nav>
</header>

<section class="form-section">
    <div class="form-container">

        <h2>Contact Us</h2>
        <p>We would love to hear from you.</p>

        <% if ("sent".equals(request.getParameter("success"))) { %>
            <p class="success">Your message was sent successfully!</p>
        <% } %>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <p class="error">Please fill in all required fields.</p>
        <% } %>

        <% if ("failed".equals(request.getParameter("error"))) { %>
            <p class="error">Unable to send your message. Try again.</p>
        <% } %>

        <form action="contact" method="post">

            <label>Your Name</label>
            <input type="text" name="name"
                   placeholder="Enter your name" required>

            <label>Email Address</label>
            <input type="email" name="email"
                   placeholder="Enter your email" required>

            <label>Subject</label>
            <input type="text" name="subject"
                   placeholder="Enter subject">

            <label>Message</label>
            <textarea name="message" rows="5"
                      placeholder="Write your message"
                      required></textarea>

            <button type="submit" class="btn full-btn">
                Send Message
            </button>

        </form>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
