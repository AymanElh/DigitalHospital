package com.youcode.digitalhospital.servlet.pub;

import com.youcode.digitalhospital.dto.department.DepartmentDTO;
import com.youcode.digitalhospital.mapper.DepartmentMapper;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.service.interfaces.entity.IDepartmentService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/departments")
public class DepartmentPublicServlet extends HttpServlet {

    @Inject
    private IDepartmentService departmentService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Get all departments
            List<Department> departments = departmentService.findAll();
            
            // Convert to DTOs
            List<DepartmentDTO> departmentDTOs = departments.stream()
                    .map(DepartmentMapper::toDTO)
                    .collect(Collectors.toList());

            // Set attributes for JSP
            req.setAttribute("departments", departmentDTOs);
            req.setAttribute("totalDepartments", departmentDTOs.size());

            // Forward to public departments view
            req.getRequestDispatcher("/WEB-INF/view/public/departments.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "Error loading departments: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/view/public/departments.jsp").forward(req, resp);
        }
    }
}

