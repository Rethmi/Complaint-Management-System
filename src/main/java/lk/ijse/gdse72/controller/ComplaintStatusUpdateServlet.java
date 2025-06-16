package lk.ijse.gdse72.controller;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.ComplaintDAO;
import lk.ijse.gdse72.model.podos.ComplaintDTO;

import java.io.IOException;

@WebServlet("/admin/update-complaint-status")
public class ComplaintStatusUpdateServlet extends HttpServlet {

    private ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String complaintId = req.getParameter("complaintId");
        String status = req.getParameter("status");
        String adminRemarks = req.getParameter("adminRemarks");

        ComplaintDTO complaint = complaintDAO.getComplaintById(complaintId);
        if (complaint == null) {
            resp.sendRedirect(req.getContextPath() + "/view/view-all-complaints.jsp?error=notfound");
            return;
        }

        complaint.setStatus(status);
        complaint.setAdminRemarks(adminRemarks);

        boolean updated = complaintDAO.updateComplaintStatus(complaintId,status, complaint.getAssignedTo(), adminRemarks);

        if (updated) {
            resp.sendRedirect(req.getContextPath() + "/view/view-all-complaints.jsp?success=updated");
        } else {
            resp.sendRedirect(req.getContextPath() + "/view/view-all-complaints.jsp?error=updatefailed");
        }
    }
}