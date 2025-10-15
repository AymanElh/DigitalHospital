package com.youcode.digitalhospital.service.impl.entity;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.repository.imp.RoomRepositoryImp;
import com.youcode.digitalhospital.repository.interfaces.IRoomRepository;
import com.youcode.digitalhospital.service.interfaces.entity.IRoomService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class RoomServiceImp implements IRoomService {

    private final IRoomRepository roomRepository;

    public RoomServiceImp() {
        this.roomRepository = new RoomRepositoryImp();
    }

    @Override
    public Room addNewRoom(Room room) {
        if (room == null) {
            throw new IllegalArgumentException("Room cannot be null");
        }

        // Validate room number
        if (room.getRoomNumber() == null || room.getRoomNumber() <= 0) {
            throw new IllegalArgumentException("Room number must be a positive number");
        }

        // Check if room number already exists
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Optional<Room> existingRoom = roomRepository.findByRoomNumber(room.getRoomNumber(), em);
            if (existingRoom.isPresent()) {
                throw new IllegalArgumentException("Room with number " + room.getRoomNumber() + " already exists");
            }
        } catch (Exception e) {
            // Room not found is expected, continue
        } finally {
            em.close();
        }

        // Set room as available by default
        room.setAvailable(true);

        // Save room
        EntityManager emSave = JPAConfig.getEntityManager();
        EntityTransaction transaction = emSave.getTransaction();
        try {
            transaction.begin();
            emSave.persist(room);
            transaction.commit();
            return room;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error saving room: " + e.getMessage(), e);
        } finally {
            emSave.close();
        }
    }

    @Override
    public Room updateRoom(Room room) {
        if (room == null) {
            throw new IllegalArgumentException("Room cannot be null");
        }

        if (room.getId() == null) {
            throw new IllegalArgumentException("Room ID cannot be null for update");
        }

        // Validate room number
        if (room.getRoomNumber() == null || room.getRoomNumber() <= 0) {
            throw new IllegalArgumentException("Room number must be a positive number");
        }

        // Check if room exists
        Optional<Room> existingRoom = getRoomById(room.getId());
        if (existingRoom.isEmpty()) {
            throw new IllegalArgumentException("Room with ID " + room.getId() + " not found");
        }

        // Update room
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Room updatedRoom = em.merge(room);
            transaction.commit();
            return updatedRoom;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error updating room: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void deleteRoom(Long roomId) {
        if (roomId == null || roomId <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }

        // Check if room exists
        Optional<Room> room = getRoomById(roomId);
        if (room.isEmpty()) {
            throw new IllegalArgumentException("Room with ID " + roomId + " not found");
        }

        // Delete room
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction transaction = em.getTransaction();
        try {
            transaction.begin();
            Room roomToDelete = em.find(Room.class, roomId);
            if (roomToDelete != null) {
                em.remove(roomToDelete);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Error deleting room: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Room> getRoomById(Long id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            Room room = em.find(Room.class, id);
            return Optional.ofNullable(room);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Room> getRoomWithSlots(Long roomId) {
        if (roomId == null || roomId <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findByIdWithSlots(roomId, em);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Room> getRoomByNumber(Long roomNumber) {
        if (roomNumber == null || roomNumber <= 0) {
            throw new IllegalArgumentException("Invalid room number");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findByRoomNumber(roomNumber, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Room> getAllRooms() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT r FROM Room r ORDER BY r.roomNumber";
            return em.createQuery(jpql, Room.class).getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Room> getAvailableRooms() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findAvailableRooms(em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Room> getAvailableRoomsForTimeSlot(LocalDateTime startTime, LocalDateTime endTime) {
        if (startTime == null || endTime == null) {
            throw new IllegalArgumentException("Start time and end time cannot be null");
        }

        if (startTime.isAfter(endTime)) {
            throw new IllegalArgumentException("Start time must be before end time");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findAvailableRoomsForTimeSlot(startTime, endTime, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Room> getRoomsWithAvailableSlotsOnDate(LocalDateTime date) {
        if (date == null) {
            throw new IllegalArgumentException("Date cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findRoomsWithAvailableSlotsOnDate(date, em);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean isRoomAvailableAtTime(Long roomId, LocalDateTime startTime, LocalDateTime endTime) {
        if (roomId == null || roomId <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }

        if (startTime == null || endTime == null) {
            throw new IllegalArgumentException("Start time and end time cannot be null");
        }

        if (startTime.isAfter(endTime)) {
            throw new IllegalArgumentException("Start time must be before end time");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.isRoomAvailableAtTime(roomId, startTime, endTime, em);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Room> getMostAvailableRoom() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.findMostAvailableRoom(em);
        } finally {
            em.close();
        }
    }

    @Override
    public Long countAllRooms() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.countAllRooms(em);
        } finally {
            em.close();
        }
    }

    @Override
    public Long countAvailableRooms() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return roomRepository.countAvailableRooms(em);
        } finally {
            em.close();
        }
    }

    @Override
    public void setRoomAvailability(Long roomId, boolean isAvailable) {
        if (roomId == null || roomId <= 0) {
            throw new IllegalArgumentException("Invalid room ID");
        }

        // Get the room
        Optional<Room> roomOpt = getRoomById(roomId);
        if (roomOpt.isEmpty()) {
            throw new IllegalArgumentException("Room with ID " + roomId + " not found");
        }

        Room room = roomOpt.get();
        room.setAvailable(isAvailable);

        // Update the room
        updateRoom(room);
    }
}
