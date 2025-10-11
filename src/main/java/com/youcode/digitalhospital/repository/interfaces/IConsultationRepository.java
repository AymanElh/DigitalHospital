package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationStatus;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.Patient;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

/**
 * Repository interface for Consultation entity
 * Handles consultation-specific data access operations
 */
public interface IConsultationRepository {

    /**
     * Find all consultations for a specific patient
     * @param patient Patient entity
     * @param em EntityManager
     * @return List of consultations for the patient
     */
    List<Consultation> findByPatient(Patient patient, EntityManager em);

    /**
     * Find all consultations for a specific doctor
     * @param doctor Doctor entity
     * @param em EntityManager
     * @return List of consultations for the doctor
     */
    List<Consultation> findByDoctor(Doctor doctor, EntityManager em);

    /**
     * Find consultations by doctor ID
     * @param doctorId Doctor ID
     * @param em EntityManager
     * @return List of consultations for the doctor
     */
    List<Consultation> findByDoctorId(Long doctorId, EntityManager em);

    /**
     * Find consultations by doctor and specific date
     * @param doctor Doctor entity
     * @param date Consultation date
     * @param em EntityManager
     * @return List of consultations for the doctor on that date
     */
    List<Consultation> findByDoctorAndDate(Doctor doctor, LocalDate date, EntityManager em);

    /**
     * Find consultations by status
     * @param status Consultation status
     * @param em EntityManager
     * @return List of consultations with the specified status
     */
    List<Consultation> findByStatus(ConsultationStatus status, EntityManager em);

    /**
     * Find consultations by date range
     * @param startDate Start date
     * @param endDate End date
     * @param em EntityManager
     * @return List of consultations within the date range
     */
    List<Consultation> findByDateRange(LocalDate startDate, LocalDate endDate, EntityManager em);

    /**
     * Find patient's consultation history (all past consultations)
     * @param patientId Patient ID
     * @param em EntityManager
     * @return List of past consultations ordered by date descending
     */
    List<Consultation> findPatientHistory(Long patientId, EntityManager em);

    /**
     * Find doctor's planning (upcoming consultations)
     * @param doctorId Doctor ID
     * @param em EntityManager
     * @return List of upcoming consultations ordered by date ascending
     */
    List<Consultation> findDoctorPlanning(Long doctorId, EntityManager em);

    /**
     * Find pending consultations (RESERVED status) for validation
     * @param doctorId Doctor ID
     * @param em EntityManager
     * @return List of reserved consultations awaiting validation
     */
    List<Consultation> findPendingConsultations(Long doctorId, EntityManager em);

    /**
     * Find consultations by date and time slot (to check conflicts)
     * @param date Consultation date
     * @param startTime Start time
     * @param endTime End time
     * @param em EntityManager
     * @return List of consultations in the specified time slot
     */
    List<Consultation> findByDateAndTimeSlot(LocalDate date, LocalDateTime startTime, LocalDateTime endTime, EntityManager em);

    /**
     * Count consultations by status (for admin statistics)
     * @param status Consultation status
     * @param em EntityManager
     * @return Count of consultations with the specified status
     */
    Long countByStatus(ConsultationStatus status, EntityManager em);

    /**
     * Count total consultations (for admin statistics)
     * @param em EntityManager
     * @return Total count of consultations
     */
    Long countAllConsultations(EntityManager em);

    /**
     * Find all consultations for a specific date (admin supervision)
     * @param date Consultation date
     * @param em EntityManager
     * @return List of consultations on that date
     */
    List<Consultation> findByDate(LocalDate date, EntityManager em);

    /**
     * Check if patient has existing consultation at specific time (avoid double booking)
     * @param patientId Patient ID
     * @param dateTime Consultation date and time
     * @param em EntityManager
     * @return True if patient has consultation at that time
     */
    boolean hasConsultationAtTime(Long patientId, LocalDateTime dateTime, EntityManager em);
}
