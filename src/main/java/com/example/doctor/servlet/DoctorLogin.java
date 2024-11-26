package com.example.doctor.servlet;

import com.example.dao.DoctorDao;
import com.example.dao.UserDao;
import com.example.db.DBConnect;
import com.example.entity.Doctor;
import com.example.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email=req.getParameter("email");
        String password = req.getParameter("password");

        HttpSession session=req.getSession();

        DoctorDao dao = new DoctorDao(DBConnect.getConn());

        Doctor doctor =dao.login(email,password);

        if(doctor!=null){
            session.setAttribute("docObj" ,doctor);
            resp.sendRedirect("doctor/index.jsp");
        }else{
            session.setAttribute("errorMsg", "Invalid Email & password...");

            resp.sendRedirect("doctor_login.jsp");
        }
    }
}
