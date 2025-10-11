package com.youcode.digitalhospital.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JPAConfig {
    private static EntityManagerFactory emf;

    public static EntityManagerFactory getEntityManagerFactory() {
        if(emf == null || !emf.isOpen()) {
            try {
                emf = Persistence.createEntityManagerFactory("DigitalHospitalPU");
                System.out.println("Entity manager created successfylly");
            } catch (Exception e) {
                System.err.println("Error creating entity manager factory: " + e.getMessage());
                e.printStackTrace();
                throw new RuntimeException(e);
            }
        }
        return emf;
    }

    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public static void closeEntityManager() {
        if(emf != null && emf.isOpen()) {
            emf.close();
            System.out.println("Entity manager closed");
        }
    }
}
