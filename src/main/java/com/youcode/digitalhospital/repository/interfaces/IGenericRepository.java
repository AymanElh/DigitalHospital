package com.youcode.digitalhospital.repository.interfaces;

import jakarta.persistence.EntityManager;

import java.util.List;
import java.util.Optional;

public interface IGenericRepository<T> {
    T save(T t, EntityManager em);
    T update(T t, EntityManager em);
    void delete(T t, EntityManager em);
    Optional<T> findById(Long id, EntityManager em);
    List<T> findAll(EntityManager em);
}
