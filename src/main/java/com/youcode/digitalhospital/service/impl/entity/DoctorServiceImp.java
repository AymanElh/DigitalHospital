package com.youcode.digitalhospital.service.impl.entity;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;
import com.youcode.digitalhospital.model.RoleEnum;
import com.youcode.digitalhospital.model.Room;
import com.youcode.digitalhospital.repository.interfaces.IDepartmentRepository;
import com.youcode.digitalhospital.repository.interfaces.IDoctorRepository;
import com.youcode.digitalhospital.repository.interfaces.IRoomRepository;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class DoctorServiceImp implements IDoctorService {

    @Inject
    IDoctorRepository doctorRepository;
    @Inject
    IDepartmentRepository departmentRepository;
    @Inject
    IRoomRepository roomRepository;

    @Override
    public Doctor create(Doctor doctor) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Doctor doc = doctorRepository.findDoctorByEmail(doctor.getEmail(), em).orElse(null);
            if (doc != null) {
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
            System.out.println("Deleted doctor: " + doctor);

            if (doctorRepository.hasActiveConsultations(id, em)) {
                throw new IllegalStateException("Cannot delete doctor with active consultations");
            }

            doctor.softDelete();
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

    @Override
    public void assignRoomToDoctor(Long doctorId, Long roomId) {
        if(doctorId == null) {
            throw new IllegalArgumentException("Doctor id cannot be null");
        }

        if(roomId == null) {
            throw new IllegalArgumentException("Room id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();

            // Find the new room and doctor
            Room newRoom = roomRepository.findById(roomId, em)
                    .orElseThrow(() -> new IllegalArgumentException("Room not found"));
            Doctor doctor = doctorRepository.findById(doctorId, em)
                    .orElseThrow(() -> new IllegalArgumentException("Doctor not found"));

            // Check if the doctor already has a room assigned
            Room oldRoom = doctor.getRoom();

            if (oldRoom != null) {
                // If reassigning to the same room, do nothing
                if (oldRoom.getId().equals(roomId)) {
                    tx.commit();
                    return;
                }

                // Free the old room (make it available again)
                oldRoom.setAvailable(true);
                roomRepository.update(oldRoom, em);
            }

            // Assign the new room to the doctor
            doctor.setRoom(newRoom);
            newRoom.setAvailable(false);

            // Update both entities
            doctorRepository.update(doctor, em);
            roomRepository.update(newRoom, em);

            tx.commit();
        } catch (Exception e) {
            if (tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error while assigning the room to doctor: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }
}
