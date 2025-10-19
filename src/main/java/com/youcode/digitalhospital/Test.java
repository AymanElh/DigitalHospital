package com.youcode.digitalhospital;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.repository.imp.RoomRepositoryImp;
import com.youcode.digitalhospital.repository.interfaces.IRoomRepository;
import com.youcode.digitalhospital.service.impl.entity.RoomServiceImp;
import com.youcode.digitalhospital.service.interfaces.entity.IRoomService;
import jakarta.persistence.EntityManager;
import jakarta.persistence.Persistence;

public class Test {
    public static void main(String[] args) {
        EntityManager em = Persistence.createEntityManagerFactory("DigitalHospitalPU").createEntityManager();
        IRoomRepository roomRepository = new RoomRepositoryImp();
        IRoomService roomService = new RoomServiceImp();

        System.out.println("Getting room by number: " + roomRepository.findByRoomNumber(10L, em).get());
    }
}
