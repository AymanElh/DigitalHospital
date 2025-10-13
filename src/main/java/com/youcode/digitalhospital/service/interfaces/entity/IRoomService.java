package com.youcode.digitalhospital.service.interfaces.entity;

import com.youcode.digitalhospital.model.Room;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Service interface for Room business logic
 * Handles room management and availability operations
 */
public interface IRoomService {

    /**
     * Add a new room to the system
     * @param room Room to add
     * @return Created room
     */
    Room addNewRoom(Room room);

    /**
     * Update an existing room
     * @param room Room to update
     * @return Updated room
     */
    Room updateRoom(Room room);

    /**
     * Delete a room
     * @param roomId Room ID to delete
     */
    void deleteRoom(Long roomId);

    /**
     * Get a room by ID
     * @param id Room ID
     * @return Optional containing the room if found
     */
    Optional<Room> getRoomById(Long id);

    /**
     * Get room with its consultation slots
     * @param roomId Room ID
     * @return Optional containing the room with slots
     */
    Optional<Room> getRoomWithSlots(Long roomId);

    /**
     * Get room by room number
     * @param roomNumber Room number
     * @return Optional containing the room if found
     */
    Optional<Room> getRoomByNumber(Long roomNumber);

    /**
     * Get all rooms in the system
     * @return List of all rooms
     */
    List<Room> getAllRooms();

    /**
     * Get all available rooms
     * @return List of available rooms
     */
    List<Room> getAvailableRooms();

    /**
     * Get available rooms for a specific time slot
     * @param startTime Slot start time
     * @param endTime Slot end time
     * @return List of available rooms
     */
    List<Room> getAvailableRoomsForTimeSlot(LocalDateTime startTime, LocalDateTime endTime);

    /**
     * Get rooms with available slots on a specific date
     * @param date Date to check
     * @return List of rooms with available slots
     */
    List<Room> getRoomsWithAvailableSlotsOnDate(LocalDateTime date);

    /**
     * Check if a room is available at a specific time
     * @param roomId Room ID
     * @param startTime Start time
     * @param endTime End time
     * @return True if available, false otherwise
     */
    boolean isRoomAvailableAtTime(Long roomId, LocalDateTime startTime, LocalDateTime endTime);

    /**
     * Get the most available room (for auto-assignment)
     * @return Optional containing the most available room
     */
    Optional<Room> getMostAvailableRoom();

    /**
     * Count total rooms
     * @return Total count of rooms
     */
    Long countAllRooms();

    /**
     * Count available rooms
     * @return Count of available rooms
     */
    Long countAvailableRooms();

    /**
     * Set room availability status
     * @param roomId Room ID
     * @param isAvailable Availability status
     */
    void setRoomAvailability(Long roomId, boolean isAvailable);
}
