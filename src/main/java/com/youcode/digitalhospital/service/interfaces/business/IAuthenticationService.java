package com.youcode.digitalhospital.service.interfaces.business;

import com.youcode.digitalhospital.dto.RegisterPatientDTO;
import com.youcode.digitalhospital.model.User;

public interface IAuthenticationService {
    User registerPatient(RegisterPatientDTO dto);
    User login(String email, String password);
    boolean isEmailRegistred(String email);
}
