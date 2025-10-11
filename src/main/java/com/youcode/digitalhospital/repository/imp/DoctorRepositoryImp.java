package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DoctorRepositoryImp extends GenericRepositoryImp<Doctor> implements IDoctorRepository {
    public DoctorRepositoryImp() {
        super(Doctor.class);
    }

    @Override
    public Optional<Doctor> findDoctorByEmail(String email) {
        EntityManager em = null;
        try {
            em = JPAConfig.getEntityManager();
            String jpql = "SELECT d FROM Doctor d WHERE d.email = :email";
            Doctor doctor = em.createQuery(jpql, Doctor.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(doctor);
        } catch (Exception e) {
            return Optional.empty();
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public List<Doctor> findByDepartment(Department department) {
        EntityManager em = null;
        try {
            em = JPAConfig.getEntityManager();
            String jpql = "SELECT d FROM Doctor d WHERE d.department.id = :depId";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("depId", department.getId())
                    .getResultList();
        } finally {
            if (em != null) em.close();
        }
    }

    @Override
    public List<Doctor> findBySpeciality(String speciality) {
        EntityManager em = null;
        try {
            em = JPAConfig.getEntityManager();
            String jpql = "SELECT d FROM Doctor d WHERE d.specialty = :specialty";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("specialty", speciality)
                    .getResultList();
        } finally {
            if (em != null) em.close();
        }
    }

    // Add method to match Main class call
    public List<Doctor> findBySpecialty(String specialty, EntityManager em) {
        String jpql = "SELECT d FROM Doctor d WHERE d.speciality = :specialty";
        return em.createQuery(jpql, Doctor.class)
                .setParameter("specialty", specialty)
                .getResultList();
    }
}
