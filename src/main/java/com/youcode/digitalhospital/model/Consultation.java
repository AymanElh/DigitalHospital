package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Type;
import org.hibernate.dialect.type.PostgreSQLEnumJdbcType;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name = "consultations")
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

    @OneToOne
    @JoinColumn(name = "slot_id", nullable = false, unique = true)
    private ConsultationSlot slot;

    @Column(name = "consultation_date", nullable = false)
    private LocalDate consultationDate;

    @Column(name = "consultation_time", nullable = false)
    private LocalDateTime consultationTime;

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

    public Consultation(Patient patient, Doctor doctor, ConsultationSlot slot, String reason) {
        this.patient = patient;
        this.doctor = doctor;
        this.slot = slot;
        this.reason = reason;
    }

    public Consultation() {}

    public LocalDate getConsultationDate() {
        return consultationDate;
    }

    public void setConsultationDate(LocalDate consultationDate) {
        this.consultationDate = consultationDate;
    }

    public LocalDateTime getConsultationTime() {
        return consultationTime;
    }

    public void setConsultationTime(LocalDateTime consultationTime) {
        this.consultationTime = consultationTime;
    }

    public ConsultationStatus getConsultationStatus() {
        return consultationStatus;
    }

    public void setConsultationStatus(ConsultationStatus consultationStatus) {
        this.consultationStatus = consultationStatus;
    }

    public Doctor getDoctor() {
        return doctor;
    }

    public void setDoctor(Doctor doctor) {
        this.doctor = doctor;
    }

    public String getMedicalReport() {
        return medicalReport;
    }

    public void setMedicalReport(String medicalReport) {
        this.medicalReport = medicalReport;
    }

    public Patient getPatient() {
        return patient;
    }

    public void setPatient(Patient patient) {
        this.patient = patient;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public ConsultationSlot getSlot() {
        return slot;
    }

    public void setSlot(ConsultationSlot slot) {
        this.slot = slot;
    }

    public LocalDateTime getCreatedAt() {return createdAt;}

    public LocalDateTime getUpdatedAt() {return updatedAt;}
}

