package com.example.user.servlet;



import com.example.dao.UserDao;
import com.example.db.DBConnect;
import com.example.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user_register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       try {

           String fullname =req.getParameter("fullname");
           String email = req.getParameter("email");
           String password = req.getParameter("password");

           User u = new User(fullname,email,password);

           UserDao dao=new UserDao(DBConnect.getConn());
           HttpSession session=req.getSession();
           boolean f=dao.userRegister(u);


           if(f){
               session.setAttribute("sucMsg", "Register Account Successfully...");
               resp.sendRedirect("signup.jsp");
               System.out.println("data inserted");
           }else {

               session.setAttribute("errorMsg", "Not Register Please Check Error...");
               resp.sendRedirect("signup.jsp");

               System.out.println("not data inserted");
           }



       }catch (Exception e){
           e.printStackTrace();
       }
    }
}
