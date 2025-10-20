package com.youcode.digitalhospital.servlet.doctor;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/doctor/dashboard")
public class DoctorDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check if user is logged in and is a doctor
        HttpSession session = req.getSession(false);
//        if (session == null || session.getAttribute("user") == null) {
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }

        String userRole = (String) session.getAttribute("userRole");
//        if (!"doctor".equals(userRole)) {
//            session.setAttribute("errorMessage", "Access denied. Doctor privileges required.");
//            resp.sendRedirect(req.getContextPath() + "/login");
//            return;
//        }

        // Set page title for the header
        req.setAttribute("pageTitle", "Doctor Dashboard");
        
        // TODO: Later, you can add real data here:
        // - Today's appointments from database
        // - Pending consultation approvals
        // - Recent patients
        // - Doctor's statistics
        
        // For now, we're using static data in the JSP
        
        // Forward to the dashboard view
        req.getRequestDispatcher("/WEB-INF/view/doctor/dashboard.jsp").forward(req, resp);
    }
}
