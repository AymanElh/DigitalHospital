package com.youcode.digitalhospital.service.impl.buisiness;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.*;
import com.youcode.digitalhospital.repository.interfaces.IConsultationRepository;
import com.youcode.digitalhospital.repository.interfaces.IConsultationSlotRepository;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@ApplicationScoped
public class ConsultationServiceImp implements IConsultationService {

    @Inject
    IPatientRepository patientRepo;
    @Inject
    IDoctorRepository doctorRepo;
    @Inject
    IConsultationRepository consultationRepo;
    @Inject
    IConsultationSlotRepository consultationSlotRepository;

    @Override
    public List<Consultation> getPatientHistory(Long patientId) throws Exception {
        if(patientId == null) {
            throw new IllegalArgumentException("Patient id cannot be null");
        }
        EntityManager em = JPAConfig.getEntityManager();
        Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient not found"));

        try {
            return consultationRepo.findByPatient(patient, em);
        } catch (Exception e) {
            System.out.println("Error getting consultation by patient");
            throw e;
        }
    }

    @Override
    public Consultation bookConsultation(Long patientId, Long slotId, String reason) throws Exception {
        if(patientId == null) {
            throw new IllegalArgumentException("Patient id cannot be null");
        }
        if(slotId == null) {
            throw new IllegalArgumentException("Slot id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient not found"));
            ConsultationSlot slot = em.find(ConsultationSlot.class, slotId);
            if(slot == null) {
                throw new Exception("Slot not found with that id");
            }

            if(!slot.isFree()) {
                throw new Exception("This slot has already a consultation occupied");
            }

            if(slot.getStartTime().isBefore(LocalDateTime.now())) {
                throw new Exception("Time cannot be on past");
            }

            Consultation consultation = getConsultation(reason, slot, patient);

            consultationRepo.save(consultation, em);
            slot.setConsultation(consultation);
            em.merge(slot);
            em.getTransaction().commit();
            return consultation;
        } catch (IllegalArgumentException e) {
            if(em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        } catch (Exception e) {
            if(em.getTransaction().isActive()) em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    private static Consultation getConsultation(String reason, ConsultationSlot slot, Patient patient) throws Exception {
        Doctor doctor = slot.getDoctor();
        if(doctor == null) {
            throw new Exception("This slot has not doctor affected");
        }

        Consultation consultation = new Consultation();
        consultation.setDoctor(doctor);
        consultation.setPatient(patient);
        consultation.setConsultationDate(slot.getStartTime().toLocalDate());
        consultation.setConsultationStatus(ConsultationStatus.RESERVED);
        consultation.setReason(reason);
        return consultation;
    }

    @Override
    public Consultation modifyConsultation(Long consultationId, LocalDate date, LocalDateTime time, String reason) throws Exception {
        return null;
    }

    @Override
    public Consultation cancelConsultationByPatient(Long id, Long patientId, Long slotId) throws Exception {
        if(id == null) {
            throw new IllegalArgumentException("Consultation id cannot be null");
        }
        if(patientId == null) {
            throw new IllegalArgumentException("patient id cannot be null");
        }
        if(slotId == null) {
            throw new IllegalArgumentException("slot id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation consultation = consultationRepo.findById(id, em).orElseThrow(() -> new Exception("Consultation with id not found"));
            Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient not found with that id"));
            ConsultationSlot slot = em.find(ConsultationSlot.class, slotId);
            if(slot == null) {
                throw new Exception("Slot not found");
            }

            if(!consultation.getDoctor().getId().equals(slot.getDoctor().getId())) {
                throw new IllegalArgumentException("You are not authorized to refuse this consultation");
            }
            ConsultationStatus currentStatus = consultation.getConsultationStatus();
            if (currentStatus == ConsultationStatus.COMPLETED) {
                throw new IllegalArgumentException("Cannot refuse a completed consultation");
            }

            if (currentStatus == ConsultationStatus.CANCELED) {
                throw new IllegalArgumentException("This consultation is already cancelled");
            }

            if (currentStatus == ConsultationStatus.CANCELED) {
                throw new IllegalArgumentException("This consultation is already refused");
            }

            slot.setConsultation(null);
            consultation.setConsultationStatus(ConsultationStatus.CANCELED);
            em.merge(slot);
            consultationRepo.update(consultation, em);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }

    @Override
    public Consultation validateConsultation(Long consultationId, Long patientId) throws Exception {
        if(consultationId == null) {
            throw new IllegalArgumentException("Consultation id cannot be null");
        }
        if(patientId == null) {
            throw new IllegalArgumentException("Patient id cannot be null");
        }
        if(patientId == null) {
            throw new IllegalArgumentException("Patient id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation consultation = consultationRepo.findById(consultationId, em).orElseThrow(() -> new Exception("Consultation not found"));
            Patient patient = patientRepo.findById(patientId, em).orElseThrow(() -> new Exception("Patient no found"));
            consultation.confirm();
            consultationRepo.update(consultation, em);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            throw e;
        } finally {
            em.close();
        }
    }


    @Override
    public List<Consultation> getBookedConsultationOnDate(LocalDate date, Long doctorId) {
        return List.of();
    }

    @Override
    public List<ConsultationSlot> getDoctorPlaning(Long doctorId, LocalDate date) {
        if(doctorId == null) {
            throw new IllegalArgumentException("Doctor Id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new Exception("Doctor not found"));
            List<ConsultationSlot> slots = consultationSlotRepository.getSlotsByDoctorAndDate(doctor, date, em);
            tx.commit();
            return slots;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Consultation> getPlanningConsultations(Long doctorId) {
        if(doctorId == null) {
            throw new IllegalArgumentException("doctor id cannot be null");
        }
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new Exception("Doctor with this id not found")); // Entity not found exception
            List<Consultation> consultations = consultationRepo.findByDoctor(doctor, em);
            return consultations
                    .stream()
                    .filter(consultation -> consultation.getConsultationDate().isAfter(LocalDate.now()))
                    .collect(Collectors.toList());
        } catch (Exception e) {
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public Consultation refuseConsultation(Long consultationId, Long doctorId) {
        if(consultationId == null) {
            throw new IllegalArgumentException("Consultation id cannot be null");
        }
        if(doctorId == null) {
            throw new IllegalArgumentException("Doctor id cannot be nulll");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation consultation = consultationRepo.findById(consultationId, em).orElseThrow(() -> new Exception("Consultation not found"));
            Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new Exception("Doctor with that id not found"));

            if(!consultation.getDoctor().getId().equals(doctorId)) {
                throw new IllegalArgumentException("You are not authorize to do this action");
            }

            consultation.setConsultationStatus(ConsultationStatus.CANCELED);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
        } finally {
            em.close();
        }
        return null;
    }

    @Override
    public Consultation updateConsultationStatus(Long consultationId, ConsultationStatus status, Long doctorId) {
        if(consultationId == null) {
            throw new IllegalArgumentException("Consultation id cannot be null");
        }
        if(doctorId == null) {
            throw new IllegalArgumentException("Doctor id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Consultation consultation = consultationRepo.findById(consultationId, em).orElseThrow(() -> new Exception("Consultation not found"));
            Doctor doctor = doctorRepo.findById(doctorId, em).orElseThrow(() -> new Exception("Doctor not found"));

            consultation.setDoctor(doctor);
            consultation.setConsultationStatus(status);
            tx.commit();
            return consultation;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public ConsultationSlot getSlot(Long doctorId, LocalDate date, LocalDateTime startTime) {
        if(doctorId == null) {
            throw new IllegalArgumentException("Doctor id cannot be null");
        }

        if(date.isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("Invalid date");
        }
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
    public Consultation getConsultationByDateAndTime(LocalDate date, LocalDateTime time) {
        return null;
    }

    @Override
    public List<Consultation> getConsultationByStatus(ConsultationStatus status) {
        return List.of();
    }

    @Override
    public Long countAllConsultations() {
        return 0L;
    }
}
