package service;

import dao.BillDAO;


import model.Bill;



public class BillService {
    private BillDAO billDAO = new BillDAO();

    // Calculate bill by fetching units consumed automatically
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

    // Save bill in DB
    public boolean saveBill(Bill bill) {
        return billDAO.addBill(bill);
    }
}
