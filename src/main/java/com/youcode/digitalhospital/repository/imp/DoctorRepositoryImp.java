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
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.email = :email";
            Doctor doctor = em.createQuery(jpql, Doctor.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return Optional.ofNullable(doctor);
        } catch (Exception e) {
            return Optional.empty();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findByDepartment(Department department) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.department.id = :depId";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("depId", department.getId())
                    .getResultList();
        } finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findBySpeciality(String speciality) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT d FROM Doctor d WHERE d.speciality = :speciality";
            return em.createQuery(jpql, Doctor.class)
                    .setParameter("speciality", speciality)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}
