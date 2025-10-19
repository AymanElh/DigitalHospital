package com.youcode.digitalhospital.mapper;

import com.youcode.digitalhospital.dto.doctor.DoctorDTO;
import com.youcode.digitalhospital.model.Doctor;

public class DoctorMapper {

    public static DoctorDTO toDTO(Doctor doctor) {
        if (doctor == null) {
            return null;
        }

        DoctorDTO doctorDTO = new DoctorDTO();
        doctorDTO.setId(doctor.getId());
        doctorDTO.setFirstName(doctor.getFirstName());
        doctorDTO.setLastName(doctor.getLastName());
        doctorDTO.setEmail(doctor.getEmail());
        doctorDTO.setSpeciality(doctor.getSpeciality());

        if (doctor.getDepartment() != null) {
            doctorDTO.setDepartmentId(doctor.getDepartment().getId());
            doctorDTO.setDepartmentName(doctor.getDepartment().getName());
        }

        if (doctor.getRoom() != null) {
            doctorDTO.setRoomId(doctor.getRoom().getId());
            doctorDTO.setRoomNumber(doctor.getRoom().getRoomNumber());
        }

        if(doctor.getConsultationList() != null) {
            doctorDTO.setConsultationCount(doctor.getConsultationList().size());
        } else {
            doctorDTO.setConsultationCount(0);
        }

        if(doctor.getConsultationList() != null) {
            doctorDTO.setConsultationList(doctor.getConsultationList());
        }

        return doctorDTO;
    }

    public static Doctor toEntity(DoctorDTO dto) {
        if(dto == null) {
            return null;
        }

        Doctor doctor = new Doctor();
        doctor.setId(dto.getId());
        doctor.setFirstName(dto.getFirstName());
        doctor.setLastName(dto.getLastName());
        doctor.setEmail(dto.getEmail());
        doctor.setSpeciality(dto.getSpeciality());

        if(dto.getPassword() != null) {
            doctor.setPassword(dto.getPassword());
        }

        return doctor;
    }
}