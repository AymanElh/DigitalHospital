package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "consultation_slots")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class ConsultationSlot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "doctor_id", nullable = false)
    private Doctor doctor;

    @Column(name = "start_time", nullable = false)
    private LocalDateTime startTime;

    @Column(name = "end_time", nullable = false)
    private LocalDateTime endTime;

    @Column(name = "is_available", nullable = false)
    private Boolean isAvailable = true;

    @OneToOne(mappedBy = "consultationSlot")
    private Consultation consultation;

    @Column(name = "cancellation_reason")
    private String cancellationReason;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    public ConsultationSlot(Doctor doctor, LocalDateTime startTime, LocalDateTime endTime) {
        this.doctor = doctor;
        this.startTime = startTime;
        this.endTime = endTime;
    }

    @PrePersist
    public void onCreate() {
        this.createdAt = LocalDateTime.now();
    }

    public boolean isFree() {
        return isAvailable && consultation == null;
    }

    public void bookAConsultation(Consultation consultation) {
        if (!isFree()) {
            throw new IllegalArgumentException("Cannot book an available slot");
        }
        this.consultation = consultation;
    }

    public void block(String reason) {
        this.isAvailable = false;
        this.cancellationReason = reason;
        this.consultation = null;
    }

    public void unblock() {
        this.isAvailable = true;
        this.cancellationReason = null;
    }
}
