package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;

import java.util.List;
import java.util.Optional;

public interface IDoctorRepository {
    Optional<Doctor> findDoctorByEmail(String email);
    List<Doctor> findByDepartment(Department department);
    List<Doctor> findBySpeciality(String speciality);
}
