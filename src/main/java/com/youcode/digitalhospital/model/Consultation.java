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

    @Column(name = "consultation_date", nullable = false)
    private LocalDate consultationDate;

    @Column(name = "start_time", nullable = false)
    private LocalDateTime startTime;

    @Column(name = "end_time", nullable = false)
    private LocalDateTime entTime;

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
}
