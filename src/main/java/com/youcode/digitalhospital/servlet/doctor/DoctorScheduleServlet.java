package com.youcode.digitalhospital.servlet.doctor;

import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet("/doctor/schedule")
public class DoctorScheduleServlet extends HttpServlet {

    @Inject
    private IConsultationService consultationService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check authentication and role
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        String userRole = (String) session.getAttribute("userRole");
        if (!"doctor".equals(userRole)) {
            session.setAttribute("errorMessage", "Access denied. Doctor privileges required.");
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        Doctor doctor = (Doctor) session.getAttribute("user");
        System.out.println("Doctor: " + doctor);
        try {
            // Get date parameter (default to today)
            String dateParam = req.getParameter("date");
            LocalDate selectedDate = dateParam != null ?
                LocalDate.parse(dateParam) : LocalDate.now();

            // Get doctor's schedule for the selected date
            List<ConsultationSlot> daySchedule = consultationService.getDoctorPlaning(
                doctor.getId(), selectedDate);

            System.out.println("schedule: " + daySchedule);

            // Set attributes for JSP
            req.setAttribute("doctor", doctor);
            req.setAttribute("selectedDate", selectedDate);
            req.setAttribute("daySchedule", daySchedule);
            req.setAttribute("pageTitle", "My Schedule");

            // Format date for display
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("EEEE, MMMM dd, yyyy");
            req.setAttribute("formattedDate", selectedDate.format(formatter));

            // Generate week dates for navigation
            LocalDate startOfWeek = selectedDate.minusDays(selectedDate.getDayOfWeek().getValue() - 1);
            req.setAttribute("startOfWeek", startOfWeek);

        } catch (Exception e) {
            session.setAttribute("errorMessage", "Error loading schedule: " + e.getMessage());
        }

        // Forward to schedule view
        req.getRequestDispatcher("/WEB-INF/view/doctor/schedule.jsp").forward(req, resp);
    }
}
