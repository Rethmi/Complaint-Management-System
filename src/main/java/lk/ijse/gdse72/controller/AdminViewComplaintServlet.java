package lk.ijse.gdse72.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.ComplaintDAO;
import lk.ijse.gdse72.model.pojos.ComplaintDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/view-all-complaints")
public class AdminViewComplaintServlet extends HttpServlet {

    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        // Check login
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
            // Get all complaints
            List<ComplaintDTO> complaints = complaintDAO.getAllComplaints();

            // Set to request
            req.setAttribute("complaints", complaints);

            // Forward to JSP
            req.getRequestDispatcher("/view/view-all-complaints.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Unable to load complaints right now.");
            req.getRequestDispatcher("/view/error.jsp").forward(req, resp);
        }
    }
}
