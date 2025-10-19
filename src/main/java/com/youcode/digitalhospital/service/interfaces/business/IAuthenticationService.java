package com.youcode.digitalhospital.service.interfaces.business;

import com.youcode.digitalhospital.dto.auth.LoginDTO;
import com.youcode.digitalhospital.dto.auth.RegisterPatientDTO;
import com.youcode.digitalhospital.model.User;

public interface IAuthenticationService {
    User registerPatient(RegisterPatientDTO dto);
    User login(LoginDTO dto);
    boolean isEmailRegistred(String email);
}
