package com.hackalerts.dao;

import com.hackalerts.entities.Organize;
import java.sql.*;

public class OrganizeDao {

    Connection con;

    public OrganizeDao(Connection con) {
        this.con = con;
    }

    public boolean saveOrganizedHacks(Organize org) {
        boolean status = false;

        try {
            String query = "insert into organize(cid,userid,eName,clgName,regProcess,sDate,eDate,tags,min,max,implement,rules,organizer1,contact1,organizer2,contact2) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, org.getCid());
            ps.setInt(2, org.getUserid());
            ps.setString(3, org.geteName());
            ps.setString(4, org.getClgName());
            ps.setString(5, org.getRegProcess());
            ps.setString(6, org.getsDate());
            ps.setString(7, org.geteDate());
            ps.setString(8, org.getTags());
            ps.setInt(9, org.getMin());
            ps.setInt(10, org.getMax());
            ps.setString(11, org.getImplement());
            ps.setString(12, org.getRules());
            ps.setString(13, org.getOrganizer1());
            ps.setString(14, org.getContact1());
            ps.setString(15, org.getOrganizer2());
            ps.setString(16, org.getContact1());

            int rowsAffected = ps.executeUpdate();

            // Check if any rows were affected
            if (rowsAffected > 0) {
                status = true;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return status;
    }

}
