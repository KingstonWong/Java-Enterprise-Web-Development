package Models;

import com.google.gson.annotations.SerializedName;

public class FineDTO {
    private int fine_id;
    private int borrow_id;

    @SerializedName("memberName")
    private String MemberName;

    @SerializedName("amount")
    private double Amount;

    @SerializedName("status")
    private String Status;

    @SerializedName("dueDate")
    private String DueDate;

    @SerializedName("returnDate")
    private String ReturnDate;

    @SerializedName("overdueDays")
    private int OverdueDays;

    public FineDTO() {
    }

    // Getters and Setters
    public int getFine_id() {
        return fine_id;
    }

    public void setFine_id(int fine_id) {
        this.fine_id = fine_id;
    }

    public int getBorrow_id() {
        return borrow_id;
    }

    public void setBorrow_id(int borrow_id) {
        this.borrow_id = borrow_id;
    }

    public String getMemberName() {
        return MemberName;
    }

    public void setMemberName(String MemberName) {
        this.MemberName = MemberName;
    }

    public double getAmount() {
        return Amount;
    }

    public void setAmount(double Amount) {
        this.Amount = Amount;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }

    public String getDueDate() {
        return DueDate;
    }

    public void setDueDate(String DueDate) {
        this.DueDate = DueDate;
    }

    public String getReturnDate() {
        return ReturnDate;
    }

    public void setReturnDate(String ReturnDate) {
        this.ReturnDate = ReturnDate;
    }

    public int getOverdueDays() {
        return OverdueDays;
    }

    public void setOverdueDays(int OverdueDays) {
        this.OverdueDays = OverdueDays;
    }
}
