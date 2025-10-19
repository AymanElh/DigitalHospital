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

import java.io.BufferedReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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

        if (path == null || path.equals("/")) {
            listRooms(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if("create".equalsIgnoreCase(action)) {
            createRoom(req, resp);
        } else if("update".equalsIgnoreCase(action)) {
            updateRoom(req, resp);
        } else {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid request");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(req.getPathInfo());
        String roomIdStr = req.getParameter("id");
        String roomNumberStr = req.getParameter("roomNumber");
        System.out.println(roomIdStr + roomNumberStr);

        try {
            Long roomId = Long.parseLong(roomIdStr);
            roomService.deleteRoom(roomId);
        } catch (NumberFormatException e) {
            req.getSession().setAttribute("errorMessage", e.getMessage());
        } catch (Exception e) {
            req.getSession().setAttribute("errorMessage", e.getMessage());
        }
    }

    // Get methods
    private void listRooms(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Doctor> doctors = doctorService.findAll();
        req.setAttribute("doctors", doctors);
        try {
            List<Room> rooms = roomService.getAllRooms();
            List<RoomDTO> roomsDTO = rooms.stream().map(RoomMapper::toDTO).collect(Collectors.toList());
            req.setAttribute("rooms", roomsDTO);
            req.getRequestDispatcher("/WEB-INF/view/admin/room/list.jsp").forward(req, resp);
        } catch (Exception e) {
            System.out.println("Error getting rooms: " + e.getMessage());
            req.getSession().setAttribute("errorMessage", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
        }
    }

    // Create room
    private void createRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        // create new room
        String roomNumberStr = req.getParameter("roomNumber");

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
        if (!errors.isEmpty()) {
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
                req.getSession().setAttribute("successMessage", "Room " + room.getRoomNumber() + "created successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/rooms");
            }
        } catch (Exception e) {
            System.out.println("Error creating the room: " + e.getMessage());
            req.setAttribute("errorMessage", "Failed to create room: " + e.getMessage());
            req.setAttribute("dto", roomDTO);

            req.getRequestDispatcher("/WEB-INF/view/admin/rooms").forward(req, resp);
        }
    }

    // Update room
    private void updateRoom(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            System.out.println(req.getParameter("id"));
            String roomNumberStr = req.getParameter("roomNumber");
            String roomIdStr = req.getParameter("id"); // Changed from "roomId" to "id"

            RoomDTO roomDTO = new RoomDTO();
            System.out.println("updating room: " + roomDTO);

            try {
                Long roomNumber = Long.parseLong(roomNumberStr);
                roomDTO.setRoomNumber(roomNumber);
            } catch (NumberFormatException e) {
                System.out.println(e.getMessage());
                req.getSession().setAttribute("error", "Invalid room number type");
            }

            try {
                Long roomId = Long.parseLong(roomIdStr);
                roomDTO.setId(roomId);
            } catch (NumberFormatException e) {
                System.out.println(e.getMessage());
                req.getSession().setAttribute("error", "Invalid room number type");
            }

            roomDTO.setIsAvailable(true);
            System.out.println("Room dto: " + roomDTO.getId());

            Map<String, String> errors = ValidationUtil.validate(roomDTO);
            if (!errors.isEmpty()) {
                req.getSession().setAttribute("errors", errors);
                req.getSession().setAttribute("dto", roomDTO);
                resp.sendRedirect(req.getContextPath() + "/admin/rooms");
                return;
            }

            System.out.println("Call mapper to entity");
            System.out.println(RoomMapper.toEntity(roomDTO));
            Room room = roomService.updateRoom(RoomMapper.toEntity(roomDTO));
            System.out.println("udpated room: " + room);
            System.out.println("new room inserted: " + room);
            if (room != null) {
                System.out.println("Room inserted successfully");
                req.getSession().setAttribute("successMessage", "Room udpated successfully");
                resp.sendRedirect(req.getContextPath() + "/admin/rooms");
            }
        } catch (IOException e) {
            req.getSession().setAttribute("error", "Error on request");
        } catch (Exception e) {
            e.printStackTrace();
            req.getSession().setAttribute("errorMessage", e.getMessage());
            resp.sendRedirect(req.getContextPath() + "/admin/rooms");
        }
    }
}
