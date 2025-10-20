package com.youcode.digitalhospital.servlet.doctor;

import com.youcode.digitalhospital.model.Consultation;
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
import java.util.List;

@WebServlet("/doctor/consultations")
public class DoctorConsultationServlet extends HttpServlet {

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

        try {
            // Get all consultations for this doctor
            List<Consultation> consultations = consultationService.getPlanningConsultations(doctor.getId());

            // Eagerly initialize lazy-loaded relationships
            for (Consultation consultation : consultations) {
                if (consultation.getPatient() != null) {
                    consultation.getPatient().getFirstName();
                    consultation.getPatient().getEmail();
                }
                if (consultation.getConsultationSlot() != null) {
                    consultation.getConsultationSlot().getStartTime();
                    consultation.getConsultationSlot().getEndTime();
                }
            }

            req.setAttribute("consultations", consultations);
            req.setAttribute("doctor", doctor);

            // Forward to consultations view
            req.getRequestDispatcher("/WEB-INF/view/doctor/consultations.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("errorMessage", "Error loading consultations: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/doctor/dashboard");
        }
    }
}

