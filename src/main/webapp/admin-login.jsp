
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login | FlyBeyond</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<header class="navbar">
    <a href="index.jsp" class="logo">FlyBeyond Admin</a>
    <nav>
        <a href="index.jsp">Home</a>
    </nav>
</header>

<section class="form-section">
    <div class="form-container">

        <h2>Admin Login</h2>
        <p>Login to manage FlyBeyond bookings.</p>

        <% if ("invalid".equals(request.getParameter("error"))) { %>
            <p class="error">Invalid username or password.</p>
        <% } %>

        <% if ("empty".equals(request.getParameter("error"))) { %>
            <p class="error">Please enter username and password.</p>
        <% } %>

        <form action="admin-login" method="post">

            <label>Username</label>
            <input type="text" name="username"
                   placeholder="Enter admin username" required>

            <label>Password</label>
            <input type="password" name="password"
                   placeholder="Enter admin password" required>

            <button type="submit" class="btn full-btn">
                Admin Login
            </button>

        </form>

    </div>
</section>

<footer>
    <p>&copy; 2026 FlyBeyond. All Rights Reserved.</p>
</footer>

</body>
</html>
