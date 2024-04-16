package com.hackalerts.entities;


public class User {
    private int id;
    private String name;
    private String email;
    private String clg;
    private String password;

    public User() {
    }
    
    public User(int id, String name, String email, String clg, String password) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.clg = clg;
        this.password = password;
    }

    public User(String name, String email, String clg, String password) {
        this.name = name;
        this.email = email;
        this.clg = clg;
        this.password = password;
    }
    
//    getters & setters

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setClg(String clg) {
        this.clg = clg;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getClg() {
        return clg;
    }

    public String getPassword() {
        return password;
    }
}