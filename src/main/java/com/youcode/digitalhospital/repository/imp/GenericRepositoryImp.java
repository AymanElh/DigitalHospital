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
        if(!(entity instanceof SoftDeletable)) {
            throw new UnsupportedOperationException("Entity " + entity.getClass().getSimpleName() + "doesn't support soft delete");
        }

        try {
            if(!em.contains(entity)) {
                entity = em.merge(entity);
            }

            ((SoftDeletable) entity).softDelete();
            em.merge(entity);
            em.flush();
        } catch (Exception e) {
            throw new RuntimeException("Error during soft delete: " + e.getMessage(), e);
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
