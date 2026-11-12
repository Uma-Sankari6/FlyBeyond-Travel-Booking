
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | FlyBeyond</title>
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

        <h2>Create Account</h2>
        <p>Join FlyBeyond and start your journey.</p>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <p class="error">Please fill in all required fields.</p>
        <% } %>

        <% if ("failed".equals(request.getParameter("error"))) { %>
            <p class="error">Registration failed. Email may already exist.</p>
        <% } %>

        <form action="register" method="post">

            <label>Full Name</label>
            <input type="text" name="fullName"
                   placeholder="Enter your full name" required>

            <label>Email Address</label>
            <input type="email" name="email"
                   placeholder="Enter your email" required>

            <label>Phone Number</label>
            <input type="tel" name="phone"
                   placeholder="Enter your phone number" required>

            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Create a password"
                   minlength="6" required>

            <button type="submit" class="btn full-btn">
                Register
            </button>

        </form>

        <p class="form-link">
            Already have an account?
            <a href="login.jsp">Login Here</a>
        </p>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
