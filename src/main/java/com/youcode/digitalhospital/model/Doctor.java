package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "doctors")
public class Doctor extends User {
    @Column(name = "specialty", nullable = false, length = 150)
    private String specialty;

    @OneToMany(mappedBy = "doctor")
    private List<Consultation> consultationList = new ArrayList<>();

    @ManyToOne
    @JoinColumn(name = "department_id")
    @Fetch(FetchMode.JOIN)
    private Department department;

    // Constructors
    public Doctor(Long id, String firstName, String lastName, String email, String password, String specialty) {
        super(id, firstName, lastName, email, password, RoleEnum.DOCTOR);
        this.specialty = specialty;
    }

    public Doctor() {
        super();
        setRole(RoleEnum.DOCTOR);
    }

    // Getters and setters
    public List<Consultation> getConsultationList() {
        return consultationList;
    }

    public void setConsultationList(List<Consultation> consultationList) {
        this.consultationList = consultationList;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public List<Consultation> getConsultatoins() {
        return this.consultationList;
    }

    public void addConsultation(Consultation consultation) {
        this.consultationList.add(consultation);
    }

    @Override
    public String toString() {
        return super.toString() + "Doctor{" +
                "specialty='" + specialty + '\'' +
                ", consultationList=" + consultationList +
                '}';
    }
}
