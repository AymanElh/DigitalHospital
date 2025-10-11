package com.youcode.digitalhospital;

import com.youcode.digitalhospital.config.JPAConfig;
import com.youcode.digitalhospital.model.*;
import com.youcode.digitalhospital.repository.imp.*;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        System.out.println("==============================================");
        System.out.println("Starting Repository Tests");
        System.out.println("==============================================\n");

        EntityManager em = null;
        EntityTransaction transaction = null;

        try {
            // Initialize EntityManager
            em = Persistence.createEntityManagerFactory("DigitalHospitalPU").createEntityManager();
            System.out.println(em);
            transaction = em.getTransaction();
            transaction.begin();

            // Initialize repositories
            DepartmentRepositoryImp departmentRepo = new DepartmentRepositoryImp();
            DoctorRepositoryImp doctorRepo = new DoctorRepositoryImp();
            PatientRepositoryImp patientRepo = new PatientRepositoryImp();
            RoomRepositoryImp roomRepo = new RoomRepositoryImp();
            ConsultationSlotRepositoryImp slotRepo = new ConsultationSlotRepositoryImp();
            ConsultationRepositoryImp consultationRepo = new ConsultationRepositoryImp();

            // ==================== TEST 1: Department ==================== //
            System.out.println("TEST 1: Creating Department...");
            Department department = new Department();
            department.setName("Cardiology");
            department.setDescription("Heart and cardiovascular department");
            em.persist(department);
            em.flush();
            System.out.println("✓ Department created with ID: " + department.getId());
            System.out.println();

            // ==================== TEST 2: Doctor ==================== //
            System.out.println("TEST 2: Creating Doctor...");
            Doctor doctor = new Doctor();
            doctor.setFirstName("John");
            doctor.setLastName("Smith");
            doctor.setEmail("john.smith@hospital.com");
            doctor.setPassword("password123");
            doctor.setSpeciality("Cardiologist");
            doctor.setDepartment(department);
            doctor.setRole(RoleEnum.DOCTOR);
            System.out.println(doctor);
            em.persist(doctor);
            em.flush();
            System.out.println("✓ Doctor created with ID: " + doctor.getId());
            System.out.println("  Name: " + doctor.getUserName());
//            System.out.println("  Specialty: " + doctor.getSpeciality());
            System.out.println();

            // ==================== TEST 3: Patient ==================== //
            System.out.println("TEST 3: Creating Patient...");
            Patient patient = new Patient();
            patient.setFirstName("Jane");
            patient.setLastName("Doe");
            patient.setEmail("jane.doe@email.com");
            patient.setPassword("patient123");
            patient.setWeight(65.5);
            patient.setHeight(165.0);
            patient.setDateOfBirth(LocalDate.of(1990, 5, 15));
            patient.setPhoneNumber("0612345678");
            patient.setRole(RoleEnum.PATIENT);
            em.persist(patient);
            em.flush();
            System.out.println("✓ Patient created with ID: " + patient.getId());
            System.out.println("  Name: " + patient.getUserName());
            System.out.println("  Weight: " + patient.getWeight() + " kg");
            System.out.println("  Height: " + patient.getHeight() + " cm");
            System.out.println();

            // ==================== TEST 4: Room ==================== //
            System.out.println("TEST 4: Creating Room...");
            Room room = new Room();
            room.setRoomNumber(101L);
            room.setAvailable(true);
            em.persist(room);
            em.flush();
            System.out.println("✓ Room created with ID: " + room.getId());
            System.out.println("  Room Number: " + room.getRoomNumber());
            System.out.println("  Available: " + room.isAvailable());
            System.out.println();

            // ==================== TEST 5: Consultation Slot ==================== //
            System.out.println("TEST 5: Creating Consultation Slot...");
            ConsultationSlot slot = new ConsultationSlot();
            slot.setStartTime(LocalDateTime.now().plusDays(1).withHour(10).withMinute(0));
            slot.setEndTime(LocalDateTime.now().plusDays(1).withHour(10).withMinute(30));
            slot.setRoom(room);
            slot.setCancelled(false);
            em.persist(slot);
            em.flush();
            System.out.println("✓ Consultation Slot created with ID: " + slot.getId());
            System.out.println("  Start Time: " + slot.getStartTime());
            System.out.println("  End Time: " + slot.getEndTime());
            System.out.println();

            // ==================== TEST 6: Consultation ==================== //
            System.out.println("TEST 6: Creating Consultation...");
            Consultation consultation = new Consultation();
            consultation.setPatient(patient);
            consultation.setDoctor(doctor);
            consultation.setSlot(slot);
            consultation.setConsultationDate(LocalDate.now().plusDays(1));
            consultation.setConsultationTime(slot.getStartTime());
            consultation.setReason("Regular checkup");
            consultation.setConsultationStatus(ConsultationStatus.RESERVED);
            em.persist(consultation);
            em.flush();
            System.out.println("✓ Consultation created with ID: " + consultation.getId());
            System.out.println("  Patient: " + patient.getUserName());
            System.out.println("  Doctor: " + doctor.getUserName());
            System.out.println("  Status: " + consultation.getConsultationStatus());
            System.out.println();

            transaction.commit();
            System.out.println("✓ All entities persisted successfully!\n");

            // ==================== TEST 7: Repository Queries ==================== //
            System.out.println("==============================================");
            System.out.println("Testing Repository Query Methods");
            System.out.println("==============================================\n");

            // Test Department Repository
            System.out.println("TEST 7.1: Finding Department by Name...");
            Department foundDept = departmentRepo.findByName("Cardiology", em).orElse(null);
            if (foundDept != null) {
                System.out.println("✓ Found Department: " + foundDept.getName());
            }
            System.out.println();

            // Test Doctor Repository
            System.out.println("TEST 7.2: Finding Doctors by Specialty...");
            List<Doctor> cardiologists = doctorRepo.findBySpecialty("Cardiologist", em);
            System.out.println("✓ Found " + cardiologists.size() + " Cardiologist(s)");
            System.out.println();

            // Test Patient Repository
            System.out.println("TEST 7.3: Finding Patient by Email...");
            Patient foundPatient = patientRepo.findByEmail("jane.doe@email.com", em).orElse(null);
            if (foundPatient != null) {
                System.out.println("✓ Found Patient: " + foundPatient.getUserName());
            }
            System.out.println();

            // Test Room Repository
            System.out.println("TEST 7.4: Finding Available Rooms...");
            List<Room> availableRooms = roomRepo.findAvailableRooms(em);
            System.out.println("✓ Found " + availableRooms.size() + " available room(s)");
            System.out.println();

            // Test Slot Repository
            System.out.println("TEST 7.5: Finding Available Slots...");
            List<ConsultationSlot> availableSlots = slotRepo.findAvailableSlots(em);
            System.out.println("✓ Found " + availableSlots.size() + " available slot(s)");
            System.out.println();

            // Test Consultation Repository
            System.out.println("TEST 7.6: Finding Consultations by Patient...");
            List<Consultation> patientConsultations = consultationRepo.findByPatient(patient, em);
            System.out.println("✓ Found " + patientConsultations.size() + " consultation(s) for patient");
            System.out.println();

            System.out.println("TEST 7.7: Counting Consultations by Status...");
            Long reservedCount = consultationRepo.countByStatus(ConsultationStatus.RESERVED, em);
            System.out.println("✓ Total RESERVED consultations: " + reservedCount);
            System.out.println();

            // Test Slot Availability
            System.out.println("TEST 7.8: Checking Slot Availability...");
            boolean isAvailable = slotRepo.isSlotAvailable(slot.getId(), em);
            System.out.println("✓ Slot ID " + slot.getId() + " is available: " + !isAvailable + " (occupied by consultation)");
            System.out.println();

            System.out.println("==============================================");
            System.out.println("All Repository Tests Completed Successfully!");
            System.out.println("==============================================");

        } catch (Exception e) {
            System.err.println("\n❌ ERROR: " + e.getMessage());
            e.printStackTrace();
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
                System.out.println("Transaction rolled back.");
            }
        } finally {
//            if (em != null && em.isOpen()) {
//                em.close();
//            }
//            JPAConfig.closeEntityManager();
//            System.out.println("\nEntityManager closed.");
        }
    }


}
