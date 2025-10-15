package com.youcode.digitalhospital.service.impl.entity;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.repository.interfaces.IDepartmentRepository;
import com.youcode.digitalhospital.service.interfaces.entity.IDepartmentService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

import java.util.List;
import java.util.Optional;

@ApplicationScoped
public class DepartmentServiceImp implements IDepartmentService {

    @Inject
    private IDepartmentRepository departmentRepository;

    @Override
    public Department create(Department department) {
        // validation
        // ...

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            if (departmentRepository.existsByName(department.getName(), em)) {
                throw new Exception("Department with this name " + department.getName() + " is already exists");
            }

            departmentRepository.save(department, em);
            tx.commit();
            return department;
        } catch (Exception e) {
            if(tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Error creating department: " + e.getMessage());
        } finally {
            em.close();
        }
    }

    @Override
    public Department update(Department department) {
        if(department.getId() == null) {
            throw new IllegalArgumentException("Department id cannot be null on update");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Department existing = departmentRepository.findById(department.getId(), em).orElse(null);
            if(existing == null) {
                throw new IllegalArgumentException("Department not found with id: " + department.getId());
            }

            if(!existing.getName().equals(department.getName())) {
                if(departmentRepository.existsByName(department.getName(), em)) {
                    throw new IllegalArgumentException("Department with name " + department.getName() + " is already exist");
                }
            }

            Department updatedDep = departmentRepository.update(department, em);
            tx.commit();
            return updatedDep;
        } catch (Exception e) {
            if(tx.isActive()) {
                tx.rollback();
            }
            throw new RuntimeException("Cannot update the department");
        } finally {
            em.close();
        }
    }

    @Override
    public void delete(Long id) {
        if(id == null) {
            throw new IllegalArgumentException("Id cannot be null");
        }

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Department department = departmentRepository.findById(id, em).orElse(null);
            if(department == null) {
                throw new IllegalArgumentException("Department not found with id: " + id);
            }

            if(department.getDoctors() != null && !department.getDoctors().isEmpty()) {
                throw new IllegalArgumentException("You cannot delete department that has doctors, change the doctor first");
            }
            departmentRepository.delete(department, em);
            tx.commit();
        } catch (Exception e) {
            if(tx.isActive()) {
                tx.rollback();
            }
        } finally {
            em.close();
        }
    }

    @Override
    public Optional<Department> findById(Long id) {
        if(id == null) {
            throw new IllegalArgumentException("Department id cannot be null" );
        }
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return departmentRepository.findById(id, em);
        } finally {
            em.close();
        }
    }

    @Override
    public List<Department> findAll() {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return departmentRepository.findAll(em);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean existsByName(String name) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            return departmentRepository.existsByName(name, em);
        } finally {
            em.close();
        }
    }
}
