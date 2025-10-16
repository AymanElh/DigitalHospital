package com.youcode.digitalhospital.servlet.auth;

import com.youcode.digitalhospital.dto.auth.LoginDTO;
import com.youcode.digitalhospital.model.User;
import com.youcode.digitalhospital.service.interfaces.business.IAuthenticationService;
import com.youcode.digitalhospital.util.ValidationUtil;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Inject
    IAuthenticationService authService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session != null && session.getAttribute("user") != null) {
            resp.sendRedirect(req.getContextPath() + "/home");
            return;
        }
        req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        LoginDTO dto = new LoginDTO(email, password);
        Map<String, String> errors = ValidationUtil.validate(dto);

        if(!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("dto", dto);
            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
            return;
        }

        try {
            User user = authService.login(dto);
            req.setAttribute("success", "User logged in successfully");
            req.setAttribute("loggedUser", user);
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("userRole", user.getRole().name().toLowerCase());
            session.setAttribute("userFullName", user.getFirstName() + " " + user.getLastName());
            session.setAttribute("successMessage", "Welcome back, " + user.getFirstName() + "!");

            String redirectPath = switch (user.getRole()) {
                case DOCTOR -> "/doctor/dashboard";
                case ADMIN -> "/admin/dashboard";
                default -> "/home";
            };

            resp.sendRedirect(req.getContextPath() + redirectPath);
        } catch (Exception e) {
            System.out.println("Error on login: " + e.getMessage());
            Map<String, String> error = new HashMap<>();
            error.put("error", "Login failed: " + e.getMessage());
            req.setAttribute("error", error);
            req.getRequestDispatcher("/WEB-INF/view/auth/login.jsp").forward(req, resp);
        }
    }
}
