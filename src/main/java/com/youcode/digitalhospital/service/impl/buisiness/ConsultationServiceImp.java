package com.youcode.digitalhospital.service.impl.buisiness;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.*;
import com.youcode.digitalhospital.repository.interfaces.IConsultationRepository;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.function.Function;

public class ConsultationServiceImp implements IConsultationService {

    @Inject
    IPatientRepository patientRepo;
    @Inject
    IDoctorRepository doctorRepo;
    @Inject
    IConsultationRepository consultationRepo;

    @Override
    public Consultation bookConsultation(Long patientId, Long doctorId, LocalDate date, LocalDateTime startTime, LocalDateTime endTime, String reason) throws Exception {

        if (!isAvailableConsultation(doctorId, date, startTime, endTime)) {
            throw new IllegalArgumentException("Consultation is not available on these date or time");
        }

        EntityManager em = JPAConfig.getEntityManager();
        Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new Exception("Doctor not found"));
        Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient not found"));

        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation consultation = new Consultation();
            consultation.setDoctor(doctor);
            consultation.setPatient(patient);
            consultation.setConsultationDate(date);
            consultation.setStartTime(startTime);
            consultation.setEndTime(endTime);
            consultation.setReason(reason);
            consultation.setConsultationStatus(ConsultationStatus.RESERVED);

            consultationRepo.save(consultation, em);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new Exception(e);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Consultation> getPatientHistory(Long patientId) throws Exception {
        if (patientId == null) {
            throw new IllegalArgumentException("Patient id cannot be nulll");
        }
        EntityManager em = JPAConfig.getEntityManager();
        Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient not found"));

        try {
            return consultationRepo.findByPatient(patient, em);
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            em.close();
        }

    }

    @Override
    public Consultation modifyConsultation(Long consultationId, LocalDate date, LocalDateTime time, String reason) throws Exception {
        if(consultationId == null) {
            throw new IllegalArgumentException("Consultation id cannot be null");
        }

        if(date.isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("Consultation date cannot be on past");
        }

        EntityManager em = JPAConfig.getEntityManager();
        Consultation consultation = consultationRepo.findById(consultationId, em).orElseThrow(() -> new Exception("Consultation not found with this id"));

        if(!consultationRepo.isConsultationSlotOccupied(date, time, em)) {

        }
        try {

        } catch (Exception e) {

        }
        return null;
    }

    @Override
    public Consultation cancelConsultationByPatient(Long id, Long patientId) {
        return null;
    }

    @Override
    public Consultation validateConsultation(Long consultationId, Long patientId) {
        return null;
    }

    @Override
    public boolean isAvailableConsultation(Long doctorId, LocalDate consultationDate, LocalDateTime startTime, LocalDateTime endTime) {
        return false;
    }

    @Override
    public List<Consultation> getBookedConsultationOnDate(LocalDate date, Long doctorId) {
        return List.of();
    }

    @Override
    public List<Consultation> getDoctorPlaning(Long doctorId) {
        return List.of();
    }

    @Override
    public List<Consultation> getPlanningConsultations(Long doctorId) {
        return List.of();
    }

    @Override
    public Consultation refuseConsultation(Long consultationId, Long doctorId) {
        return null;
    }

    @Override
    public Consultation updateConsultationStatus(Long consultationId, ConsultationStatus status, Long doctorId) {
        return null;
    }

    @Override
    public String createCompteRendu(Long doctorId, Long patientId, Long consultationId) {
        return "";
    }

    @Override
    public List<Consultation> getConsultaionByDate(LocalDate date) {
        return List.of();
    }

    @Override
    public List<Consultation> getConsultationByStatus(ConsultationStatus status) {
        return List.of();
    }

    @Override
    public Consultation getConsultationByDateAndTime(LocalDate date, LocalDateTime time) {
        return null;
    }

    @Override
    public Long countAllConsultations() {
        return 0L;
    }
}
