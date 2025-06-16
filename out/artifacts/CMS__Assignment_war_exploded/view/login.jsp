<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Complaint Management System</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

<div class="welcome-text">🌟 Welcome Complaint Management System 🌟</div>

<div class="container">
    <h1>Login</h1>

    <% String error = request.getParameter("error"); %>
    <% if (error != null) { %>
    <p class="error"><%= error %></p>
    <% } %>

    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <input type="submit" value="Login">
    </form>

    <p>Don't have an account? <a href="register.jsp">Register here</a></p>
</div>
</body>
</html>
