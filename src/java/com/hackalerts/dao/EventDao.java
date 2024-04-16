package com.hackalerts.dao;

import com.hackalerts.entities.Categories;
import com.hackalerts.entities.Events;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventDao {

    Connection con;

    public EventDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> list = new ArrayList<>();
        try {
            String query = "select * from categories";
            Statement ps = con.createStatement();
            ResultSet result = ps.executeQuery(query);
            while (result.next()) {
                int cid = result.getInt("cid");
                String name = result.getString("name");
                String description = result.getString("description");
                Categories c = new Categories(cid, name, description);
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean saveEvents(Events e) {
        boolean f = false;

        try {
            String query = "insert into events(etitle,epic,regLink,edate,cid,clgName,location,userid) values(?,?,?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, e.getEtitle());
            ps.setString(2, e.getEpic());
            ps.setString(3, e.getRegLink());
            ps.setString(4, e.getEdate());
            ps.setInt(5, e.getCid());
            ps.setString(6, e.getClgName());
            ps.setString(7, e.getLocation());
            ps.setInt(8, e.getUserID());
            ps.executeUpdate();
            f = true;

        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return f;
    }

    //getting all the events
    public List<Events> getAllEvents() {

        List<Events> list = new ArrayList<>();
        //fetch all the events
        try {
            String query = "select * from events order by eid desc";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int eid = set.getInt("eid");
                String etitle = set.getString("etitle");
                String epic = set.getString("epic");
                String regLink = set.getString("regLink");
                String edate = set.getString("edate");
                String clgName = set.getString("clgName");
                String venue = set.getString("location");
                int cid = set.getInt("cid");
                int userID = set.getInt("userid");
                String postedDate = set.getString("postedDate");

                Events event = new Events(eid, etitle, epic, regLink, edate, cid, clgName, venue, userID,postedDate);
                list.add(event);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<Events> getEventsCid(int cid) {

        List<Events> list = new ArrayList<>();
        //get events by id
        try {
            String query = "select * from events where cid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int eid = set.getInt("eid");
                String etitle = set.getString("etitle");
                String epic = set.getString("epic");
                String regLink = set.getString("regLink");
                String edate = set.getString("edate");
                String clgName = set.getString("clgName");
                String venue = set.getString("location");
                int userID = set.getInt("userid");
                String postedDate = set.getString("postedDate");

                Events event = new Events(eid, etitle, epic, regLink, edate, cid, clgName, venue, userID,postedDate);
                list.add(event);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Events getEventByEventId(int id) {

        Events events = null;

        try {
            String query = "select * from events where eid=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                int eid = set.getInt("eid");
                String etitle = set.getString("etitle");
                String epic = set.getString("epic");
                String regLink = set.getString("regLink");
                String edate = set.getString("edate");
                int cid = set.getInt("cid");
                String clgName = set.getString("clgName");
                String venue = set.getString("location");
                int userID = set.getInt("userid");
                String postedDate = set.getString("postedDate");
                events = new Events(eid, etitle, epic, regLink, edate, cid, clgName, venue, userID,postedDate);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return events;
    }
   
}
