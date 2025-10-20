package com.youcode.digitalhospital.middleware;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = {"/admin/*", "/doctor/*"})
public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) servletRequest;
        HttpServletResponse resp = (HttpServletResponse) servletResponse;

        HttpSession session = req.getSession(false);

        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);

        if(!isLoggedIn) {
            System.out.println("User not authenticated, redirecting to login");
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        filterChain.doFilter(req, resp);
    }
}
