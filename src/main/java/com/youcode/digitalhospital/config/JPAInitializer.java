package com.youcode.digitalhospital.config;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import jakarta.persistence.EntityManagerFactory;

@WebListener
public class JPAInitializer implements ServletContextListener {
    
    private static EntityManagerFactory entityManagerFactory;
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("============================================");
        System.out.println("Initializing JPA and creating database tables...");
        System.out.println("============================================");
        
        try {
            // This will trigger Hibernate to create the tables
            entityManagerFactory = JPAConfig.getEntityManagerFactory();
            
            System.out.println("============================================");
            System.out.println("JPA Initialized Successfully!");
            System.out.println("Tables have been created in the database.");
            System.out.println("============================================");
        } catch (Exception e) {
            System.err.println("============================================");
            System.err.println("ERROR: Failed to initialize JPA!");
            System.err.println("============================================");
            e.printStackTrace();
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
            System.out.println("EntityManagerFactory closed.");
        }
    }
    
    public static EntityManagerFactory getEntityManagerFactory() {
        return entityManagerFactory;
    }
}

