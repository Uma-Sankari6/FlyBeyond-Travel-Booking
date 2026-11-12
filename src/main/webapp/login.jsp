
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond</a>
    <nav>
        <a href="index.jsp">Home</a>
        <a href="destinations">Destinations</a>
        <a href="register.jsp">Register</a>
    </nav>
</header>

<section class="form-section">
    <div class="form-container">

        <h2>Welcome Back!</h2>
        <p>Login to your FlyBeyond account.</p>

        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <p class="error">Invalid email or password.</p>
        <% } %>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <p class="error">Please enter all required details.</p>
        <% } %>

        <% if ("registered".equals(request.getParameter("success"))) { %>
            <p class="success">Registration successful. Please login.</p>
        <% } %>

        <form action="login" method="post">

            <label>Email Address</label>
            <input type="email" name="email"
                   placeholder="Enter your email" required>

            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Enter your password" required>

            <button type="submit" class="btn full-btn">
                Login
            </button>

        </form>

        <p class="form-link">
            Don't have an account?
            <a href="register.jsp">Register Here</a>
        </p>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
