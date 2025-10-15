package com.youcode.digitalhospital.service.interfaces.business;

import com.youcode.digitalhospital.model.Consultation;
import com.youcode.digitalhospital.model.ConsultationStatus;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public interface IConsultationService {
    // Patient side
    List<Consultation> getPatientHistory(Long patientId) throws Exception;
    Consultation bookConsultation(Long patientId, Long slotId, String reason) throws Exception;
    Consultation modifyConsultation(Long consultationId, LocalDate date, LocalDateTime time, String reason) throws Exception;
    Consultation cancelConsultationByPatient(Long id, Long patientId, Long slotId) throws Exception;


    Consultation validateConsultation(Long consultationId, Long patientId) throws Exception;

    List<Consultation> getBookedConsultationOnDate(LocalDate date, Long doctorId);

    // Doctor side
    List<Consultation> getDoctorPlaning(Long doctorId, LocalDate date);
    List<Consultation> getPlanningConsultations(Long doctorId);
    Consultation refuseConsultation(Long consultationId, Long doctorId);
    Consultation updateConsultationStatus(Long consultationId, ConsultationStatus status, Long doctorId);
    String createCompteRendu(Long doctorId, Long patientId, Long consultationId);

    // General
    List<Consultation> getConsultaionByDate(LocalDate date);
    Consultation getConsultationByDateAndTime(LocalDate date, LocalDateTime time);
    List<Consultation> getConsultationByStatus(ConsultationStatus status);
    Long countAllConsultations();
}
