package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.repository.imp.GenericRepositoryImp;
import jakarta.persistence.EntityManager;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Room entity
 * Handles room-specific data access operations and slot management
 */
public interface IRoomRepository extends IGenericRepository<Room> {

    /**
     * Find a room by room number
     * @param roomNumber Room number
     * @param em EntityManager
     * @return Optional containing the room if found
     */
    Optional<Room> findByRoomNumber(Long roomNumber, EntityManager em);

    /**
     * Find all available rooms (not currently occupied)
     * @param em EntityManager
     * @return List of available rooms
     */
    List<Room> findAvailableRooms(EntityManager em);

    /**
     * Find rooms available for a specific time slot
     * @param startTime Slot start time
     * @param endTime Slot end time
     * @param em EntityManager
     * @return List of rooms available during that time slot
     */
    List<Room> findAvailableRoomsForTimeSlot(LocalDateTime startTime, LocalDateTime endTime, EntityManager em);

    /**
     * Find rooms with available slots on a specific date
     * @param date The date to check
     * @param em EntityManager
     * @return List of rooms with available slots on that date
     */
    List<Room> findRoomsWithAvailableSlotsOnDate(LocalDateTime date, EntityManager em);

    /**
     * Count total rooms (for admin statistics)
     * @param em EntityManager
     * @return Total count of rooms
     */
    Long countAllRooms(EntityManager em);

    /**
     * Count available rooms
     * @param em EntityManager
     * @return Count of available rooms
     */
    Long countAvailableRooms(EntityManager em);

    /**
     * Find room with its slots (eager fetch)
     * @param roomId Room ID
     * @param em EntityManager
     * @return Optional containing the room with its slots
     */
    Optional<Room> findByIdWithSlots(Long roomId, EntityManager em);

    /**
     * Check if room is available at specific time (for reservation validation)
     * @param roomId Room ID
     * @param startTime Start time
     * @param endTime End time
     * @param em EntityManager
     * @return True if room is available during that time
     */
    boolean isRoomAvailableAtTime(Long roomId, LocalDateTime startTime, LocalDateTime endTime, EntityManager em);

    /**
     * Find the most available room (room with most free slots)
     * @param em EntityManager
     * @return Optional containing the most available room
     */
    Optional<Room> findMostAvailableRoom(EntityManager em);
}
