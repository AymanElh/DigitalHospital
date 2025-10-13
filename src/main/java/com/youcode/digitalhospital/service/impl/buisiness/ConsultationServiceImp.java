package com.youcode.digitalhospital.service.impl.buisiness;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationStatus;
import com.youcode.digitalhospital.service.interfaces.business.IConsultationService;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class ConsultationServiceImp implements IConsultationService {

    @Override
    public Consultation bookConsultation(Long patientId, Long doctorId, LocalDate date, LocalDateTime startTime, LocalDateTime endTime, String reason) {
        if(date.isBefore(LocalDate.now())) {
            throw new IllegalArgumentException("You cannot get a consultation on the past");
        }

        if(!isAvailableConsultation(doctorId, date, startTime, endTime)) {
            throw new IllegalArgumentException("Consultation is not available on these date or time");
        }


        return null;
    }

    @Override
    public List<Consultation> getPatientHistory(Long patientId) {
        return List.of();
    }

    @Override
    public Consultation modifyConsultation(Long consultationId, Long slotId, String reason) {
        return null;
    }

    @Override
    public Consultation cancelConsultationByPatient(Long id, Long patientId) {
        return null;
    }

    @Override
    public Consultation validateConsultation(Long consultationId, Long patientId) {
        return null;
    }

    @Override
    public boolean isAvailableConsultation(Long doctorId, LocalDate consultationDate, LocalDateTime startTime, LocalDateTime endTime) {
        return false;
    }

    @Override
    public List<Consultation> getBookedConsultationOnDate(LocalDate date, Long doctorId) {
        return List.of();
    }

    @Override
    public List<Consultation> getDoctorPlaning(Long doctorId) {
        return List.of();
    }

    @Override
    public List<Consultation> getPlanningConsultations(Long doctorId) {
        return List.of();
    }

    @Override
    public Consultation refuseConsultation(Long consultationId, Long doctorId) {
        return null;
    }

    @Override
    public Consultation updateConsultationStatus(Long consultationId, ConsultationStatus status, Long doctorId) {
        return null;
    }

    @Override
    public String createCompteRendu(Long doctorId, Long patientId, Long consultationId) {
        return "";
    }

    @Override
    public List<Consultation> getConsultaionByDate(LocalDate date) {
        return List.of();
    }

    @Override
    public List<Consultation> getConsultationByStatus(ConsultationStatus status) {
        return List.of();
    }

    @Override
    public Long countAllConsultations() {
        return 0L;
    }
}
