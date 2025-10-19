package com.youcode.digitalhospital.service.interfaces.entity;

import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.model.Doctor;

import java.util.List;
import java.util.Optional;

public interface IDoctorService {
    /**
     * Create a new doctor account
     * @param doctor
     * @return the created doctor
     */
    Doctor create(Doctor doctor);

    /**
     * Update the doctor info
     * @param doctor
     * @return updated doctor
     */
    Doctor update(Doctor doctor);

    /**
     * Delete a doctor with id
     * @param id
     */
    void delete(Long id);

    /**
     * Get a doctor by his id
     * @param id
     * @return founded doctor
     */
    Optional<Doctor> findById(Long id);

    /**
     * Get all doctors
     * @return list of doctors
     */
    List<Doctor> findAll();

    /**
     * Method to assign a room to a doctor
     */
    void assignRoomToDoctor(Long doctorId, Long roomId);

    /**
     * Get a doctor by its email
     * @param email
     * @return
     */
    Optional<Doctor> findByEmail(String email);

    /**
     * Get doctors worked on a department
     * @param dep
     * @return
     */
    List<Doctor> findByDepartment(Department dep);

    /**
     * Get doctor of a speciality
     * @param speciality
     * @return
     */
    List<Doctor> findBySpeciality(String speciality);
}
