package com.book.control.entity;

public class User_num {
    String date;
    String num;

    @Override
    public String toString() {
        return "User_num{" +
                "date='" + date + '\'' +
                ", num='" + num + '\'' +
                '}';
    }

    public User_num(String date, String num) {
        this.date = date;
        this.num = num;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }
}
