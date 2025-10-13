package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "consultations")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@NamedQuery(
        name = "Consultation.hasActiveConsultation",
        query = "SELECT COUNT(c) FROM Consultation c WHERE c.doctor.id = :id AND c.consultationStatus IN (:status)"
)
public class Consultation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "patient_id", nullable = false)
    private Patient patient;

    @ManyToOne
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;

    @Column(name = "date", nullable = false)
    private LocalDate consultationDate;

    @OneToOne
    @JoinColumn(name = "consultation_slot_id", nullable = false, unique = true)
    private ConsultationSlot consultationSlot;

    @Column(nullable = false, columnDefinition = "TEXT")
    private String reason;

    @Column(name = "medical_report", columnDefinition = "TEXT")
    private String medicalReport;

    @Column(name = "status", nullable = false, length = 20)
    @Enumerated(EnumType.STRING)
    private ConsultationStatus consultationStatus;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;

    @Column(name = "validated_at")
    private LocalDateTime validatedAt;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;

    public Consultation(Patient patient, Doctor doctor, String reason) {
        this.patient = patient;
        this.doctor = doctor;
        this.reason = reason;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public LocalDateTime getStartTime() {
        return consultationSlot != null ? this.consultationSlot.getStartTime() : null;
    }

    public LocalDateTime getEndTime() {
        return consultationSlot != null ? this.consultationSlot.getEndTime() : null;
    }

    public void completeConsultation(String report) {
        this.medicalReport = report;
        this.consultationStatus = ConsultationStatus.COMPLETED;
        this.completedAt = LocalDateTime.now();
    }

    public void confirm() {
        this.consultationStatus = ConsultationStatus.VALIDATED;
        this.validatedAt = LocalDateTime.now();
    }

}
