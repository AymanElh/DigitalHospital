package com.youcode.digitalhospital.mapper;

import com.youcode.digitalhospital.dto.department.DepartmentDTO;
import com.youcode.digitalhospital.model.Department;

public class DepartmentMapper {

    /**
     * Convert Department entity to DepartmentDTO
     */
    public static DepartmentDTO toDTO(Department department) {
        if (department == null) {
            return null;
        }

        DepartmentDTO dto = new DepartmentDTO();
        dto.setId(department.getId());
        dto.setName(department.getName());
        dto.setDescription(department.getDescription());

        // Count the number of doctors in this department
        if (department.getDoctors() != null) {
            dto.setDoctorCount(department.getDoctors().size());
        } else {
            dto.setDoctorCount(0);
        }

        return dto;
    }

    /**
     * Convert DepartmentDTO to Department entity
     */
    public static Department toEntity(DepartmentDTO dto) {
        if (dto == null) {
            return null;
        }

        Department department = new Department();
        department.setId(dto.getId());
        department.setName(dto.getName());
        department.setDescription(dto.getDescription());

        return department;
    }
}

