package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationStatus;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.repository.interfaces.IConsultationRepository;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class ConsultationRepositoryImp extends GenericRepositoryImp<Consultation> implements IConsultationRepository {

    public ConsultationRepositoryImp() {
        super(Consultation.class);
    }

    @Override
    public Long countAllConsultations(EntityManager em) {
        String jpql = "SELECT COUNT(c) FROM Consultation c";
        return em.createQuery(jpql, Long.class)
                .getSingleResult();
    }

    @Override
    public List<Consultation> findByPatient(Patient patient, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.patient = :patient";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("patient", patient)
                .getResultList();
    }


    @Override
    public List<Consultation> findByDoctor(Doctor doctor, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.doctor = :doctor";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("doctor", doctor)
                .getResultList();
    }

    @Override
    public List<Consultation> findByDoctorId(Long doctorId, EntityManager em) {
        return List.of();
    }

    @Override
    public List<Consultation> findByDoctorAndDate(Doctor doctor, LocalDate date, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.doctor = :doctor AND c.consultationDate = :date";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("doctor", doctor)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public List<Consultation> findByStatus(ConsultationStatus status, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.consultationStatus = :status";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("status", status)
                .getResultList();
    }

    @Override
    public List<Consultation> findByDateRange(LocalDate startDate, LocalDate endDate, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.consultationDate BETWEEN :startDate AND :endDate ORDER BY c.consultationDate DESC";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("startDate",startDate)
                .setParameter("endDate", endDate)
                .getResultList();
    }

    @Override
    public List<Consultation> findPatientHistory(Long patientId, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c JOIN c.doctor d JOIN c.patient p WHERE c.patient.id = :patientId ORDER BY c.consultationDate DESC";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("patientId", patientId)
                .getResultList();
    }

    @Override
    public List<Consultation> findDoctorPlanning(Long doctorId, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c JOIN c.doctor d WHERE d.id = :doctorId AND c.consultationStatus = :status ORDER BY c.consultationDate ASC, c.slot.startTime ASC";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("doctorId", doctorId)
                .setParameter("status", ConsultationStatus.RESERVED)
                .getResultList();
    }

    @Override
    public List<Consultation> findPendingConsultations(Long doctorId, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c JOIN c.doctor d WHERE d.id = :doctorId AND c.consultationStatus = :status ORDER BY c.consultationDate ASC, c.slot.startTime ASC";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("doctorId", doctorId)
                .setParameter("status", ConsultationStatus.RESERVED)
                .getResultList();
    }

    @Override
    public List<Consultation> findByDateAndTimeSlot(LocalDate date, LocalDateTime startTime, LocalDateTime endTime, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.consultationDate = :date AND c.slot.startTime < :endTime AND c.slot.endTime > :startTime";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("date", date)
                .setParameter("startTime", startTime)
                .setParameter("endTime", endTime)
                .getResultList();
    }

    @Override
    public Long countByStatus(ConsultationStatus status, EntityManager em) {
        String jpql = "SELECT COUNT(c) FROM Consultation c WHERE c.consultationStatus = :status";
        return em.createQuery(jpql, Long.class)
                .setParameter("status", status)
                .getSingleResult();
    }

    @Override
    public List<Consultation> findByDate(LocalDate date, EntityManager em) {
        String jpql = "SELECT c FROM Consultation c WHERE c.consultationDate = :date ORDER BY c.slot.startTime ASC";
        return em.createQuery(jpql, Consultation.class)
                .setParameter("date", date)
                .getResultList();
    }

    @Override
    public boolean hasConsultationAtTime(Long patientId, LocalDate date, LocalDateTime dateTime, EntityManager em) {
        String jpql = "SELECT COUNT(c) FROM Consultation c JOIN c.patient p WHERE p.id = :patientId AND c.consultationDate = :date AND c.startTime <= :dateTime AND c.endTime > :dateTime";
        Long count = em.createQuery(jpql, Long.class)
                .setParameter("patientId", patientId)
                .setParameter("date", date)
                .setParameter("dateTime", dateTime)
                .getSingleResult();
        return count > 0;
    }

    @Override
    public boolean isConsultationSlotOccupied(LocalDate date, LocalDateTime time, EntityManager em) {
        String jpql = "SELECT COUNT(c) FROM Consultation c WHERE c.consultationDate = :date AND c.startTime = :startTime AND c.endTime = :endTime";
        Long count = em.createQuery(jpql, Long.class)
                .setParameter("date", date)
                .setParameter("startTime", time)
                .getSingleResult();
        return count > 0;
    }
}
