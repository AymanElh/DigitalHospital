package com.youcode.digitalhospital.model;

import jakarta.persistence.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "patients")
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
        super(id, firstName, lastName, email, password, RoleEnum.PATIENT);
        this.height = height;
        this.weight = weight;
    }


    public Patient() {
        super();
        setRole(RoleEnum.PATIENT);
    }

    public double getHeight() {
        return height;
    }

    public void setHeight(double height) {
        this.height = height;
    }

    public double getWeigth() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public List<Consultation> getConsultations() {
        return consultations;
    }

    public void addConsultation(Consultation consultation) {
        consultations.add(consultation);
    }

    @Override
    public String toString() {
        return "Patient{" +
                "height=" + height +
                ", weight=" + weight +
                '}';
    }
}
