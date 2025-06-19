package lk.ijse.gdse72.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.ComplaintDAO;
import lk.ijse.gdse72.model.pojos.ComplaintDTO;
import lk.ijse.gdse72.model.pojos.UserDTO;

import java.io.IOException;
import java.util.List;

@WebServlet("/employee/my-complaints")
public class MyComplaintsServlet extends HttpServlet {

    private final ComplaintDAO complaintDAO = new ComplaintDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
            return;
        }

        UserDTO loggedUser = (UserDTO) session.getAttribute("user");
        String userId = loggedUser.getUserId();

        try {
            List<ComplaintDTO> complaints = complaintDAO.getComplaintsByUser(userId);
            req.setAttribute("complaints", complaints);
            req.getRequestDispatcher("/view/my-complaints.jsp").forward(req, resp);
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Failed to load your complaints. Please try again later.");
            req.getRequestDispatcher("/view/error.jsp").forward(req, resp);
        }
    }
}
