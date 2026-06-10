package Models;

import java.sql.Date;

public class BorrowRecordDTO {
    private int borrow_id;
    private int book_id;
    private String book_title;
    private String location;
    private int member_id;
    private String member_name;
    private Date request_date;
    private Date approval_date;
    private Date pickup_date;
    private Date due_date;
    private Date return_date;
    private String status;
    private boolean isWalkIn;
    private String cover_image;

    public BorrowRecordDTO() {
    }

    // Getters and Setters
    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getBook_title() {
        return book_title;
    }

    public void setBook_title(String book_title) {
        this.book_title = book_title;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public Date getRequest_date() {
        return request_date;
    }

    public void setRequest_date(Date request_date) {
        this.request_date = request_date;
    }

    public Date getApproval_date() {
        return approval_date;
    }

    public void setApproval_date(Date approval_date) {
        this.approval_date = approval_date;
    }

    public Date getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(Date pickup_date) {
        this.pickup_date = pickup_date;
    }

    public Date getDue_date() {
        return due_date;
    }

    public void setDue_date(Date due_date) {
        this.due_date = due_date;
    }

    public Date getReturn_date() {
        return return_date;
    }

    public void setReturn_date(Date return_date) {
        this.return_date = return_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public boolean isWalkIn() {
        return isWalkIn;
    }

    public void setWalkIn(boolean walkIn) {
        isWalkIn = walkIn;
    }

    public String getCoverImage() {
        return cover_image;
    }

    public void setCoverImage(String cover_image) {
        this.cover_image = cover_image;
    }
}
