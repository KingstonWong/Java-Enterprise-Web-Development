package Models;

import java.sql.Date;

public class BorrowRecord {
    private int borrow_id;
    private int member_id;
    private int book_id;
    private Date request_date;
    private Date approval_date;
    private Date due_date;
    private Date return_date;
    private boolean isWalkIn;
    private Date pickup_date;
    private String status;

    public BorrowRecord() {

    }

    public BorrowRecord(int borrow_id, int member_id, int book_id, Date request_date, Date approval_date, Date due_date,
            Date return_date, boolean isWalkIn, Date pickup_date, String status) {
        this.borrow_id = borrow_id;
        this.member_id = member_id;
        this.book_id = book_id;
        this.request_date = request_date;
        this.approval_date = approval_date;
        this.due_date = due_date;
        this.return_date = return_date;
        this.isWalkIn = isWalkIn;
        this.pickup_date = pickup_date;
        this.status = status;
    }

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public int getMember_id() {
        return member_id;
    }

    public void setMember_id(int member_id) {
        this.member_id = member_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
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

    public boolean isWalkIn() {
        return isWalkIn;
    }

    public void setWalkIn(boolean walkIn) {
        isWalkIn = walkIn;
    }

    public Date getPickup_date() {
        return pickup_date;
    }

    public void setPickup_date(Date pickup_date) {
        this.pickup_date = pickup_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
