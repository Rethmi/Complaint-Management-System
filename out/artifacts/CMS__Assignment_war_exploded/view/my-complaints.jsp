<%--<%@ page session="true" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page import="lk.ijse.gdse72.model.podos.ComplaintDTO" %>--%>
<%--<%@ page import="lk.ijse.gdse72.model.ComplaintDAO" %>--%>
<%--<%@ page import="lk.ijse.gdse72.model.podos.UserDTO" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>My Complaints</title>--%>
<%--    <link rel="stylesheet" href="../css/myComplaint.css">--%>

<%--</head>--%>
<%--<body>--%>
<%--<div class="peer">--%>
<%--    <h1>My Complaints</h1>--%>

<%--    <%--%>
<%--        String success = request.getParameter("success");--%>
<%--        if ("1".equals(success)) {--%>
<%--    %>--%>
<%--    <div class="success-msg">--%>
<%--        ✅ Complaint submitted successfully!--%>
<%--    </div>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>

<%--    <a href="<%= request.getContextPath() %>/employee/submit-complaint" class="btn">Submit New Complaint</a>--%>

<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Complaint ID</th>--%>
<%--            <th>Title</th>--%>
<%--            <th>Description</th>--%>
<%--            <th>Department</th>--%>
<%--            <th>Priority</th>--%>
<%--            <th>Status</th>--%>
<%--            <th>Created Date</th>--%>
<%--            <th>Actions</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <%--%>
<%--            List<ComplaintDTO> complaints = null;--%>

<%--            UserDTO currentUser = (UserDTO) session.getAttribute("user");--%>
<%--            if (currentUser == null) {--%>
<%--                response.sendRedirect(request.getContextPath() + "/index.jsp");--%>
<%--                return;--%>
<%--            }--%>

<%--            String userId = currentUser.getUserId();--%>
<%--            System.out.println("[JSP DEBUG] Current User ID: " + userId);--%>

<%--            try {--%>
<%--                ComplaintDAO complaintDAO = new ComplaintDAO();--%>
<%--                complaints = complaintDAO.getComplaintsByUser(userId);--%>
<%--                System.out.println("[JSP DEBUG] Complaints loaded: " + complaints.size());--%>
<%--            } catch (Exception e) {--%>
<%--                System.err.println("[JSP ERROR] Error loading complaints: " + e.getMessage());--%>
<%--                e.printStackTrace();--%>
<%--            }--%>

<%--            if (complaints != null && !complaints.isEmpty()) {--%>
<%--                for (ComplaintDTO complaint : complaints) {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td><%= complaint.getComplaintId() %></td>--%>
<%--            <td><strong><%= complaint.getTitle() %></strong></td>--%>
<%--            <td><%= complaint.getDescription() %></td>--%>
<%--            <td><%= complaint.getDepartment() %></td>--%>
<%--            <td>--%>
<%--                    <span class="priority-<%= complaint.getPriority().toLowerCase() %>">--%>
<%--                        <%= complaint.getPriority() %>--%>
<%--                    </span>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                    <span class="status-<%= complaint.getStatus().toLowerCase() %>">--%>
<%--                        <%= complaint.getStatus() %>--%>
<%--                    </span>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <%= complaint.getCreatedAt() != null ? complaint.getCreatedAt().toString() : "N/A" %>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <%--%>
<%--                    if ("PENDING".equalsIgnoreCase(complaint.getStatus())) {--%>
<%--                %>--%>
<%--&lt;%&ndash;                <a href="edit-complaint.jsp?id=<%= complaint.getComplaintId() %>" class="btn">Edit</a>&ndash;%&gt;--%>
<%--                <a href="<%= request.getContextPath() %>/employee/edit-complaint?id=<%= complaint.getComplaintId() %>" class="btn">Edit</a>--%>
<%--                <form action="<%= request.getContextPath() %>/complaint/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');">--%>
<%--                    <input type="hidden" name="id" value="<%= complaint.getComplaintId() %>">--%>
<%--                    <button type="submit" class="delete-link">--%>
<%--                        🗑 Delete--%>
<%--                    </button>--%>
<%--                </form>--%>
<%--                <%--%>
<%--                } else {--%>
<%--                %>--%>
<%--                <span style="color: #666;">No actions available</span>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        } else {--%>
<%--        %>--%>
<%--        <tr>--%>
<%--            <td colspan="8" style="text-align: center; padding: 40px; color: #666;">--%>
<%--                <h3>No complaints found</h3>--%>
<%--                <p>You haven't submitted any complaints yet.</p>--%>
<%--                <a href="<%= request.getContextPath() %>/employee/submit-complaint" class="btn">Submit Your First Complaint</a>--%>
<%--            </td>--%>
<%--        </tr>--%>
<%--        <%--%>
<%--            }--%>
<%--        %>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--    <%--%>
<%--        if (complaints != null) {--%>
<%--    %>--%>
<%--    <p style="margin-top: 20px; color: #666;">--%>
<%--        Total Complaints: <%= complaints.size() %>--%>
<%--    </p>--%>
<%--    <%--%>
<%--        }--%>
<%--    %>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.gdse72.model.podos.ComplaintDTO" %>
<%@ page import="lk.ijse.gdse72.model.ComplaintDAO" %>
<%@ page import="lk.ijse.gdse72.model.podos.UserDTO" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Complaints</title>
    <link rel="stylesheet" href="../css/myComplaint.css">
    <style>
        .wrapper {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 220px;
            background-color: #1d3557;
            color: white;
            padding: 2rem 1rem;
            flex-shrink: 0;
        }

        .sidebar h2 {
            color: #f1faee;
            margin-bottom: 2rem;
            text-align: center;
        }

        .sidebar a {
            display: block;
            color: #f1faee;
            text-decoration: none;
            margin: 1rem 0;
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-weight: bold;
            transition: background 0.3s;
        }

        .sidebar a:hover {
            background-color: #457b9d;
        }

        .peer {
            flex: 1;
            padding: 2rem;
        }

        @media (max-width: 768px) {
            .wrapper {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                text-align: center;
            }

            .sidebar a {
                display: inline-block;
                margin: 0.5rem;
            }
        }
    </style>
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
        <div class="container">
            <h1>My Complaints</h1>

            <%
                String success = request.getParameter("success");
                if ("1".equals(success)) {
            %>
            <div class="success-msg">
                ✅ Complaint submitted successfully!
            </div>
            <%
                }
            %>

<%--            <a href="<%= request.getContextPath() %>/employee/submit-complaint" class="btn">Submit New Complaint</a>--%>

            <table>
                <thead>
                <tr>
                    <th>Complaint ID</th>
                    <th>Title</th>
                    <th>Description</th>
                    <th>Department</th>
                    <th>Priority</th>
                    <th>Status</th>
                    <th>Created Date</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<ComplaintDTO> complaints = null;

                    UserDTO currentUser = (UserDTO) session.getAttribute("user");
                    if (currentUser == null) {
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                        return;
                    }

                    String userId = currentUser.getUserId();
                    System.out.println("[JSP DEBUG] Current User ID: " + userId);

                    try {
                        ComplaintDAO complaintDAO = new ComplaintDAO();
                        complaints = complaintDAO.getComplaintsByUser(userId);
                        System.out.println("[JSP DEBUG] Complaints loaded: " + complaints.size());
                    } catch (Exception e) {
                        System.err.println("[JSP ERROR] Error loading complaints: " + e.getMessage());
                        e.printStackTrace();
                    }

                    if (complaints != null && !complaints.isEmpty()) {
                        for (ComplaintDTO complaint : complaints) {
                %>
                <tr>
                    <td><%= complaint.getComplaintId() %></td>
                    <td><strong><%= complaint.getTitle() %></strong></td>
                    <td><%= complaint.getDescription() %></td>
                    <td><%= complaint.getDepartment() %></td>
                    <td>
                        <span class="priority-<%= complaint.getPriority().toLowerCase() %>">
                            <%= complaint.getPriority() %>
                        </span>
                    </td>
                    <td>
                        <span class="status-<%= complaint.getStatus().toLowerCase() %>">
                            <%= complaint.getStatus() %>
                        </span>
                    </td>
                    <td><%= complaint.getCreatedAt() != null ? complaint.getCreatedAt().toString() : "N/A" %></td>
                    <td>
                        <%
                            if ("PENDING".equalsIgnoreCase(complaint.getStatus())) {
                        %>
                        <a href="<%= request.getContextPath() %>/employee/edit-complaint?id=<%= complaint.getComplaintId() %>" class="btn btn-small">Edit</a>
                        <form action="<%= request.getContextPath() %>/complaint/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this complaint?');" style="display:inline;">
                            <input type="hidden" name="id" value="<%= complaint.getComplaintId() %>">
                            <button type="submit" class="delete-link"> Delete</button>
                        </form>
                        <%
                        } else {
                        %>
                        <span style="color: #666;">No actions available</span>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="8" style="text-align: center; padding: 40px; color: #666;">
                        <h3>No complaints found</h3>
                        <p>You haven't submitted any complaints yet.</p>
                        <a href="<%= request.getContextPath() %>/employee/submit-complaint" class="btn">Submit Your First Complaint</a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>

            <%
                if (complaints != null) {
            %>
            <p class="stats">Total Complaints: <%= complaints.size() %></p>
            <%
                }
            %>
        </div>
    </div>
</div>
</body>
</html>
