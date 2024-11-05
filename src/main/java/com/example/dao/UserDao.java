package com.example.dao;

import com.example.entity.User;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
