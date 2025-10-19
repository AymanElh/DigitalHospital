package com.youcode.digitalhospital.dto.doctor;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.RoleEnum;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DoctorDTO {
    // personal info
    private Long id;
    @NotBlank(message = "First name is required")
    private String firstName;
    @NotBlank(message = "Last name is required")
    private String lastName;
    @NotBlank(message = "Email is required")
    @Email(message = "Not a valid email")
    private String email;
    @Pattern(regexp = "^(\\+212|0)[5-7][0-9]{8}$",
            message = "Please enter a valid Moroccan phone number (e.g., 0612345678)")
    private String phone;
    @NotBlank(message = "Password field is required")
    @Size(min = 8, message = "Password must be more than 8 characters")
    private String password;

    @Size(min = 8, message = "Password confirmation must be at least 8 characters")
    private String confirmPassword;


    @NotBlank(message = "Sepciality is required")
    private String speciality;
    @NotNull(message = "Department is required")
    @Positive(message = "Please enter a valid department")
    private Long departmentId;

    private String departmentName;

    @Positive(message = "Please enter a valid room")
    private Long roomId;
    private Long roomNumber;

    private Integer consultationCount; // Number of consultations
    private List<Consultation> consultationList;
}

