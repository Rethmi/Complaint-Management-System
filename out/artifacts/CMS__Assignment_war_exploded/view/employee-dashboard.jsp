<%--<%@ page session="true" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Employee Dashboard</title>--%>
<%--    <link rel="stylesheet" href="../css/style.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <div class="navbar">--%>
<%--        <a href="complaint-form.jsp">Submit Complaint</a>--%>
<%--        <a href="my-complaints.jsp">My Complaints</a>--%>
<%--&lt;%&ndash;        <a href="${pageContext.request.contextPath}/logout">Logout</a>&ndash;%&gt;--%>
<%--    </div>--%>
<%--    <h1>Welcome, ${sessionScope.username}</h1>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>



<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/employeeDashboard.css">
<%--    <style>--%>
<%--        .wrapper {--%>
<%--            display: flex;--%>
<%--            min-height: 100vh;--%>
<%--        }--%>

<%--        .sidebar {--%>
<%--            width: 220px;--%>
<%--            background-color: #1d3557;--%>
<%--            color: white;--%>
<%--            padding: 2rem 1rem;--%>
<%--            flex-shrink: 0;--%>
<%--        }--%>

<%--        .sidebar h2 {--%>
<%--            color: #f1faee;--%>
<%--            margin-bottom: 2rem;--%>
<%--            text-align: center;--%>
<%--        }--%>

<%--        .sidebar a {--%>
<%--            display: block;--%>
<%--            color: #f1faee;--%>
<%--            text-decoration: none;--%>
<%--            margin: 1rem 0;--%>
<%--            padding: 0.5rem 1rem;--%>
<%--            border-radius: 8px;--%>
<%--            font-weight: bold;--%>
<%--            transition: background 0.3s;--%>
<%--        }--%>

<%--        .sidebar a:hover {--%>
<%--            background-color: #457b9d;--%>
<%--        }--%>

<%--        .peer {--%>
<%--            flex: 1;--%>
<%--            padding: 2rem;--%>
<%--        }--%>

<%--        @media (max-width: 768px) {--%>
<%--            .wrapper {--%>
<%--                flex-direction: column;--%>
<%--            }--%>

<%--            .sidebar {--%>
<%--                width: 100%;--%>
<%--                text-align: center;--%>
<%--            }--%>

<%--            .sidebar a {--%>
<%--                display: inline-block;--%>
<%--                margin: 0.5rem;--%>
<%--            }--%>
<%--        }--%>
<%--    </style>--%>
</head>
<body>
<div class="wrapper">

    <!-- Sidebar Navigation -->
    <div class="sidebar">
        <h2>Employee Panel</h2>
        <a href="<%= request.getContextPath() %>/employee/submit-complaint">Submit Complaint</a>
        <a href="<%= request.getContextPath() %>/employee/my-complaints">My Complaints</a>
        <a href="<%= request.getContextPath() %>/logout">Logout</a>
    </div>

    <!-- Main Content -->
    <div class="peer">
        <h2>Welcome to the Employee Dashboard</h2>
        <p>This is your employee dashboard. From here you can manage your complaints.</p>
    </div>

</div>
</body>
</html>
