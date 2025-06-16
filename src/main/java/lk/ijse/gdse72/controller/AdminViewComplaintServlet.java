package lk.ijse.gdse72.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.ComplaintDAO;
import lk.ijse.gdse72.model.podos.ComplaintDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/view-all-complaints")
public class AdminViewComplaintServlet extends HttpServlet {

    private final ComplaintDAO complaintDAO = new ComplaintDAO();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

//        System.out.println("AdminViewComplaintServlet GET method triggered");//   the request has reached the AdminViewComplaintServlet's GET method

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
//            System.out.println("Checking if the session is null or not..!");

            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        try {
//            System.out.println("Before Call getAllComplaints In complaintDAO ...");
            List<ComplaintDTO> complaints = complaintDAO.getAllComplaints();
//            System.out.println("After Call getAllComplaints In complaintDAO ..." + complaints);

            req.setAttribute("complaints", complaints);

            req.getRequestDispatcher("/view/view-all-complaints.jsp").forward(req, resp);

        } catch (RuntimeException e) {
            e.printStackTrace();
//            System.out.println("Unexpected error occurred. Please check the flow" + e.getMessage());

            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to load complaints at this time.");
        }
    }
}
