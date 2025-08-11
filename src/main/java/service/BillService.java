package service;

import dao.BillDAO;


import model.Bill;
import model.BillItem;

import java.util.List;


public class BillService {
    private BillDAO billDAO = new BillDAO();

    // Existing method to calculate a simple bill by fetching units consumed
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

    // Existing method to save simple bill
    public boolean saveBill(Bill bill) {
        return billDAO.addBill(bill);
    }

    // New method: Save bill along with its items (multiple items)
    public boolean saveBillWithItems(Bill bill) {
        return billDAO.saveBillWithItems(bill);
    }

    // Optional: Calculate bill total from list of items
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

        // Rate per unit is average price per unit across all items
        bill.setRatePerUnit(totalUnits > 0 ? totalAmount / totalUnits : 0);

        return bill;
    }
}
