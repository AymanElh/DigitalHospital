package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "slots")
@NamedQueries({
        @NamedQuery(
                name = "ConsultationSlot.findAvailableByRoomAndDate",
                query = "SELECT cs FROM ConsultationSlot cs WHERE cs.room.id = :roomId AND FUNCTION('DATE', cs.startTime) = FUNCTION('DATE', :date) AND cs.isCancelled = false AND cs.consultation IS NULL"
        ),
        @NamedQuery(
                name = "ConsultationSlot.findCancelledSlots",
                query = "SELECT cs FROM ConsultationSlot cs WHERE cs.isCancelled = true"
        ),
        @NamedQuery(
                name = "ConsultationSlot.isAvailable",
                query = "SELECT COUNT(cs) FROM ConsultationSlot cs WHERE cs.id = :slotId AND cs.isCancelled = false AND cs.consultation IS NULL"
        ),
        @NamedQuery(
                name = "ConsultationSlot.findByRoom",
                query = "SELECT cs FROM ConsultationSlot cs WHERE cs.room = :room"
        ),
        @NamedQuery(
                name = "ConsultationSlot.findByRoomAndDateRange",
                query = "SELECT cs FROM ConsultationSlot cs WHERE cs.room.id = :roomId AND cs.startTime >= :startDate AND cs.endTime <= :endDate"
        ),
        @NamedQuery(
                name = "ConsultationSlot.countOccupied",
                query = "SELECT COUNT(cs) FROM ConsultationSlot cs WHERE cs.consultation IS NOT NULL AND cs.isCancelled = false"
        ),
        @NamedQuery(
                name = "ConsultationSlot.findByIdWithConsultation",
                query = "SELECT cs FROM ConsultationSlot cs LEFT JOIN FETCH cs.consultation WHERE cs.id = :slotId"
        )
})
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ConsultationSlot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne(mappedBy = "slot")
    private Consultation consultation;

    @Column(name = "start_time", nullable = false)
    private LocalDateTime startTime;

    @Column(name = "end_time", nullable = false)
    private LocalDateTime endTime;

    @ManyToOne
    @JoinColumn(name = "room_id", nullable = false)
    private Room room;

    @Column(name = "is_cancelled", nullable = false)
    private boolean isCancelled = false;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }
}

