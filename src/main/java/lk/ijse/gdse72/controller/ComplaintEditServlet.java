package lk.ijse.gdse72.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.ComplaintDAO;
import lk.ijse.gdse72.model.pojos.ComplaintDTO;
import lk.ijse.gdse72.model.pojos.UserDTO;

import java.io.IOException;

@WebServlet("/employee/edit-complaint")
public class ComplaintEditServlet extends HttpServlet {

    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        UserDTO user = getLoggedUser(session);

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=unauthorized");
            return;
        }

        String complaintId = req.getParameter("id");

        if (isNullOrEmpty(complaintId)) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?error=missingId");
            return;
        }

        ComplaintDTO complaint = complaintDAO.getComplaintById(complaintId);

        if (complaint == null) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?error=notfound");
            return;
        }

        if (!canEditComplaint(user, complaint)) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?error=unauthorized");
            return;
        }

        req.setAttribute("complaint", complaint);
        req.getRequestDispatcher("/view/edit-complaint.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        UserDTO user = getLoggedUser(session);

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=unauthorized");
            return;
        }

        // Extract fields
        String complaintId = req.getParameter("complaintId");
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String department = req.getParameter("department");
        String priority = req.getParameter("priority");

        // Validate required fields
        if (isNullOrEmpty(complaintId) || isNullOrEmpty(title) || isNullOrEmpty(description)
                || isNullOrEmpty(department) || isNullOrEmpty(priority)) {

            req.setAttribute("error", "All fields are required.");
            req.setAttribute("complaint", complaintDAO.getComplaintById(complaintId));
            req.getRequestDispatcher("/view/edit-complaint.jsp").forward(req, resp);
            return;
        }

        ComplaintDTO complaint = complaintDAO.getComplaintById(complaintId);

        if (complaint == null || !"PENDING".equalsIgnoreCase(complaint.getStatus())) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?error=invalid");
            return;
        }

        if (!canEditComplaint(user, complaint)) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?error=unauthorized");
            return;
        }

        // Update values
        complaint.setTitle(title);
        complaint.setDescription(description);
        complaint.setDepartment(department);
        complaint.setPriority(priority);

        boolean updated = complaintDAO.updateComplaint(complaint);

        if (updated) {
            resp.sendRedirect(req.getContextPath() + "/employee/my-complaints?success=updated");
        } else {
            req.setAttribute("error", "Failed to update complaint.");
            req.setAttribute("complaint", complaint);
            req.getRequestDispatcher("/view/edit-complaint.jsp").forward(req, resp);
        }
    }



    private UserDTO getLoggedUser(HttpSession session) {
        if (session == null) return null;
        return (UserDTO) session.getAttribute("user");
    }

    private boolean canEditComplaint(UserDTO user, ComplaintDTO complaint) {
        return complaint.getSubmittedBy().equals(user.getUserId()) || user.isAdmin();
    }

    private boolean isNullOrEmpty(String s) {
        return s == null || s.trim().isEmpty();
    }
}
