package model;

import java.util.Date;
import java.util.List;

public class Bill {
    private int billId;
    private String accountNumber;
    private int unitsConsumed;
    private double ratePerUnit;
    private double totalAmount;
    private Date billDate;

    // New: List of items in the bill
    private List<BillItem> items;

    public Bill() {}

    public Bill(String accountNumber, int unitsConsumed, double ratePerUnit, double totalAmount, Date billDate, List<BillItem> items) {
        this.accountNumber = accountNumber;
        this.unitsConsumed = unitsConsumed;
        this.ratePerUnit = ratePerUnit;
        this.totalAmount = totalAmount;
        this.billDate = billDate;
        this.items = items;
    }

    // Existing getters/setters...

    public int getBillId() {
        return billId;
    }

    public void setBillId(int billId) {
        this.billId = billId;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public int getUnitsConsumed() {
        return unitsConsumed;
    }

    public void setUnitsConsumed(int unitsConsumed) {
        this.unitsConsumed = unitsConsumed;
    }

    public double getRatePerUnit() {
        return ratePerUnit;
    }

    public void setRatePerUnit(double ratePerUnit) {
        this.ratePerUnit = ratePerUnit;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public Date getBillDate() {
        return billDate;
    }

    public void setBillDate(Date billDate) {
        this.billDate = billDate;
    }

    // New getters/setters for items
    public List<BillItem> getItems() {
        return items;
    }

    public void setItems(List<BillItem> items) {
        this.items = items;
    }
}
