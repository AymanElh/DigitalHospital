package com.youcode.digitalhospital.servlet.pub.doctor;

import com.youcode.digitalhospital.dto.doctor.DoctorDTO;
import com.youcode.digitalhospital.mapper.DoctorMapper;
import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import com.youcode.digitalhospital.service.interfaces.entity.IPatientService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Optional;

@WebServlet("/doctors/*")
public class DoctorDetailsServlet extends HttpServlet {

    @Inject
    IDoctorService doctorService;
    @Inject
    IConsultationService consultationService;
    @Inject
    IPatientService patientService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Extract doctor ID from the URL path
        String pathInfo = req.getPathInfo();

        // Validate that path info exists (e.g., /doctors/123 -> pathInfo = "/123")
        if (pathInfo == null || pathInfo.equals("/")) {
            req.getSession().setAttribute("errorMessage", "Doctor ID is required");
            resp.sendRedirect(req.getContextPath() + "/doctors");
            return;
        }
        
        // Remove leading slash and get the ID
        String doctorIdParam = pathInfo.substring(1);

        try {
            Long doctorId = Long.parseLong(doctorIdParam);
            
            // Fetch doctor from service
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            
            if (doctorOptional.isPresent()) {
                // Convert to DTO and set as request attribute
                DoctorDTO doctorDTO = DoctorMapper.toDTO(doctorOptional.get());
                req.setAttribute("doctor", doctorDTO);
                
                // Forward to the details JSP page
                req.getRequestDispatcher("/WEB-INF/view/public/doctors/details.jsp").forward(req, resp);
            } else {
                // Doctor not found
                req.getSession().setAttribute("errorMessage", "Doctor not found");
                resp.sendRedirect(req.getContextPath() + "/doctors");
            }
            
        } catch (NumberFormatException e) {
            // Invalid ID format
            req.getSession().setAttribute("errorMessage", "Invalid doctor ID format");
            resp.sendRedirect(req.getContextPath() + "/doctors");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Extract doctor ID from the URL path
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/")) {
            req.getSession().setAttribute("errorMessage", "Doctor ID is required");
            resp.sendRedirect(req.getContextPath() + "/doctors");
            return;
        }

        // Remove leading slash and get the ID
        String doctorIdParam = pathInfo.substring(1);

        try {
            Long doctorId = Long.parseLong(doctorIdParam);
            String patientIdStr = req.getSession().getAttribute("userId").toString();

            if(patientIdStr == null) {
                req.getSession().setAttribute("errorMessage", "You should login to book an appointment");
                return;
            }

            // Get form parameters
            String appointmentDate = req.getParameter("appointmentDate");
            String startTime = req.getParameter("startTime");
            String reason = req.getParameter("reason");

            System.out.println("Appointment details: ");
            System.out.println(appointmentDate);
            System.out.println(startTime);
            System.out.println(reason);

            // Validate form data
            if (appointmentDate == null || appointmentDate.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Appointment date is required");
                resp.sendRedirect(req.getContextPath() + "/doctors/" + doctorId);
                return;
            }

            if (startTime == null || startTime.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Time slot is required");
                resp.sendRedirect(req.getContextPath() + "/doctors/" + doctorId);
                return;
            }

            if (reason == null || reason.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Reason for visit is required");
                resp.sendRedirect(req.getContextPath() + "/doctors/" + doctorId);
                return;
            }

            Long patientId = Long.parseLong(patientIdStr);
            LocalDate consultationDate = LocalDate.parse(appointmentDate);
            LocalDateTime time = LocalDateTime.parse(startTime);

            Patient patient = patientService.getPatientById(patientId).orElseThrow(() -> new IllegalArgumentException("Patient not found"));

            // TODO: Add your booking logic here
            ConsultationSlot slot = consultationService.getSlot(doctorId, consultationDate, time);
//            Consultation consultation = consultationService.bookConsultation()

            // For now, just set success message
            req.getSession().setAttribute("successMessage",
                "Appointment request submitted successfully! The doctor will review and confirm your booking.");

            // Redirect back to the doctor details page
            resp.sendRedirect(req.getContextPath() + "/doctors/" + doctorId);

        } catch (NumberFormatException e) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor ID format");
            resp.sendRedirect(req.getContextPath() + "/doctors");
        }
    }
}
