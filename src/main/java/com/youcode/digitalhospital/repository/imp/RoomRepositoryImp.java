package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.repository.interfaces.IRoomRepository;
import jakarta.persistence.EntityManager;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public class RoomRepositoryImp implements IRoomRepository {

    private static final String FIND_AVAILABLE_ROOMS_JPQL = "SELECT r FROM Room r WHERE r.isAvailable = true";
    private static final String FIND_BY_ROOM_NUMBER_JPQL = "SELECT r FROM Room r WHERE r.roomNumber = :roomNumber";
    private static final String COUNT_AVAILABLE_ROOMS_JPQL = "SELECT COUNT(r) FROM Room r WHERE r.isAvailable = true";

    @Override
    public List<Room> findAvailableRooms(EntityManager em) {
        return em.createQuery(FIND_AVAILABLE_ROOMS_JPQL, Room.class)
                .getResultList();
    }

    @Override
    public Optional<Room> findByRoomNumber(Long roomNumber, EntityManager em) {
        Room room =  em.createQuery(FIND_BY_ROOM_NUMBER_JPQL, Room.class)
                .setParameter("roomNumber", roomNumber)
                .getSingleResult();
        return Optional.ofNullable(room);
    }

    @Override
    public Long countAvailableRooms(EntityManager em) {
        return em.createQuery(COUNT_AVAILABLE_ROOMS_JPQL, Long.class)
                .getSingleResult();
    }

    @Override
    public Long countAllRooms(EntityManager em) {
        return 0L;
    }

    @Override
    public List<Room> findAvailableRoomsForTimeSlot(LocalDateTime startTime, LocalDateTime endTime, EntityManager em) {
        return List.of();
    }

    @Override
    public List<Room> findRoomsWithAvailableSlotsOnDate(LocalDateTime date, EntityManager em) {
        return List.of();
    }

    @Override
    public Optional<Room> findByIdWithSlots(Long roomId, EntityManager em) {
        return Optional.empty();
    }

    @Override
    public boolean isRoomAvailableAtTime(Long roomId, LocalDateTime startTime, LocalDateTime endTime, EntityManager em) {
        return false;
    }

    @Override
    public Optional<Room> findMostAvailableRoom(EntityManager em) {
        return Optional.empty();
    }
}

