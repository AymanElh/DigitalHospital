package com.youcode.digitalhospital.servlet.admin;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.dto.department.DepartmentDTO;
import com.youcode.digitalhospital.dto.doctor.DoctorDTO;
import com.youcode.digitalhospital.dto.room.RoomDTO;
import com.youcode.digitalhospital.mapper.DepartmentMapper;
import com.youcode.digitalhospital.mapper.DoctorMapper;
import com.youcode.digitalhospital.mapper.RoomMapper;
import com.youcode.digitalhospital.model.*;
import com.youcode.digitalhospital.service.interfaces.business.IAuthenticationService;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import com.youcode.digitalhospital.service.interfaces.entity.IDepartmentService;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import com.youcode.digitalhospital.service.interfaces.entity.IRoomService;
import com.youcode.digitalhospital.service.impl.buisiness.SlotGeneratorService;
import com.youcode.digitalhospital.util.ValidationUtil;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@WebServlet("/admin/doctors/*")
public class DoctorServlet extends HttpServlet {
    @Inject
    IDoctorService doctorService;
    @Inject
    IRoomService roomService;
    @Inject
    IDepartmentService departmentService;
    @Inject
    IAuthenticationService authService;
    @Inject
    SlotGeneratorService slotGeneratorService;
    @Inject
    IConsultationService consultationService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo != null && pathInfo.equals("/create")) {
            showCreateForm(req, resp);
        } else if (pathInfo != null && pathInfo.matches("^/\\d+/schedule$")) {
            String[] parts = pathInfo.split("/");
            Long doctorId = Long.parseLong(parts[1]);
            showDoctorSchedule(req, resp, doctorId);
        } else if (pathInfo != null && pathInfo.matches("^/\\d+$")) {
            Long doctorId = Long.parseLong(pathInfo.substring(1)); // remove leading slash
            showDoctorDetails(req, resp, doctorId);
        } else {
            listDoctors(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pathInfo = req.getPathInfo();

        if (pathInfo == null || pathInfo.equals("/create")) {
            createDoctor(req, resp);
        } else if (pathInfo.equals("/edit-info")) {
            Long doctorId = Long.parseLong(req.getParameter("id"));
            editPersonalInfo(req, resp, doctorId);
        } else if (pathInfo.equals("/assign-department")) {
            Long doctorId = Long.parseLong(req.getParameter("doctorId"));
            assignDepartment(req, resp, doctorId);
        } else if (pathInfo.equals("/attach-room")) {
            Long doctorId = Long.parseLong(req.getParameter("doctorId"));
            attachRoom(req, resp, doctorId);
        } else if (pathInfo.equals("/generate-slots")) {
            Long doctorId = Long.parseLong(req.getParameter("doctorId"));
            generateSlots(req, resp, doctorId);
        } else if (pathInfo.equals("/delete")) {
            Long doctorId = Long.parseLong(req.getParameter("id"));
            deleteDoctor(req, resp, doctorId);
        } else if (pathInfo.equals("/consultations")) {

        }
    }

    /**
     * Display the list of all doctors
     */
    private void listDoctors(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DepartmentDTO> departmentList = departmentService.findAll().stream().map(DepartmentMapper::toDTO).toList();
        req.setAttribute("departments", departmentList);

        String str = "ali";
        str.toUpperCase();
        List<DoctorDTO> doctors = doctorService.findAll().stream().map(DoctorMapper::toDTO).collect(Collectors.toList());

        Long totalSpec = doctors
                .stream()
                .map(d -> d.getSpeciality())
                .filter(Objects::nonNull)
                .distinct()
                .count();

        req.setAttribute("doctors", doctors);
        req.setAttribute("totalDoctors", doctors.size());
        req.setAttribute("countSpecialities", totalSpec);

        req.getRequestDispatcher("/WEB-INF/view/admin/doctor/doctors.jsp").forward(req, resp);
    }

    /**
     * Display creates doctor form
     */
    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Load departments for the department dropdown
        List<Department> departmentList = departmentService.findAll();
        req.setAttribute("departments", departmentList);

        List<Room> rooms = roomService.getAllRooms();
        req.setAttribute("rooms", rooms);

        req.getRequestDispatcher("/WEB-INF/view/admin/doctor/create-doctor.jsp").forward(req, resp);
    }

    /**
     * Create new doctor with post
     */
    private void createDoctor(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String speciality = req.getParameter("speciality");
        String departmentIdStr = req.getParameter("departmentId");
        String roomIdStr = req.getParameter("roomId");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // create dto
        DoctorDTO dto = new DoctorDTO();
        dto.setFirstName(firstName);
        dto.setLastName(lastName);
        dto.setEmail(email);
        dto.setSpeciality(speciality);
        dto.setPassword(password);
        dto.setConfirmPassword(confirmPassword);

        try {
            if (departmentIdStr != null && !departmentIdStr.trim().isEmpty()) {
                dto.setDepartmentId(Long.parseLong(departmentIdStr));
            }
        } catch (NumberFormatException e) {
            // Will be caught by validation
        }

        // Parse roomId (optional)
        try {
            if (roomIdStr != null && !roomIdStr.trim().isEmpty()) {
                dto.setRoomId(Long.parseLong(roomIdStr));
            }
        } catch (NumberFormatException e) {
            // Room is optional, ignore
        }

        Map<String, String> errors = ValidationUtil.validate(dto);

        if (password != null && confirmPassword != null) {
            if (!password.equals(confirmPassword)) {
                errors.put("confirmPassword", "Passwords do not match");
            }
        }

        if (authService.isEmailRegistred(email)) {
            errors.put("email", "This email is already registered");
        }

        if (!errors.isEmpty()) {
            req.setAttribute("errors", errors);
            req.setAttribute("dto", dto);

            List<Department> departments = departmentService.findAll();
            List<Room> rooms = roomService.getAllRooms();
            req.setAttribute("departments", departments);
            req.setAttribute("rooms", rooms);

            req.getRequestDispatcher("/WEB-INF/view/admin/doctor/create-doctor.jsp").forward(req, resp);
            return;
        }
        try {
            Doctor doctor = DoctorMapper.toEntity(dto);
            Department dep = departmentService.findById(dto.getDepartmentId()).orElseThrow(() -> new IllegalArgumentException("Department not found"));
            doctor.setDepartment(dep);
            if (dto.getRoomId() != null) {
                roomService.getRoomById(dto.getRoomId()).ifPresent((room) -> doctor.setRoom(room));
            }

            Doctor savedDoctor = doctorService.create(doctor);
            req.getSession().setAttribute("successMessage", "Doctor " + doctor.getFirstName() + " " + doctor.getLastName() + " added successfully");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        } catch (Exception e) {
            e.printStackTrace();

            // Error: stay on form
            Map<String, String> serviceErrors = new HashMap<>();
            serviceErrors.put("general", "Failed to create doctor: " + e.getMessage());

            req.setAttribute("errors", serviceErrors);
            req.setAttribute("dto", dto);

            List<Department> departments = departmentService.findAll();
            List<Room> rooms = roomService.getAllRooms();
            req.setAttribute("rooms", rooms);
            req.setAttribute("departments", departments);

            req.setAttribute("errorMessage", e.getMessage());

            req.getRequestDispatcher("/WEB-INF/view/admin/doctor/create-doctor.jsp")
                    .forward(req, resp);
        }
    }

    /**
     * Show doctor personal info
     */
    private void showDoctorDetails(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Doctor id is invalid");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Find doctor by id
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);

            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found with id: " + doctorId);
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            Doctor doctor = doctorOptional.get();

            DoctorDTO dto = DoctorMapper.toDTO(doctor);

            List<DepartmentDTO> departments = departmentService.findAll().stream()
                    .map(DepartmentMapper::toDTO)
                    .collect(Collectors.toList());

            List<RoomDTO> rooms = roomService.getAllRooms().stream().map(RoomMapper::toDTO).collect(Collectors.toList());

            req.setAttribute("doctor", dto);
            req.setAttribute("departments", departments);
            req.setAttribute("rooms", rooms);

            // Forward to the view page
            req.getRequestDispatcher("/WEB-INF/view/admin/doctor/view.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error loading doctor details: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        }
    }

    /**
     * Edit doctor personal info like name, email ...
     */
    private void editPersonalInfo(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor id");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Get form parameters
            String firstName = req.getParameter("firstName");
            String lastName = req.getParameter("lastName");
            String email = req.getParameter("email");
            String phone = req.getParameter("phone");
            String speciality = req.getParameter("speciality");

            // Find the doctor
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found with id: " + doctorId);
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            Doctor doctor = doctorOptional.get();

            // Create DTO for validation
            DoctorDTO dto = new DoctorDTO();
            dto.setId(doctorId);
            dto.setFirstName(firstName);
            dto.setLastName(lastName);
            dto.setEmail(email);
            dto.setPhone(phone);
            dto.setSpeciality(speciality);

            // Validate only the fields we're updating
            Map<String, String> errors = new HashMap<>();

            if (firstName == null || firstName.trim().isEmpty()) {
                errors.put("firstName", "First name is required");
            }

            if (lastName == null || lastName.trim().isEmpty()) {
                errors.put("lastName", "Last name is required");
            }

            if (email == null || email.trim().isEmpty()) {
                errors.put("email", "Email is required");
            } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                errors.put("email", "Invalid email format");
            } else if (!email.equals(doctor.getEmail()) && authService.isEmailRegistred(email)) {
                errors.put("email", "This email is already registered");
            }

            if (speciality == null || speciality.trim().isEmpty()) {
                errors.put("speciality", "Speciality is required");
            }

            if (phone != null && !phone.trim().isEmpty()) {
                if (!phone.matches("^(\\+212|0)[5-7][0-9]{8}$")) {
                    errors.put("phone", "Invalid Moroccan phone number format");
                }
            }

            if (!errors.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Validation failed: " + errors.values().iterator().next());
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            // Update doctor fields
            doctor.setFirstName(firstName.trim());
            doctor.setLastName(lastName.trim());
            doctor.setEmail(email.trim());
            doctor.setSpeciality(speciality.trim());

            // Save updated doctor
            Doctor updatedDoctor = doctorService.update(doctor);

            req.getSession().setAttribute("successMessage", "Doctor information updated successfully");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);

        } catch (Exception e) {
//            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error updating doctor information: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        }
    }

    /**
     * Assign a department to a doctor
     */
    private void assignDepartment(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor id");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Get the department ID from the request
            Long departmentId = Long.parseLong(req.getParameter("departmentId"));

            // Find the doctor by ID
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found with id: " + doctorId);
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            Doctor doctor = doctorOptional.get();

            // Find the department by ID
            Department department = departmentService.findById(departmentId)
                    .orElseThrow(() -> new IllegalArgumentException("Department not found"));

            // Assign the department to the doctor
            doctor.setDepartment(department);

            // Save the updated doctor
            doctorService.update(doctor);

            req.getSession().setAttribute("successMessage", "Department assigned to doctor successfully");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error assigning department: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        }
    }

    /**
     * Give room to a dcctor or modify it
     */
    private void attachRoom(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor id");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Get the room ID from the request
            Long roomId = Long.parseLong(req.getParameter("roomId"));

            // Save the updated doctor
            doctorService.assignRoomToDoctor(doctorId, roomId);

            req.getSession().setAttribute("successMessage", "Room attached to doctor successfully");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        }
    }


    /**
     * Generate slots for doctor work days
     */
    private void generateSlots(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor id");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Get the date range from the request
            String startDateStr = req.getParameter("startDate");
            String endDateStr = req.getParameter("endDate");

            // Validate input
            if (startDateStr == null || startDateStr.trim().isEmpty() ||
                    endDateStr == null || endDateStr.trim().isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Start date and end date are required");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            // Parse dates
            LocalDate startDate = LocalDate.parse(startDateStr);
            LocalDate endDate = LocalDate.parse(endDateStr);

            // Validate date range
            if (endDate.isBefore(startDate)) {
                req.getSession().setAttribute("errorMessage", "End date must be after start date");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            if (!startDate.isAfter(LocalDate.now().plusDays(1))) {
                req.getSession().setAttribute("errorMessage", "You can't assign slots today, you should start from tomorrow");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            // Find the doctor by ID
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found with id: " + doctorId);
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            Doctor doctor = doctorOptional.get();


            if (doctor.getRoom() == null) {
                req.getSession().setAttribute("errorMessage", "Doctor must have a room attached before generating slots");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            if (doctor.getDepartment() == null) {
                req.getSession().setAttribute("errorMessage", "Doctor must be assigned to a department before generating slots");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
                return;
            }

            // Generate slots using the slot generator service
            int slotsGenerated = slotGeneratorService.generateSlotsForDoctor(doctorId, startDate, endDate);
            System.out.println("Slots generated: " + slotsGenerated);

            req.getSession().setAttribute("successMessage",
                    "Successfully generated " + slotsGenerated + " consultation slots for Dr. " +
                            doctor.getFirstName() + " " + doctor.getLastName());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);

        } catch (java.time.format.DateTimeParseException e) {
            req.getSession().setAttribute("errorMessage", "Invalid date format. Please use YYYY-MM-DD format");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error generating slots: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        }
    }

    private void deleteDoctor(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        if (doctorId == null) {
            req.getSession().setAttribute("errorMessage", "Invalid doctor id");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
            return;
        }

        try {
            // Find the doctor by ID
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found with id: " + doctorId);
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            // Delete the doctor
            doctorService.delete(doctorId);

            req.getSession().setAttribute("successMessage", "Doctor deleted successfully");
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error deleting doctor: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors");
        }
    }

    /**
     * Show doctor schedule
     */
    private void showDoctorSchedule(HttpServletRequest req, HttpServletResponse resp, Long doctorId) throws ServletException, IOException {
        try {
            // Get the doctor
            Optional<Doctor> doctorOptional = doctorService.findById(doctorId);
            if (doctorOptional.isEmpty()) {
                req.getSession().setAttribute("errorMessage", "Doctor not found");
                resp.sendRedirect(req.getContextPath() + "/admin/doctors");
                return;
            }

            Doctor doctor = doctorOptional.get();
            DoctorDTO doctorDTO = DoctorMapper.toDTO(doctor);
            req.setAttribute("doctor", doctorDTO);

            // Get the selected date from parameter
            String dateParam = req.getParameter("date");

            if(dateParam != null) {
                LocalDate scheduleDate = LocalDate.parse(dateParam);
                System.out.println("Schedule date: " + scheduleDate);

                List<ConsultationSlot> slots = consultationService.getDoctorPlaning(doctorId, scheduleDate);

                req.setAttribute("slots", slots);
            }

            req.getRequestDispatcher("/WEB-INF/view/admin/doctor/schedule.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", "Error loading schedule: " + e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/doctors/" + doctorId);
        }
    }

}
