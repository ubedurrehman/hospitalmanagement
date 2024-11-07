package com.example.admin;

import com.example.dao.SpecialistDao;
import com.example.db.DBConnect;
import com.example.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addSpecialist")
public class AddSpecialist extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String specName=req.getParameter("specName");

        SpecialistDao dao=new SpecialistDao(DBConnect.getConn());
        boolean f=dao.addSpecialist(specName);

        HttpSession session=req.getSession();

        if(f){
            session.setAttribute("succMsg","SpeciaList Added");
            resp.sendRedirect("admin/index.jsp");
        }else{
            session.setAttribute("errorMsg","Something wrong on server");
            resp.sendRedirect("admin/index.jsp");
        }

    }
}
