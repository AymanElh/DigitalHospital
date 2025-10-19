package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.repository.interfaces.IConsultationSlotRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.List;

@ApplicationScoped
public class ConsultationSlotRepoImp extends GenericRepositoryImp<ConsultationSlot> implements IConsultationSlotRepository {

    public ConsultationSlotRepoImp() {
        super(ConsultationSlot.class);
    }

    @Override
    public List<ConsultationSlot> getSlotsByDoctorAndDate(Doctor doctor, LocalDate date, EntityManager em) {
        String jpql = "SELECT s FROM ConsultationSlot s " +
                     "LEFT JOIN FETCH s.consultation c " +
                     "LEFT JOIN FETCH c.patient p " +
                     "WHERE s.doctor.id = :doctorId " +
                     "AND DATE(s.startTime) = :date " +
                     "ORDER BY s.startTime";

        return em.createQuery(jpql, ConsultationSlot.class)
                .setParameter("doctorId", doctor.getId())
                .setParameter("date", date)
                .getResultList();
    }
}
