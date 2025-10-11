package com.youcode.digitalhospital;

import java.io.*;

import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.model.User;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/users")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
//
//        Patient patient = new Patient(1L, "dks", "dlsk", "dlskd", "dslk", "dskl", 289, 29);
//        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }

    public void destroy() {
    }
}