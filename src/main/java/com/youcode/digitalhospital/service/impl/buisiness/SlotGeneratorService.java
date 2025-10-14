package com.youcode.digitalhospital.service.impl.buisiness;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

public class SlotGeneratorService {
    @Inject
    private IDoctorRepository doctorRepo;

    private static final LocalTime WORK_START = LocalTime.of(9, 0);
    private static final LocalTime WORK_END = LocalTime.of(17, 0);
    private static final LocalTime LUNCH_START = LocalTime.of(12, 0);
    private static final LocalTime LUNCH_END = LocalTime.of(13, 0);
    private static final int SLOT_DURATION = 30;    // 30 minutes

    public int generateSlotsForDoctor(Long doctorId, LocalDate startDate, LocalDate endDate) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new IllegalArgumentException("Doctor not found"));

            if(doctor.getRoom() == null) {
                throw new IllegalArgumentException("Doctor must have a room assigned before generating slots");
            }

            int slotGenerated = 0;

            LocalDate currentDate = startDate;
            while(!currentDate.isAfter(endDate)) {
                if(currentDate.getDayOfWeek() != DayOfWeek.SATURDAY && currentDate.getDayOfWeek() != DayOfWeek.SUNDAY) {
                    List<ConsultationSlot> daySlots = generateSlotsForDay(doctor, currentDate);

                    for(ConsultationSlot slot: daySlots) {
                        em.persist(slot);
                        slotGenerated++;
                    }
                }
                currentDate = currentDate.plusDays(1);
            }
            em.getTransaction().commit();
            return slotGenerated;
        } catch (Exception e) {
            if(em.getTransaction().isActive()) em.getTransaction().rollback();
            throw new IllegalArgumentException(e);
        } finally {
            em.close();
        }
    }

    private List<ConsultationSlot> generateSlotsForDay(Doctor doctor, LocalDate date) {
        List<ConsultationSlot> slots = new ArrayList<>();
        LocalTime currentTime = WORK_START;
        while(currentTime.isBefore(WORK_END)) {
            if(currentTime.isBefore(LUNCH_START) || !currentTime.isBefore(LUNCH_END)) {

                LocalDateTime startTime = LocalDateTime.of(date, currentTime);
                LocalDateTime endTime = startTime.plusMinutes(SLOT_DURATION);

                if (endTime.toLocalTime().isBefore(WORK_END) ||
                        endTime.toLocalTime().equals(WORK_END)) {

                    ConsultationSlot slot = new ConsultationSlot(doctor, startTime, endTime);
                    slots.add(slot);
                }
            }
            currentTime = currentTime.plusMinutes(SLOT_DURATION);
        }
        return slots;
    }
}
