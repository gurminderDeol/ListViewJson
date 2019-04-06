package com.example.demojson;

public class Student {
    String Id;
    String name;
    String gender;

    public Student()
    {
        Id=this.Id;
        name=this.name;
        gender=this.gender;
    }

    public String getId() {
        return Id;
    }

    public void setId(String id) {
        Id = id;
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
