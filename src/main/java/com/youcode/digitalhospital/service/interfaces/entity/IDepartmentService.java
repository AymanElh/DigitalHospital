package com.youcode.digitalhospital.service.interfaces.entity;

import com.youcode.digitalhospital.model.Department;

import java.util.List;
import java.util.Optional;

public interface IDepartmentService {
    /**
     * create a department
     * @param department
     * @return created department
     */
    Department create(Department department);

    /**
     * Update a department
     * @param department
     * @return updated department
     */
    Department update(Department department);

    /**
     * Delete a department by id
     * @param id
     */
    void delete(Long id);

    /**
     * Find department by id
     * @param id
     * @return optional containing department or empty
     */
    Optional<Department> findById(Long id);

    /**
     * Get all departments
     * @return list of departments
     */
    List<Department> findAll();

    /**
     * Check if the department name exists
     * @param name
     * @return true if exists, false otherwise
     */
    boolean existsByName(String name);
}
