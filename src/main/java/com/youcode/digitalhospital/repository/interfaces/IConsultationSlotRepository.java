package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.ConsultationSlot;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.repository.imp.GenericRepositoryImp;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.List;

public interface IConsultationSlotRepository extends IGenericRepository<ConsultationSlot> {
    List<ConsultationSlot> getSlotsByDoctorAndDate(Doctor doctor, LocalDate date, EntityManager em);
}
