package com.youcode.digitalhospital.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "admins")
@NoArgsConstructor
public class Admin extends User {

    public Admin(Long id, String firstName, String lastName, String email, String password) {
        super(id, firstName, lastName, email, password, null, RoleEnum.ADMIN, null, null);
    }
}
