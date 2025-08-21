package service;

import dao.BillDAO;


import model.Bill;
import model.BillItem;

import java.util.List;


public class BillService {
    private BillDAO billDAO;

    public BillService() {
        this.billDAO = new BillDAO();
    }

    public BillService(BillDAO billDAO) {
        this.billDAO = billDAO;
    }

    public Bill calculateBill(String accountNumber, double ratePerUnit) throws Exception {
        int unitsConsumed = billDAO.getUnitsConsumed(accountNumber);
        double total = unitsConsumed * ratePerUnit;

        Bill bill = new Bill();
        bill.setAccountNumber(accountNumber);
        bill.setUnitsConsumed(unitsConsumed);
        bill.setRatePerUnit(ratePerUnit);
        bill.setTotalAmount(total);

        return bill;
    }

    public boolean saveBill(Bill bill) {
        return billDAO.addBill(bill);
    }

    public boolean saveBillWithItems(Bill bill) {
        return billDAO.saveBillWithItems(bill);
    }

    public Bill calculateBillFromItems(String accountNumber, List<BillItem> items) {
        Bill bill = new Bill();
        bill.setAccountNumber(accountNumber);
        bill.setItems(items);

        int totalUnits = 0;
        double totalAmount = 0;

        for (BillItem item : items) {
            totalUnits += item.getUnits();
            totalAmount += item.getSubtotal();
        }

        bill.setUnitsConsumed(totalUnits);
        bill.setTotalAmount(totalAmount);
        bill.setRatePerUnit(totalUnits > 0 ? totalAmount / totalUnits : 0);

        return bill;
    }
}
