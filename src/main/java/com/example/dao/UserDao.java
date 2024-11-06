package com.example.dao;

import com.example.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ResourceBundle;

public class UserDao {
    private Connection conn;
    public UserDao(Connection conn){
        super();
        this.conn=conn;
    }

    public boolean userRegister(User u){
        boolean f=false;
        try{

            String sql = "insert into user_detail(fullName, email, password) values(?,?,?)";

            PreparedStatement ps=conn.prepareStatement(sql);

            ps.setString(1,u.getFullName());
            ps.setString(2,u.getEmail());
            ps.setString(3, u.getPassword());

            int i = ps.executeUpdate();

            if(i == i){
                f =true;
            }

        }catch (Exception e){
            e.printStackTrace();
        }
        return f;

    }

    public User login(String em, String psw){
        User u=null;
        try{
            String sql="select * from user_detail where email=? and password=?";
            PreparedStatement ps=conn.prepareStatement(sql);
            ps.setString(1,em);
            ps.setString(2,psw);

            ResultSet rs=ps.executeQuery();
            while (rs.next()){
                u=new User();
                u.setId(rs.getInt(1));
                u.setFullName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setPassword(rs.getString(4));

            }

        }catch (Exception e){
            e.printStackTrace();
        }

        return u;
    }
}
