<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error - Complaint Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f8d7da;
            color: #721c24;
            padding: 50px;
            text-align: center;
        }

        .error-box {
            background: #f5c6cb;
            padding: 2rem;
            border-radius: 10px;
            display: inline-block;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #004085;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="error-box">
    <h1>🚫 Oops! Something went wrong.</h1>
    <p><strong>${error}</strong></p>

    <a href="<%=request.getContextPath()%>/index.jsp">🔙 Go back to Home</a>
</div>
</body>
</html>
