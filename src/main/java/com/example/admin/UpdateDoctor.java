package com.example.admin;

import com.example.dao.DoctorDao;
import com.example.db.DBConnect;
import com.example.entity.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updatedoctor")
public class UpdateDoctor extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobno = req.getParameter("mobno");
            String password = req.getParameter("email");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id, fullName, dob, qualification, spec, email, mobno, password);

            DoctorDao dao = new DoctorDao(DBConnect.getConn());

            HttpSession session = req.getSession();

            if (dao.updateDoctor(d)) {
                session.setAttribute("succMsg", "Update Successfully ");
                resp.sendRedirect("admin/view_doctor.jsp");
            } else {
                session.setAttribute("errorMsg", "Something Wrong Server");
                resp.sendRedirect("admin/view_doctor.jsp ");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}






