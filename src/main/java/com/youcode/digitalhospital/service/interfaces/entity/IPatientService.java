package com.youcode.digitalhospital.service.interfaces.entity;

import com.youcode.digitalhospital.model.Patient;

public interface IPatientService {
    Patient addNewPatient(Patient patient);
    Patient updatePatient(Patient patient);
    void delete(Patient patient);
}
