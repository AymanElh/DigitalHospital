package com.youcode.digitalhospital.model;

import jakarta.persistence.*;
import lombok.*;
import org.hibernate.annotations.SQLDelete;
import org.hibernate.annotations.SQLRestriction;

import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Inheritance(strategy = InheritanceType.JOINED)
@SQLDelete(sql = "UPDATE users SET is_deleted = true, deleted_at = NOW() WHERE id = ?")
@SQLRestriction("is_deleted = false")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public abstract class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long id;

    @Column(name = "first_name", nullable = false, length = 100)
    protected String firstName;

    @Column(name = "last_name", nullable = false, length = 100)
    protected String lastName;

    @Column(nullable = false, unique = true, length = 150)
    protected String email;

    @Column(nullable = false, length = 255)
    protected String password;

    @Transient
    protected String confirmPassword;

    @Column(nullable = false, length = 25)
    @Enumerated(EnumType.STRING)
    private RoleEnum role;

    @Column(name = "is_deleted", nullable = false)
    private Boolean isDeleted = false;

    @Column(name = "deleted_at")
    private LocalDateTime deletedAt;

    @Column(name = "created_at", updatable = false)
    protected LocalDateTime createdAt;

    @Column(name = "updated_at")
    protected LocalDateTime updatedAt;

    public User(String firstName, String lastName, String email, String password, String confirmPassword, RoleEnum role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.role = role;
    }

    // Helper methods
    public String getUserName() {
        return firstName + " " + lastName;
    }

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }

    public void softDelete() {
        this.isDeleted = true;
        this.deletedAt = LocalDateTime.now();
    }

    public void restore() {
        this.isDeleted = false;
        this.deletedAt = null;
    }

    public boolean isDeleted() {
        return isDeleted != null && isDeleted == true;
    }

    public boolean isActive() {
        return !isDeleted();
    }
}
