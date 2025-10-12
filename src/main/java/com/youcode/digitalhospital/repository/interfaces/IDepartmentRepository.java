package com.youcode.digitalhospital.repository.interfaces;

import com.youcode.digitalhospital.model.Department;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Department entity
 * Handles department-specific data access operations
 */
public interface IDepartmentRepository extends IGenericRepository<Department> {

    /**
     * Find a department by name
     * @param name Department name
     * @param em EntityManager
     * @return Optional containing the department if found
     */
    Optional<Department> findByName(String name, EntityManager em);

    /**
     * Find departments with doctors
     * @param em EntityManager
     * @return List of departments that have at least one doctor
     */
    List<Department> findDepartmentsWithDoctors(EntityManager em);

    /**
     * Find departments by name pattern (search functionality)
     * @param namePattern Name pattern to search
     * @param em EntityManager
     * @return List of departments matching the pattern
     */
    List<Department> findByNameContaining(String namePattern, EntityManager em);

    /**
     * Count all departments (for admin statistics)
     * @param em EntityManager
     * @return Total count of departments
     */
    Long countAllDepartments(EntityManager em);

    /**
     * Find department with its doctors (eager fetch)
     * @param departmentId Department ID
     * @param em EntityManager
     * @return Optional containing the department with doctors
     */
    Optional<Department> findByIdWithDoctors(Long departmentId, EntityManager em);

    /**
     * Check if department name already exists (for validation)
     * @param name Department name
     * @param em EntityManager
     * @return True if department name exists
     */
    boolean existsByName(String name, EntityManager em);
}
