package com.hackalerts.dao;

import com.hackalerts.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //inserting user data
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            //user -> database
            String query = "insert into user(name,email,clg,password) values(?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getClg());
            ps.setString(4, user.getPassword());
            ps.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByEmailPassword(String email, String password) {
        User user = null;

        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                //set ID
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setClg(rs.getString("clg"));
                user.setPassword(rs.getString("password"));
            } else {

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public User getUserByID(int id){
        User user = null;
        try{
            String query = "select * from user where id=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet set = ps.executeQuery();
            if(set.next()){
                user = new User();
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setClg(set.getString("clgName"));
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }  
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try{
            String query = "update user set email=?,password=?,clg=? where id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1,user.getEmail());
            p.setString(2,user.getPassword());
            p.setString(3,user.getClg());
            p.setInt(4, user.getId());
            
            p.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
}
