package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "doctors")
@Getter
@Setter
@NoArgsConstructor
@ToString(callSuper = true)
public class Doctor extends User {
    @Column(name = "specialty", nullable = false, length = 150)
    private String specialty;

    @OneToMany(mappedBy = "doctor")
    private List<Consultation> consultationList = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "department_id")
    @Fetch(FetchMode.JOIN)
    private Department department;

    public Doctor(Long id, String firstName, String lastName, String email, String password, String specialty) {
        super(id, firstName, lastName, email, password, null, RoleEnum.DOCTOR, null, null);
        this.specialty = specialty;
    }

    public List<Consultation> getConsultatoins() {
        return this.consultationList;
    }

    public void addConsultation(Consultation consultation) {
        this.consultationList.add(consultation);
    }
}
