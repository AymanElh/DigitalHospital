package com.youcode.digitalhospital.service.impl.entity;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.RoleEnum;
import com.youcode.digitalhospital.repository.interfaces.IDepartmentRepository;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

public class DoctorServiceImp implements IDoctorService {

    @Inject
    IDoctorRepository doctorRepository;
    @Inject
    IDepartmentRepository departmentRepository;

    @Override
    public Doctor create(Doctor doctor) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Doctor doc = doctorRepository.findDoctorByEmail(doctor.getEmail(), em).orElse(null);
            if (doc == null) {
                throw new IllegalArgumentException("Email is already exists");
            }

            departmentRepository.findById(doctor.getDepartment().getId(), em)
                    .orElseThrow(() -> new IllegalArgumentException("Department not found"));

            doctor.setRole(RoleEnum.DOCTOR);

            doctorRepository.save(doctor, em);
            tx.commit();
            return doctor;
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Error creating doctor: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public Doctor update(Doctor doctor) {
        if (doctor.getId() == null) {
            throw new IllegalArgumentException("Doctor ID cannot be null for update");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            // Check if exists
            Doctor existing = doctorRepository.findById(doctor.getId(), em)
                    .orElseThrow(() -> new IllegalArgumentException("Doctor not found"));


            // Check email change
            if (!existing.getEmail().equals(doctor.getEmail())) {
                doctorRepository.findDoctorByEmail(doctor.getEmail(), em)
                        .orElseThrow(() -> new IllegalArgumentException("Doctor with this email is already exist"));
            }


            Doctor updated = doctorRepository.update(doctor, em);

            tx.commit();
            return updated;

        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error updating doctor: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("Doctor ID cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();

        try {
            tx.begin();

            Doctor doctor = doctorRepository.findById(id, em)
                    .orElseThrow(() -> new IllegalArgumentException("Doctor not found"));

             if (doctorRepository.hasActiveConsultations(id, em)) {
                 throw new IllegalStateException("Cannot delete doctor with active consultations");
             }

            doctorRepository.delete(doctor, em);

            tx.commit();

        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error deleting doctor: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Doctor> findById(Long id) {
        if (id == null) {
            throw new IllegalArgumentException("Doctor ID cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return doctorRepository.findById(id, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findAll() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return doctorRepository.findAll(em);
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Doctor> findByEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email cannot be null or empty");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return doctorRepository.findDoctorByEmail(email, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findByDepartment(Department dep) {
        if (dep == null) {
            throw new IllegalArgumentException("Department cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return doctorRepository.findByDepartment(dep, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Doctor> findBySpeciality(String speciality) {
        if (speciality == null || speciality.trim().isEmpty()) {
            throw new IllegalArgumentException("Specialty cannot be null or empty");
        }

        EntityManager em = JPAConfig.getEntityManager();
        try {
            return doctorRepository.findBySpeciality(speciality, em);
        } finally {
            em.close();
        }
    }
}
