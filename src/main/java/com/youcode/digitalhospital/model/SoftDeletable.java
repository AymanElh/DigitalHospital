package com.youcode.digitalhospital.model;

public interface SoftDeletable {
    void softDelete();
    void restore();
    boolean isDeleted();
    boolean isActive();
}
