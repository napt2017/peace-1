package com.vn.hungtq.peace.common;

import java.util.*;
import java.util.function.Supplier;

/**
 * Created by napt2017 on 3/19/2017.
 */
public class VnStudent implements IExport {
    private int id;
    private String name;
    private int age;
    private boolean gender;
    private Date birth;

    public VnStudent(int id, String name, int age, boolean gender) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.birth = new Date();
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getBirth() {
        return birth;
    }

    public void setBirth(Date birth) {
        this.birth = birth;
    }

    @SuppressWarnings("rawtypes")
	@Override
    public LinkedHashMap<String, Supplier> getMapTitleWithSupplier() { 
		LinkedHashMap<String,Supplier> mapTitleWithSupplier = new LinkedHashMap<>();
        mapTitleWithSupplier.put("Id",()->this.getId());
        mapTitleWithSupplier.put("Name",()->this.getName());
        mapTitleWithSupplier.put("Age",()->this.getAge());
        mapTitleWithSupplier.put("Gender",()->this.isGender());
        mapTitleWithSupplier.put("Birth",()->this.getBirth());

        return mapTitleWithSupplier;
    }
}
