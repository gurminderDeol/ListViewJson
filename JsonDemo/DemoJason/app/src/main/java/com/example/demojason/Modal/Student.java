package com.example.demojason.Modal;

public class Student
{
    String id;
    String name;
    String gender;

    public Student(String id ,String name,String gender)
    {
        id=this.id;
        name=this.name;
        gender=this.gender;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
