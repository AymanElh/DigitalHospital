package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public interface IDoctorRepository extends IGenericRepository<Doctor> {
    Optional<Doctor> findDoctorByEmail(String email, EntityManager em);
    List<Doctor> findByDepartment(Department department, EntityManager em);
    List<Doctor> findBySpeciality(String speciality, EntityManager em);

    boolean hasActiveConsultations(Long doctorId, EntityManager em);
}
