package com.youcode.digitalhospital.service.interfaces.entity;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.Patient;

import java.util.List;
import java.util.Optional;

public interface IPatientService {
    Patient addNewPatient(Patient patient);
    Patient updatePatient(Patient patient);
    void delete(Patient patient);
    Optional<Patient> getPatientById(Long id);
    List<Patient> getAllPatients();
    Optional<Patient> getPatientByEmail(String email);
    List<Patient> getPatientsWithConsultations();
    Long countAllPatients();
}
