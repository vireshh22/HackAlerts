package com.hackalerts.entities;

public class Organize {
    int oid;
    int cid;
    int userid;
    String eName;
    String clgName;
    String regProcess;
    String sDate;
    String eDate;
    String tags;
    int min;
    int max;
    String implement;
    String rules;
    String organizer1;
    String contact1;
    String organizer2;
    String contact2;

    public Organize(int cid, int userid, String eName, String clgName, String regProcess, String sDate, String eDate, String tags, int min, int max, String implement, String rules, String organizer1, String contact1, String organizer2, String contact2) {
        this.cid = cid;
        this.userid = userid;
        this.eName = eName;
        this.clgName = clgName;
        this.regProcess = regProcess;
        this.sDate = sDate;
        this.eDate = eDate;
        this.tags = tags;
        this.min = min;
        this.max = max;
        this.implement = implement;
        this.rules = rules;
        this.organizer1 = organizer1;
        this.contact1 = contact1;
        this.organizer2 = organizer2;
        this.contact2 = contact2;
    }

    public Organize(int oid, int cid, int userid, String eName, String clgName, String regProcess, String sDate, String eDate, String tags, int min, int max, String implement, String rules, String organizer1, String contact1, String organizer2, String contact2) {
        this.oid = oid;
        this.cid = cid;
        this.userid = userid;
        this.eName = eName;
        this.clgName = clgName;
        this.regProcess = regProcess;
        this.sDate = sDate;
        this.eDate = eDate;
        this.tags = tags;
        this.min = min;
        this.max = max;
        this.implement = implement;
        this.rules = rules;
        this.organizer1 = organizer1;
        this.contact1 = contact1;
        this.organizer2 = organizer2;
        this.contact2 = contact2;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public void setCid(int cid) {
        this.cid = cid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public void seteName(String eName) {
        this.eName = eName;
    }

    public void setClgName(String clgName) {
        this.clgName = clgName;
    }

    public void setRegProcess(String regProcess) {
        this.regProcess = regProcess;
    }

    public void setsDate(String sDate) {
        this.sDate = sDate;
    }

    public void seteDate(String eDate) {
        this.eDate = eDate;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public void setMin(int min) {
        this.min = min;
    }

    public void setMax(int max) {
        this.max = max;
    }

    public void setImplement(String implement) {
        this.implement = implement;
    }

    public void setRules(String rules) {
        this.rules = rules;
    }

    public void setOrganizer1(String organizer1) {
        this.organizer1 = organizer1;
    }

    public void setContact1(String contact1) {
        this.contact1 = contact1;
    }

    public void setOrganizer2(String organizer2) {
        this.organizer2 = organizer2;
    }

    public void setContact2(String contact2) {
        this.contact2 = contact2;
    }

    public int getOid() {
        return oid;
    }

    public int getCid() {
        return cid;
    }

    public int getUserid() {
        return userid;
    }

    public String geteName() {
        return eName;
    }

    public String getClgName() {
        return clgName;
    }

    public String getRegProcess() {
        return regProcess;
    }

    public String getsDate() {
        return sDate;
    }

    public String geteDate() {
        return eDate;
    }

    public String getTags() {
        return tags;
    }

    public int getMin() {
        return min;
    }

    public int getMax() {
        return max;
    }

    public String getImplement() {
        return implement;
    }

    public String getRules() {
        return rules;
    }

    public String getOrganizer1() {
        return organizer1;
    }

    public String getContact1() {
        return contact1;
    }

    public String getOrganizer2() {
        return organizer2;
    }

    public String getContact2() {
        return contact2;
    }

    
    
}
