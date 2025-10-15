package com.youcode.digitalhospital.servlet.auth;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        if(session != null) {
            String userName = (String) session.getAttribute("userFullName");
            Long userId = (Long) session.getAttribute("userId");

            session.invalidate();
        }

        HttpSession newSession = req.getSession(true);
        newSession.setAttribute("successMessage", "You have been logged out successfully.");

        resp.sendRedirect(req.getContextPath() + "/login");
    }
}
