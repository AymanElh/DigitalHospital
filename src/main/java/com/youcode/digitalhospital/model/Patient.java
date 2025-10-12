package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
@SQLDelete(sql = "UPDATE users SET is_deleted = true, deleted_at = NOW() WHERE id = ?")
@SQLRestriction("is_deleted = false")
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Patient extends User {
    @Column
    private double weight;

    @Column
    private double height;

    @Column(name = "date_of_birth")
    private LocalDate dateOfBirth;

    @Column(name = "phone_number")
    private String phoneNumber;

    @OneToMany(mappedBy = "patient")
    private List<Consultation> consultations = new ArrayList<>();

    public Patient(Long id, String firstName, String lastName, String email, String password, double height, double weight) {
        super(firstName, lastName, email, password, null, RoleEnum.PATIENT);
        this.height = height;
        this.weight = weight;
    }

    public void addConsultation(Consultation consultation) {
        consultations.add(consultation);
    }
}
