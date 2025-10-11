package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Patient;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Patient entity
 * Handles patient-specific data access operations
 */
public interface IPatientRepository extends IGenericRepository<Patient> {

    /**
     * Find a patient by email address
     * @param email Patient's email
     * @param em EntityManager
     * @return Optional containing the patient if found
     */
    Optional<Patient> findByEmail(String email, EntityManager em);

    /**
     * Find patients by weight range (for medical statistics)
     * @param minWeight Minimum weight
     * @param maxWeight Maximum weight
     * @param em EntityManager
     * @return List of patients within the weight range
     */
    List<Patient> findByWeightRange(Double minWeight, Double maxWeight, EntityManager em);

    /**
     * Find patients by date of birth range
     * @param startDate Start date
     * @param endDate End date
     * @param em EntityManager
     * @return List of patients born within the date range
     */
    List<Patient> findByDateOfBirthBetween(LocalDate startDate, LocalDate endDate, EntityManager em);

    /**
     * Count total number of patients (for admin statistics)
     * @param em EntityManager
     * @return Total count of patients
     */
    Long countAllPatients(EntityManager em);

    /**
     * Find patients with consultations (for reports)
     * @param em EntityManager
     * @return List of patients who have at least one consultation
     */
    List<Patient> findPatientsWithConsultations(EntityManager em);
}