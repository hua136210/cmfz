package com.hhh.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private String id;
    private String phoneNum;
    private String username;
    private String password;
    private String province;
    private String city;
    private String nickName;
    private String sex;
    private String headPic;
    private String status;
    @JsonFormat(pattern = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;

    public User() {
    }

    public User(String id, String phoneNum, String username, String password, String province, String city, String nickName, String sex, String headPic, String status, Date birthday) {
        this.id = id;
        this.phoneNum = phoneNum;
        this.username = username;
        this.password = password;
        this.province = province;
        this.city = city;
        this.nickName = nickName;
        this.sex = sex;
        this.headPic = headPic;
        this.status = status;
        this.birthday = birthday;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getHeadPic() {
        return headPic;
    }

    public void setHeadPic(String headPic) {
        this.headPic = headPic;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", phoneNum='" + phoneNum + '\'' +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", province='" + province + '\'' +
                ", city='" + city + '\'' +
                ", nickName='" + nickName + '\'' +
                ", sex='" + sex + '\'' +
                ", headPic='" + headPic + '\'' +
                ", status='" + status + '\'' +
                ", birthday=" + birthday +
                '}';
    }
}
