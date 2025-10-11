package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Room;
import jakarta.persistence.EntityManager;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for ConsultationSlot entity
 * Handles slot-specific data access operations and availability management
 */
public interface IConsultationSlotRepository {
    
    /**
     * Find all available slots (not cancelled and without consultation)
     * @param em EntityManager
     * @return List of available slots
     */
    List<ConsultationSlot> findAvailableSlots(EntityManager em);
    
    /**
     * Find available slots for a specific room
     * @param roomId Room ID
     * @param em EntityManager
     * @return List of available slots for the room
     */
    List<ConsultationSlot> findAvailableSlotsByRoom(Long roomId, EntityManager em);
    
    /**
     * Find available slots for a specific date
     * @param date The date to check
     * @param em EntityManager
     * @return List of available slots on that date
     */
    List<ConsultationSlot> findAvailableSlotsByDate(LocalDateTime date, EntityManager em);
    
    /**
     * Find available slots for a specific room and date
     * @param roomId Room ID
     * @param date The date to check
     * @param em EntityManager
     * @return List of available slots for the room on that date
     */
    List<ConsultationSlot> findAvailableSlotsByRoomAndDate(Long roomId, LocalDateTime date, EntityManager em);


    /**
     * Find cancelled slots
     * @param em EntityManager
     * @return List of cancelled slots
     */
    List<ConsultationSlot> findCancelledSlots(EntityManager em);
    
    /**
     * Check if a slot is available (not occupied and not cancelled)
     * @param slotId Slot ID
     * @param em EntityManager
     * @return True if slot is available
     */
    boolean isSlotAvailable(Long slotId, EntityManager em);

    /**
     * Find slots by room
     * @param room Room entity
     * @param em EntityManager
     * @return List of slots for the room
     */
    List<ConsultationSlot> findByRoom(Room room, EntityManager em);
    
    /**
     * Find slots by room and date range
     * @param roomId Room ID
     * @param startDate Start date
     * @param endDate End date
     * @param em EntityManager
     * @return List of slots within the date range
     */
    List<ConsultationSlot> findByRoomAndDateRange(Long roomId, LocalDateTime startDate, LocalDateTime endDate, EntityManager em);
    
    /**
     * Count available slots (for statistics)
     * @param em EntityManager
     * @return Count of available slots
     */
    Long countAvailableSlots(EntityManager em);
    
    /**
     * Count occupied slots (for room occupancy rate)
     * @param em EntityManager
     * @return Count of occupied slots
     */
    Long countOccupiedSlots(EntityManager em);
    
    /**
     * Find slots with consultation (eager fetch)
     * @param slotId Slot ID
     * @param em EntityManager
     * @return Optional containing the slot with its consultation
     */
    Optional<ConsultationSlot> findByIdWithConsultation(Long slotId, EntityManager em);
}

