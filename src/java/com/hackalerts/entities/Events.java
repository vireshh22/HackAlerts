package com.hackalerts.entities;

import java.sql.Date;

public class Events {

    private int eid;
    private String etitle;
    private String epic;
    private String edate;
    public String postedDate;
    private String regLink;
    private int cid;
    private String clgName;
    private String location;
    private int userID;

    public Events() {
    }

    public Events(int eid, String etitle, String epic,String regLink, String edate, int cid, String clgName, String location, int userID,String postedDate) {
        this.eid = eid;
        this.etitle = etitle;
        this.epic = epic;
        this.regLink = regLink;
        this.edate = edate;
        this.cid = cid;
        this.clgName = clgName;
        this.location = location;
        this.userID = userID;
        this.postedDate = postedDate;
    }

    public Events(String etitle, String epic, String regLink, String edate, int cid, String clgName, String location, int userID,String postedDate) {
        this.etitle = etitle;
        this.epic = epic;
        this.regLink = regLink;
        this.edate = edate;
        this.cid = cid;
        this.clgName = clgName;
        this.location = location;
        this.userID = userID;
        this.postedDate = postedDate;
    }
    
    

    public void setEid(int eid) {
        this.eid = eid;
    }

    public void setEtitle(String etitle) {
        this.etitle = etitle;
    }

    public void setEpic(String epic) {
        this.epic = epic;
    }

    public void setEdate(String edate) {
        this.edate = edate;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setClgName(String clgName) {
        this.clgName = clgName;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getEid() {
        return eid;
    }

    public String getEtitle() {
        return etitle;
    }

    public String getEpic() {
        return epic;
    }

    public String getEdate() {
        return edate;
    }

    public int getCid() {
        return cid;
    }

    public String getClgName() {
        return clgName;
    }

    public String getLocation() {
        return location;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getRegLink() {
        return regLink;
    }

    public void setRegLink(String regLink) {
        this.regLink = regLink;
    }

    public String getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(String postedDate) {
        this.postedDate = postedDate;
    }
    
    

}
