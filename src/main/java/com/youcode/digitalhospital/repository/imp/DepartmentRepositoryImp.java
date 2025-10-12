package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.Department;
import com.youcode.digitalhospital.repository.interfaces.IDepartmentRepository;
import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public class DepartmentRepositoryImp extends GenericRepositoryImp<Department> implements IDepartmentRepository {
    public DepartmentRepositoryImp() {
        super(Department.class);
    }

    @Override
    public List<Department> findByNameContaining(String namePattern, EntityManager em) {
        String jpql = "SELECT d FROM Department d WHERE d.name LIKE :name";
        return em.createQuery(jpql, Department.class)
                .setParameter("name", "%" + namePattern + "%")
                .getResultList();
    }

    @Override
    public List<Department> findDepartmentsWithDoctors(EntityManager em) {
        String jpql = "SELECT DISTINCT d FROM Department d LEFT JOIN FETCH d.doctors";
        return em.createQuery(jpql, Department.class)
                .getResultList();
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
        String jpql = "SELECT COUNT(d) FROM Department d WHERE d.name = :name";
        Long count = em.createQuery(jpql, Long.class)
                .setParameter("name", name)
                .getSingleResult();
        return count > 0;
    }

    @Override
    public Long countAllDepartments(EntityManager em) {
        String jpql = "SELECT COUNT(d) FROM Department d";
        return em.createQuery(jpql, Long.class)
                .getSingleResult();
    }

    @Override
    public Optional<Department> findByIdWithDoctors(Long departmentId, EntityManager em) {
        try {
            String jpql = "SELECT d FROM Department d LEFT JOIN FETCH d.doctors WHERE d.id = :id";
            Department department = em.createQuery(jpql, Department.class)
                    .setParameter("id", departmentId)
                    .getSingleResult();
            return Optional.ofNullable(department);
        } catch (Exception e) {
            return Optional.empty();
        }
    }
}
