<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Complaint Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
<div class="container">
    <h1>Register</h1>
    <form action="${pageContext.request.contextPath}/registerservlet" method="post">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required>

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required>

        <label for="fullName">Full Name:</label>
        <input type="text" name="fullName" id="fullName" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="number">Phone Number:</label>
        <input type="text" name="number" id="number" required>

        <label for="role">Role:</label>
        <select name="role" id="role">
            <option value="EMPLOYEE">Employee</option>
            <option value="ADMIN">Admin</option>
        </select>

        <input type="submit" value="Register">
    </form>

    <p>Already have an account? <a href="${pageContext.request.contextPath}/view/login.jsp">Login here</a></p>
</div>
</body>
</html>
