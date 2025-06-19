package lk.ijse.gdse72.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import lk.ijse.gdse72.model.UserDAO;
import lk.ijse.gdse72.model.pojos.UserDTO;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/view/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        UserDTO user = userDAO.authenticate(username, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            if (user.isAdmin()) {
                System.out.println("isAdmin");

                resp.sendRedirect(req.getContextPath() + "/view/admin-dashboard.jsp");
            } else if (user.isEmployee()) {
                System.out.println("IsEmployee");
                resp.sendRedirect(req.getContextPath() + "/view/employee-dashboard.jsp");
            } else {
                System.out.println("Some Wrong");
                resp.sendRedirect(req.getContextPath() + "/index.jsp?error=role");
            }
        } else {
            resp.sendRedirect(req.getContextPath() + "/index.jsp?error=invalid");
        }
    }
}