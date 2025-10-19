package com.youcode.digitalhospital.service.impl.entity;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.repository.imp.PatientRepositoryImp;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import com.youcode.digitalhospital.service.interfaces.entity.IPatientService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class PatientServiceImp implements IPatientService {

    @Inject
    private IPatientRepository patientRepository;


    @Override
    public Patient addNewPatient(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }

        // Check if email already exists
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Optional<Patient> existingPatient = patientRepository.findByEmail(patient.getEmail(), em);
            if (existingPatient.isPresent()) {
                throw new IllegalArgumentException("Patient with email " + patient.getEmail() + " already exists");
            }
        } finally {
            em.close();
        }

        // Set isDeleted to false by default
        patient.setIsDeleted(false);

        return patientRepository.save(patient, em);
    }

    @Override
    public Patient updatePatient(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }

        if (patient.getId() == null) {
            throw new IllegalArgumentException("Patient ID cannot be null for update");
        }

        EntityManager em = JPAConfig.getEntityManager();
        // Check if patient exists
        Optional<Patient> existingPatient = patientRepository.findById(patient.getId(), em);
        if (existingPatient.isEmpty()) {
            throw new IllegalArgumentException("Patient with ID " + patient.getId() + " not found");
        }

        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Patient updated = patientRepository.update(patient, em);
            tx.commit();
            return updated;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Patient patient) {
        if (patient == null) {
            throw new IllegalArgumentException("Patient cannot be null");
        }

        if (patient.getId() == null) {
            throw new IllegalArgumentException("Patient ID cannot be null for deletion");
        }
        EntityManager em = JPAConfig.getEntityManager();

        // Soft delete
        try {
            patient.softDelete();
            patientRepository.update(patient, em);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Patient> getPatientById(Long id) {
        if (id == null || id <= 0) {
            throw new IllegalArgumentException("Invalid patient ID");
        }
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return patientRepository.findById(id, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Patient> getAllPatients() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return patientRepository.findAll(em);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Patient> getPatientByEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return patientRepository.findByEmail(email, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Patient> getPatientsWithConsultations() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return patientRepository.findPatientsWithConsultations(em);
        } finally {
            em.close();
        }
    }

    @Override
    public Long countAllPatients() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return patientRepository.countAllPatients(em);
        } finally {
            em.close();
        }
    }

}
