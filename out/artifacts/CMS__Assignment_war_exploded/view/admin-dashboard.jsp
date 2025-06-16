<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../css/adminDashboard.css">

</head>
<body>

<div class="main">
    <div class="sidebar">
        <h3> Admin Panel</h3>
<%--        <p>Welcome, ${sessionScope.username}</p>--%>
        <a href="${pageContext.request.contextPath}/view/admin-dashboard.jsp?page=view-all">View Complaints</a>
        </br>
        </br>
        </br>
<%--        <a href="${pageContext.request.contextPath}/logout">Logout</a>--%>
    </div>

    <div class="content">
        <%
            String page1 = request.getParameter("page");
            if ("view-all".equals(page1)) {
        %>
        <jsp:include page="/view/view-all-complaints.jsp" />
        <%
        } else {
        %>
        <h2>Welcome to the Admin Dashboard</h2>
        <p>Use the menu to view all complaints.</p>
        <%
            }
        %>
    </div>
</div>

</body>
</html>
