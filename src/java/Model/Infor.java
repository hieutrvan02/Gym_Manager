/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

public class Infor {

    private String id;
    private String name;
    private String dob;
    private String gender;
    private String phone;
    private String id_card;
    private String address;
    private String email;
    private String id_branch;
    private String maxDate;
    private String imgPath;

    public Infor() {
    }
    
    
    
    public Infor(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public Infor(String id, String name, String dob, String gender, String phone, String id_card, String address, String email, String id_branch, String maxDate, String imgPath) {
        this.id = id;
        this.name = name;
        this.dob = dob;
        this.gender = gender;
        this.phone = phone;
        this.id_card = id_card;
        this.address = address;
        this.email = email;
        this.id_branch = id_branch;
        this.maxDate = maxDate;
        this.imgPath = imgPath;
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

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getId_card() {
        return id_card;
    }

    public void setId_card(String id_card) {
        this.id_card = id_card;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getId_branch() {
        return id_branch;
    }

    public void setId_branch(String id_branch) {
        this.id_branch = id_branch;
    }

    public String getMaxDate() {
        return maxDate;
    }

    public void setMaxDate(String maxDate) {
        this.maxDate = maxDate;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}

