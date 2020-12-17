package com.book.control.entity;

import java.util.Date;

public class Borrow {
    public String id;
    public String username;
    public String bookid;
    public String bookname;
    public String statu;
    public String borrowtime;
    public String returntime;

    @Override
    public String toString() {
        return "borrow{" +
                "id='" + id + '\'' +
                ", username='" + username + '\'' +
                ", bookid='" + bookid + '\'' +
                ", bookname='" + bookname + '\'' +
                ", statu='" + statu + '\'' +
                ", borrowtime='" + borrowtime + '\'' +
                ", returntime='" + returntime + '\'' +
                '}';
    }

    public Borrow(String id, String username, String bookid, String bookname, String statu, String borrowtime, String returntime) {
        this.id = id;
        this.username = username;
        this.bookid = bookid;
        this.bookname = bookname;
        this.statu = statu;
        this.borrowtime = borrowtime;
        this.returntime = returntime;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBookid() {
        return bookid;
    }

    public void setBookid(String bookid) {
        this.bookid = bookid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getStatu() {
        return statu;
    }

    public void setStatu(String statu) {
        this.statu = statu;
    }

    public String getBorrowtime() {
        return borrowtime;
    }

    public void setBorrowtime(String borrowtime) {
        this.borrowtime = borrowtime;
    }

    public String getReturntime() {
        return returntime;
    }

    public void setReturntime(String returntime) {
        this.returntime = returntime;
    }
}
