package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.repository.interfaces.IDepartmentRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DepartmentRepositoryImp extends GenericRepositoryImp implements IDepartmentRepository {
    public DepartmentRepositoryImp() {
        super(Department.class);
    }

    @Override
    public List<Department> findByNameContaining(String namePattern, EntityManager em) {
        String jpql = "SELECT d FROM Department d WHERE d.name = :name";
        return em.createQuery(jpql, Department.class)
                .setParameter("name", namePattern)
                .getResultList();
    }

    @Override
    public List<Department> findDepartmentsWithDoctors(EntityManager em) {
        return List.of();
    }

    @Override
    public Optional<Department> findByName(String name, EntityManager em) {
        String jpql = "SELECT d FROM Department d WHERE d.name = :name";
        Department dep = em.createQuery(jpql, Department.class)
                .setParameter("name", name)
                .getSingleResult();
        return Optional.ofNullable(dep);
    }

    @Override
    public boolean existsByName(String name, EntityManager em) {
        return false;
    }

    @Override
    public Long countAllDepartments(EntityManager em) {
        return 0L;
    }

    @Override
    public Optional<Department> findByIdWithDoctors(Long departmentId, EntityManager em) {
        return Optional.empty();
    }

}
