package com.youcode.digitalhospital.servlet.auth;

import com.youcode.digitalhospital.dto.RegisterPatientDTO;
import com.youcode.digitalhospital.model.User;
import com.youcode.digitalhospital.service.interfaces.business.IAuthenticationService;
import com.youcode.digitalhospital.util.ValidationUtil;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Inject
    IAuthenticationService authService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/view/auth/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String dateOfBirthStr = req.getParameter("dateOfBirth");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        String heightStr = req.getParameter("height");
        String weightStr = req.getParameter("weight");


        RegisterPatientDTO dto = new RegisterPatientDTO();
        dto.setFirstName(firstName);
        dto.setLastName(lastName);
        dto.setEmail(email);
        dto.setPhone(phone);
        dto.setPassword(password);
        dto.setConfirmPassword(confirmPassword);

        System.out.println("debug 1 Register dto: " + dto);

        LocalDate dateOfBirth = null;
        try {
            if (dateOfBirthStr != null && !dateOfBirthStr.trim().isEmpty()) {
                dateOfBirth = LocalDate.parse(dateOfBirthStr);
                dto.setDateOfBirth(dateOfBirth);
            }
        } catch (DateTimeParseException e) {
            System.out.println("Invalid date format: " + e.getMessage());
        }

        try {
            if (weightStr != null && !weightStr.trim().isEmpty()) {
                dto.setWeight(weightStr != null ? Double.parseDouble(weightStr) : 50.00);
            } else {
                dto.setWeight(50.00);
            }
        } catch (NumberFormatException e) {
            System.out.println("Weight should be a valid number");
        }

        try {
            if (heightStr != null && !heightStr.trim().isEmpty()) {
                dto.setHeight(heightStr != null ? Double.parseDouble(heightStr) : 170.00);
            } else {
                dto.setHeight(170.00);
            }
        } catch (NumberFormatException e) {
            System.out.println("Height should be valid number");
        }
        System.out.println(dto);

        Map<String, String> errors = ValidationUtil.validate(dto);
        String passwordMatchError = ValidationUtil.validatePasswordMatch(password, confirmPassword);
        if (passwordMatchError != null) {
            errors.put("confirmPassword", passwordMatchError);
        }

        if (!errors.isEmpty()) {
            // Keep form data so user doesn't have to retype
            req.setAttribute("errors", errors);
            req.setAttribute("dto", dto);

            req.getRequestDispatcher("/WEB-INF/view/auth/register.jsp")
                    .forward(req, resp);
            return;
        }

        System.out.println("Debug 2 check errors: " + errors);
        System.out.println("Debug 3 auth service: " + authService);
        try {
            User patient = authService.registerPatient(dto);
            req.getSession().setAttribute("success", "Registration successfully");
            System.out.println("Debug 3 save patient: " + patient);
            resp.sendRedirect(req.getContextPath() + "/login");
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", "Registration failed");
            req.setAttribute("errors", error);
            req.setAttribute("dto", dto);
            req.getRequestDispatcher("/WEB-INF/view/auth/register.jsp").forward(req, resp);
        }
    }
}
