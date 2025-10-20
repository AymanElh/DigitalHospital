package com.youcode.digitalhospital.servlet.admin;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationStatus;
import com.youcode.digitalhospital.repository.interfaces.IConsultationRepository;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet("/admin/consultations")
public class ConsultationServlet extends HttpServlet {

    @Inject
    private IConsultationService consultationService;

    @Inject
    private IConsultationRepository consultationRepository;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        EntityManager em = JPAConfig.getEntityManager();

        try {
            List<Consultation> consultations;

            consultations = consultationRepository.findAll(em);

            // Eagerly initialize lazy-loaded relationships
            for (Consultation consultation : consultations) {
                if (consultation.getPatient() != null) {
                    consultation.getPatient().getFirstName();
                }
                if (consultation.getDoctor() != null) {
                    consultation.getDoctor().getFirstName();
                }
                if (consultation.getConsultationSlot() != null) {
                    consultation.getConsultationSlot().getStartTime();
                }
            }

            req.setAttribute("consultations", consultations);
            req.setAttribute("totalConsultations", consultations.size());

            // Calculate statistics
            long completed = consultations.stream()
                    .filter(c -> c.getConsultationStatus() == ConsultationStatus.COMPLETED)
                    .count();
            long validated = consultations.stream()
                    .filter(c -> c.getConsultationStatus() == ConsultationStatus.VALIDATED)
                    .count();
            long reserved = consultations.stream()
                    .filter(c -> c.getConsultationStatus() == ConsultationStatus.RESERVED)
                    .count();
            long cancelled = consultations.stream()
                    .filter(c -> c.getConsultationStatus() == ConsultationStatus.CANCELED)
                    .count();

            req.setAttribute("completedCount", completed);
            req.setAttribute("validatedCount", validated);
            req.setAttribute("reservedCount", reserved);
            req.setAttribute("cancelledCount", cancelled);

            req.getRequestDispatcher("/WEB-INF/view/admin/consultation/consultations.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error loading consultations: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } finally {
            if (em != null && em.isOpen()) {
                em.close();
            }
        }
    }
}
