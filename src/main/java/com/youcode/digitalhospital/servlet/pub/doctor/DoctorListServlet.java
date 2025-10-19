package com.youcode.digitalhospital.servlet.pub.doctor;

import com.youcode.digitalhospital.dto.doctor.DoctorDTO;
import com.youcode.digitalhospital.mapper.DoctorMapper;
import com.youcode.digitalhospital.service.interfaces.entity.IDoctorService;
import jakarta.inject.Inject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/doctors")
public class DoctorListServlet extends HttpServlet {

    @Inject
    IDoctorService doctorService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DoctorDTO> doctorList = doctorService.findAll().stream().map(DoctorMapper::toDTO).toList();
        System.out.println(doctorList.size());
        req.setAttribute("doctors", doctorList);
        req.getRequestDispatcher("/WEB-INF/view/public/doctors/list.jsp").forward(req, resp);
    }
}
