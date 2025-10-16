package com.youcode.digitalhospital.service.impl.buisiness;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.dto.auth.LoginDTO;
import com.youcode.digitalhospital.dto.auth.RegisterPatientDTO;
import com.youcode.digitalhospital.model.Patient;
import com.youcode.digitalhospital.model.RoleEnum;
import com.youcode.digitalhospital.model.User;
import com.youcode.digitalhospital.repository.interfaces.IPatientRepository;
import com.youcode.digitalhospital.service.interfaces.business.IAuthenticationService;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

@ApplicationScoped
public class AuthenticationServiceImp implements IAuthenticationService {

    @Inject
    IPatientRepository patientRepo;

    @Override
    public User login(LoginDTO dto) {
        String email = dto.getEmail();
        String password = dto.getPassword();
        if(email == null || email.trim().isEmpty()) {
            throw new IllegalArgumentException("Email is required");
        }
        if(password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password is required");
        }

        EntityManager em = JPAConfig.getEntityManager();
        User user = patientRepo.findByEmail(email, em).orElseThrow(() -> new IllegalArgumentException("Invalid email or password"));

        if(!verifyPassword(password, user.getPassword())) {
            throw new IllegalArgumentException("Invalid email or password");
        }

        return user;
    }

    private boolean verifyPassword(String plainPassword, String hashedPassword) {
        // Make the logic of the hashing password
        return plainPassword.equals(hashedPassword);
    }

    @Override
    public User registerPatient(RegisterPatientDTO dto) {
        if (isEmailRegistred(dto.getEmail())) {
            System.out.println("Checking if the email is already exist");
            throw new IllegalArgumentException("Email is already registered");
        }

        System.out.println("Dto: " + dto);

        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        System.out.println("Enttity manager  " + em);
        try {
            tx.begin();
            Patient patient = new Patient();
            patient.setFirstName(dto.getFirstName());
            patient.setLastName(dto.getLastName());
            patient.setEmail(dto.getEmail());
            patient.setPassword(dto.getPassword()); // Hash password!
            patient.setPhoneNumber(dto.getPhone());
            patient.setDateOfBirth(dto.getDateOfBirth());
            patient.setWeight(dto.getWeight());
            patient.setHeight(dto.getHeight());
            patient.setRole(RoleEnum.PATIENT);
            Patient p = patientRepo.save(patient, em);
            System.out.println("Debug 4 get saved patient: " + p);
            tx.commit();
            return patient;
        } catch (Exception e) {
            if(tx.isActive()) tx.rollback();
            System.out.println("Exception on service: " + e.getMessage());
            throw new RuntimeException(e);
        } finally {
            em.close();
        }
    }

    @Override
    public boolean isEmailRegistred(String email) {
        return findUserByEmail(email) != null;
    }

    private User findUserByEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            Patient p = patientRepo.findByEmail(email, em).orElse(null);
            System.out.println("Getting patient by email: " + p);
            return p;
        } catch (Exception e) {
            throw e;
        } finally {
            em.close();
        }
    }
}
