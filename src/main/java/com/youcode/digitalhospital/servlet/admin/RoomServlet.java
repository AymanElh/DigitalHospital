package com.youcode.digitalhospital.servlet.admin;

import com.youcode.digitalhospital.dto.room.RoomDTO;
import com.youcode.digitalhospital.mapper.RoomMapper;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import com.youcode.digitalhospital.service.interfaces.entity.IRoomService;
import com.youcode.digitalhospital.util.ValidationUtil;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/admin/rooms/*")
public class RoomServlet extends HttpServlet {

    @Inject
    IRoomService roomService;
    @Inject
    IDoctorService doctorService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();
        System.out.println("Path: " + path);

        if(path == null || path.equals("/")) {
            listRooms(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // create new room
        String roomNumberStr = req.getParameter("roomNumber"); // Changed from getAttribute to getParameter

        RoomDTO roomDTO = new RoomDTO();

        // Parse the room number string to Long
        try {
            if (roomNumberStr != null && !roomNumberStr.trim().isEmpty()) {
                roomDTO.setRoomNumber(Long.parseLong(roomNumberStr));
            }
        } catch (NumberFormatException e) {
            Map<String, String> errors = new HashMap<>();
            errors.put("roomNumber", "Invalid room number format");
            req.getSession().setAttribute("errors", errors);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
            return;
        }
        roomDTO.setIsAvailable(true);
        Map<String, String> errors = ValidationUtil.validate(roomDTO);
        if(!errors.isEmpty()) {
            req.getSession().setAttribute("errors", errors);
            req.getSession().setAttribute("dto", roomDTO);
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
            return;
        }
        System.out.println("Room dto: " + roomDTO);

        try {
            System.out.println("Adding new room");
            Room room = roomService.addNewRoom(RoomMapper.toEntity(roomDTO));
            System.out.println("new room inserted: " + room);
            if (room != null) {
                System.out.println("Room inserted successfully");
                req.getSession().setAttribute("successMessage", "Room created successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/rooms");
            }
        } catch (Exception e) {
            System.out.println("Error creating the room: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
        }
    }

    // Get methods
    private void listRooms(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Doctor> doctors = doctorService.findAll();
        req.setAttribute("doctors", doctors);
        try {
            List<Room> rooms = roomService.getAllRooms();
            System.out.println(rooms);
            req.setAttribute("rooms", rooms);
            req.getRequestDispatcher("/WEB-INF/view/admin/room/list.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println("Error getting rooms: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
        }
    }
}
