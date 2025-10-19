package com.youcode.digitalhospital.servlet.admin;

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

@WebServlet("/admin/departments")
public class DepartmentServlet extends HttpServlet {

    @Inject
    IDepartmentService departmentService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Fetch all departments from service
            List<Department> departments = departmentService.findAll();

            // Convert to DTOs using mapper
            List<DepartmentDTO> departmentDTOs = departments.stream()
                    .map(DepartmentMapper::toDTO)
                    .collect(Collectors.toList());

            // Set departments as request attribute
            req.setAttribute("departments", departmentDTOs);

            // Forward to JSP
            req.getRequestDispatcher("/WEB-INF/view/admin/department/departments.jsp").forward(req, resp);

        } catch (Exception e) {
            System.err.println("Error fetching departments: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", "Error loading departments: " + e.getMessage());
            req.getRequestDispatcher("/WEB-INF/view/admin/department/departments.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("create".equalsIgnoreCase(action)) {
            createDepartment(req, resp);
        } else if ("update".equalsIgnoreCase(action)) {
            updateDepartment(req, resp);
        } else if ("delete".equalsIgnoreCase(action)) {
            deleteDepartment(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }

    /**
     * Create a new department
     */
    private void createDepartment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // Get form parameters
            String name = req.getParameter("name");
            String description = req.getParameter("description");

            // Basic validation
            if (name == null || name.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Department name is required");
                resp.sendRedirect(req.getContextPath() + "/admin/departments");
                return;
            }

            // Create new Department entity
            Department department = new Department();
            department.setName(name.trim());
            department.setDescription(description != null ? description.trim() : "");

            // Save via service
            Department savedDepartment = departmentService.create(department);

            // Success message
            req.getSession().setAttribute("successMessage",
                    "Department '" + savedDepartment.getName() + "' created successfully!");

        } catch (Exception e) {
            System.err.println("Error creating department: " + e.getMessage());
            req.getSession().setAttribute("errorMessage",
                    "Error creating department: " + e.getMessage());
        }

        // Redirect back to departments list
        resp.sendRedirect(req.getContextPath() + "/admin/departments");
    }

    /**
     * Update an existing department
     */
    private void updateDepartment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // Get form parameters
            String idStr = req.getParameter("id");
            String name = req.getParameter("name");
            String description = req.getParameter("description");

            // Basic validation
            if (idStr == null || idStr.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Department ID is required");
                resp.sendRedirect(req.getContextPath() + "/admin/departments");
                return;
            }

            if (name == null || name.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Department name is required");
                resp.sendRedirect(req.getContextPath() + "/admin/departments");
                return;
            }

            // Parse ID
            Long id = Long.parseLong(idStr);

            // Create Department entity with updated values
            Department department = new Department();
            department.setId(id);
            department.setName(name.trim());
            department.setDescription(description != null ? description.trim() : "");

            // Update via service
            Department updatedDepartment = departmentService.update(department);

            // Success message
            req.getSession().setAttribute("successMessage",
                    "Department '" + updatedDepartment.getName() + "' updated successfully!");

        } catch (NumberFormatException e) {
            System.err.println("Invalid department ID format: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", "Invalid department ID");
        } catch (Exception e) {
            System.err.println("Error updating department: " + e.getMessage());
            req.getSession().setAttribute("errorMessage",
                    "Error updating department: " + e.getMessage());
        }

        // Redirect back to departments list
        resp.sendRedirect(req.getContextPath() + "/admin/departments");
    }

    /**
     * Delete a department
     */
    private void deleteDepartment(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // Get department ID
            String idStr = req.getParameter("id");

            // Basic validation
            if (idStr == null || idStr.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Department ID is required");
                resp.sendRedirect(req.getContextPath() + "/admin/departments");
                return;
            }

            // Parse ID
            Long id = Long.parseLong(idStr);

            String departmentName = req.getParameter("name");

            // Delete via service
            departmentService.delete(id);

            // Success message
            String message = departmentName != null && !departmentName.trim().isEmpty()
                    ? "Department '" + departmentName + "' deleted successfully!"
                    : "Department deleted successfully!";
            req.getSession().setAttribute("successMessage", message);

        } catch (NumberFormatException e) {
            System.err.println("Invalid department ID format: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", "Invalid department ID");
        } catch (Exception e) {
            System.err.println("Error deleting department: " + e.getMessage());
            req.getSession().setAttribute("errorMessage",
                    e.getMessage());
        }

        // Redirect back to departments list
        resp.sendRedirect(req.getContextPath() + "/admin/departments");
    }
}
