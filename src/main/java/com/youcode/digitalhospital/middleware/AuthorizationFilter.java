package com.youcode.digitalhospital.middleware;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/admin/*", "/doctor/*", "/patient/*"})
public class AuthorizationFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession(false);
        
        // Get user role from session
        String userRole = (String) session.getAttribute("userRole");
        String requestURI = req.getRequestURI();
        String contextPath = req.getContextPath();
        
        // Extract the route path (remove context path)
        String path = requestURI.substring(contextPath.length());

        System.out.println("Authorization Filter - Path: " + path + ", User Role: " + userRole);

        // Authorization check - ensure user can only access their own routes
        if (path.startsWith("/admin/")) {
            if (!"admin".equalsIgnoreCase(userRole)) {
                System.out.println("DENIED: User with role '" + userRole + "' attempted to access admin route: " + path);
                session.setAttribute("errorMessage", "Access denied. Administrator privileges required.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        }

        if (path.startsWith("/doctor/")) {
            if (!"doctor".equalsIgnoreCase(userRole)) {
                System.out.println("DENIED: User with role '" + userRole + "' attempted to access doctor route: " + path);
                session.setAttribute("errorMessage", "Access denied. Doctor privileges required.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        }

        if (path.startsWith("/patient/")) {
            if (!"patient".equalsIgnoreCase(userRole)) {
                System.out.println("DENIED: User with role '" + userRole + "' attempted to access patient route: " + path);
                session.setAttribute("errorMessage", "Access denied. Patient privileges required.");
                resp.sendRedirect(req.getContextPath() + "/login");
                return;
            }
        }

        // User is authorized, continue with the request
        System.out.println("AUTHORIZED: User with role '" + userRole + "' accessing: " + path);
        filterChain.doFilter(req, resp);
    }
}

