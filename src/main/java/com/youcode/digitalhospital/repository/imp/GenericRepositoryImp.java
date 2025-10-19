package com.youcode.digitalhospital.repository.imp;

import com.youcode.digitalhospital.model.SoftDeletable;
import com.youcode.digitalhospital.repository.interfaces.IGenericRepository;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;

import java.util.List;
import java.util.Optional;

public abstract class GenericRepositoryImp<T> implements IGenericRepository<T> {
    private final Class<T> entity;

    public GenericRepositoryImp(Class<T> entity) {
        this.entity = entity;
    }

    public T save(T entity, EntityManager em) {
        em.persist(entity);
        return entity;
    }

    public T update(T entity, EntityManager em) {
        return em.merge(entity);
    }

    public void delete(T entity, EntityManager em) {
        try {
            // Get managed entity
            if (!em.contains(entity)) {
                entity = em.merge(entity);
            }

            // ✅ Check if entity supports soft delete
            if (entity instanceof SoftDeletable) {
                // SOFT DELETE: Set isDeleted = true
                ((SoftDeletable) entity).softDelete();
                em.merge(entity);
                em.flush();
            } else {
                // HARD DELETE: Remove from database
                em.remove(entity);
                em.flush();
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Error deleting " + this.entity.getSimpleName() +
                            ": " + e.getMessage(), e);
        }
    }

    public Optional<T> findById(Long id, EntityManager em) {
        return Optional.ofNullable(em.find(entity, id));
    }

    public List<T> findAll(EntityManager em) {
        String jpql = "SELECT e FROM " + this.entity.getSimpleName() + " e";
        TypedQuery<T> query = em.createQuery(jpql, this.entity);
        return query.getResultList();
    }
}
