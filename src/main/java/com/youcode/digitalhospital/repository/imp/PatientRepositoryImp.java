package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import jakarta.persistence.EntityManager;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public class PatientRepositoryImp extends GenericRepositoryImp<Patient> implements IPatientRepository {

    public PatientRepositoryImp() {
        super(Patient.class);
    }

    @Override
    public Optional<Patient> findByEmail(String email, EntityManager em) {
        String jpql = "SELECT p FROM Patient p WHERE p.email = :email";

        Patient patient =  em.createQuery(jpql, Patient.class)
                .setParameter("email", email)
                .getSingleResult();

        return Optional.ofNullable(patient);
    }

    @Override
    public List<Patient> findPatientsWithConsultations(EntityManager em) {
        String jpql = "SELECT DISTINCT p FROM Patient p LEFT JOIN FETCH p.consultations";
        return em.createQuery(jpql, Patient.class)
                .getResultList();
    }

    @Override
    public Long countAllPatients(EntityManager em) {
        return 0L;
    }

    @Override
    public List<Patient> findByWeightRange(Double minWeight, Double maxWeight, EntityManager em) {
        return List.of();
    }

    @Override
    public List<Patient> findByDateOfBirthBetween(LocalDate startDate, LocalDate endDate, EntityManager em) {
        return List.of();
    }
}
