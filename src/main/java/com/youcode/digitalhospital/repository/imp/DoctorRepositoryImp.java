package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.ConsultationStatus;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class DoctorRepositoryImp extends GenericRepositoryImp<Doctor> implements IDoctorRepository {
    public DoctorRepositoryImp() {
        super(Doctor.class);
    }

    @Override
    public Optional<Doctor> findDoctorByEmail(String email, EntityManager em) {
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.email = :email";
            Doctor doctor = em.createQuery(jpql, Doctor.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(doctor);
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    @Override
    public List<Doctor> findByDepartment(Department department, EntityManager em) {
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.department.id = :depId";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("depId", department.getId())
                    .getResultList();
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public List<Doctor> findBySpeciality(String speciality, EntityManager em) {
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.speciality = :specialty";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("specialty", speciality)
                    .getResultList();
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public boolean hasActiveConsultations(Long doctorId, EntityManager em) {
        List<ConsultationStatus> activeStatues = List.of(
                ConsultationStatus.RESERVED,
                ConsultationStatus.VALIDATED
        );

        return em.createNamedQuery("Consultation.hasActiveConsultation", Long.class)
                .setParameter("id", doctorId)
                .setParameter("status", activeStatues)
                .getSingleResult() > 0;
    }
}
