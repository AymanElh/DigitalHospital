package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.repository.interfaces.IConsultationSlotRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.NoResultException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class ConsultationSlotRepositoryImp implements IConsultationSlotRepository {

    private static final String FIND_AVAILABLE_SLOTS_JPQL = "SELECT cs FROM ConsultationSlot cs WHERE cs.isCancelled = false AND cs.consultation IS NULL";
    private static final String COUNT_AVAILABLE_SLOTS_JPQL = "SELECT COUNT(cs) FROM ConsultationSlot cs WHERE cs.isCancelled = false AND cs.consultation IS NULL";
    private static final String FIND_AVAILABLE_SLOTS_BY_ROOM_JPQL = "SELECT cs FROM ConsultationSlot cs WHERE cs.room.id = :roomId AND cs.isCancelled = false AND cs.consultation IS NULL";
    private static final String FIND_AVAILABLE_SLOTS_BY_DATE_JPQL = "SELECT cs FROM ConsultationSlot cs WHERE FUNCTION('DATE', cs.startTime) = FUNCTION('DATE', :date) AND cs.isCancelled = false AND cs.consultation IS NULL";


    @Override
    public Long countAvailableSlots(EntityManager em) {
        return em.createQuery(COUNT_AVAILABLE_SLOTS_JPQL, Long.class)
                .getSingleResult();
    }

    @Override
    public List<ConsultationSlot> findAvailableSlots(EntityManager em) {
        return em.createQuery(FIND_AVAILABLE_SLOTS_JPQL, ConsultationSlot.class)
                .getResultList();
    }

    @Override
    public List<ConsultationSlot> findAvailableSlotsByRoom(Long roomId, EntityManager em) {
        return em.createQuery(FIND_AVAILABLE_SLOTS_BY_ROOM_JPQL, ConsultationSlot.class)
                .setParameter("roomId", roomId)
                .getResultList();
    }

    @Override
    public List<ConsultationSlot> findAvailableSlotsByDate(LocalDateTime date, EntityManager em) {
        return em.createQuery(FIND_AVAILABLE_SLOTS_BY_DATE_JPQL, ConsultationSlot.class)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<ConsultationSlot> findAvailableSlotsByRoomAndDate(Long roomId, LocalDateTime date, EntityManager em) {
        return em.createNamedQuery("ConsultationSlot.findAvailableByRoomAndDate", ConsultationSlot.class)
                .setParameter("roomId", roomId)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<ConsultationSlot> findCancelledSlots(EntityManager em) {
        return em.createNamedQuery("ConsultationSlot.findCancelledSlots", ConsultationSlot.class)
                .getResultList();
    }

    @Override
    public boolean isSlotAvailable(Long slotId, EntityManager em) {
        Long count = em.createNamedQuery("ConsultationSlot.isAvailable", Long.class)
                .setParameter("slotId", slotId)
                .getSingleResult();
        return count > 0;
    }


    @Override
    public List<ConsultationSlot> findByRoom(Room room, EntityManager em) {
        return em.createNamedQuery("ConsultationSlot.findByRoom", ConsultationSlot.class)
                .setParameter("room", room)
                .getResultList();
    }

    @Override
    public List<ConsultationSlot> findByRoomAndDateRange(Long roomId, LocalDateTime startDate, LocalDateTime endDate, EntityManager em) {
        return em.createNamedQuery("ConsultationSlot.findByRoomAndDateRange", ConsultationSlot.class)
                .setParameter("roomId", roomId)
                .setParameter("startDate", startDate)
                .setParameter("endDate", endDate)
                .getResultList();
    }

    @Override
    public Long countOccupiedSlots(EntityManager em) {
        return em.createNamedQuery("ConsultationSlot.countOccupied", Long.class)
                .getSingleResult();
    }

    @Override
    public Optional<ConsultationSlot> findByIdWithConsultation(Long slotId, EntityManager em) {
        try {
            ConsultationSlot slot = em.createNamedQuery("ConsultationSlot.findByIdWithConsultation", ConsultationSlot.class)
                    .setParameter("slotId", slotId)
                    .getSingleResult();
            return Optional.of(slot);
        } catch (NoResultException e) {
            return Optional.empty();
        }
    }
}
