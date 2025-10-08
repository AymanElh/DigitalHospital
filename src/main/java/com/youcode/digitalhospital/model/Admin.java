package com.youcode.digitalhospital.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;

@Entity
@Table(name = "admins")
public class Admin extends User {

    public Admin(Long id, String firstName, String lastName, String email, String password) {
        super(id, firstName, lastName, email, password, RoleEnum.ADMIN);
    }

    public Admin() {
        super();
        setRole(RoleEnum.ADMIN);
    }
}

