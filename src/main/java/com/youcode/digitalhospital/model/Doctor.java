package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.SQLDelete;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "doctors")
@SQLDelete(sql = "UPDATE users SET is_deleted = true, deleted_at = NOW() WHERE id = ?")
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Doctor extends User {
    @Column(name = "specialty", nullable = false, length = 150)
    private String speciality;

    @OneToMany(mappedBy = "doctor")
    private List<Consultation> consultationList = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "department_id")
    @Fetch(FetchMode.JOIN)
    private Department department;

    @OneToOne
    @JoinColumn(name = "room_id", referencedColumnName = "id")
    private Room room;
}
