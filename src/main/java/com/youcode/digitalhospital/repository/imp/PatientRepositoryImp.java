package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import jakarta.persistence.EntityManager;
import java.util.Optional;

public class PatientRepositoryImp extends GenericRepositoryImp<Patient> implements IPatientRepository {

    public PatientRepositoryImp(Class<Patient> entity) {
        super(entity);
    }

    @Override
    public Optional<Patient> findByEmail(String email) {
        try {
            EntityManager em = JPAConfig.getEntityManager();
            String jpql = "SELECT u FROM User u WHERE u.email = :email";
            Patient patient = em.createQuery(jpql, Patient.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(patient);
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}
