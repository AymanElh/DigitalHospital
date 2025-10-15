package com.youcode.digitalhospital.dto;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class RegisterPatientDTO {

    @NotBlank(message = "First name is required")
    @Size(min = 2, max = 50, message = "First name must be between 2 and 50 characters")
    @Pattern(regexp = "^[a-zA-ZÀ-ÿ\\s]+$", message = "First name can only contain letters")
    private String firstName;

    @NotBlank(message = "Last name is required")
    @Size(min = 2, max = 50, message = "Last name must be between 2 and 50 characters")
    @Pattern(regexp = "^[a-zA-ZÀ-ÿ\\s]+$", message = "Last name can only contain letters")
    private String lastName;

    @NotBlank(message = "Email is required")
    @Email(message = "Please enter a valid email address")
    private String email;

    @NotBlank(message = "Phone number is required")
    @Pattern(regexp = "^(\\+212|0)[5-7][0-9]{8}$", message = "Please enter a valid Moroccan phone number (e.g., 0612345678 or +212612345678)")
    private String phone;

    @NotNull(message = "Date of birth is required")
    @Past(message = "Date of birth must be on past")
    private LocalDate dateOfBirth;

    @NotBlank(message = "Password field is required")
    @Size(min = 8, max = 100, message = "Password must be at least 8 characters")
    @Pattern(
            regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).*$",
            message = "Password must contain at least: one digit, one lowercase, one uppercase, and one special character (@#$%^&+=)"
    )
    private String password;

    @NotBlank(message = "Please confirm your password")
    private String confirmPassword;

    @Positive(message = "Height must be positive")
    @DecimalMin(value = "50.0", message = "Height must be at least 50 cm")
    @DecimalMax(value = "250.0", message = "Height must not exceed 250 cm")
    private Double height;

    private Double weight;
}
