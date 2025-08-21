package dao;

import model.Bill;

public class FakeBillDAO extends BillDAO {
    @Override
    public int getUnitsConsumed(String accountNumber) {
        // Return fake units consumed
        if ("ACC001".equals(accountNumber)) {
            return 10;
        }
        return 0;
    }

    @Override
    public boolean addBill(Bill bill) {
        // Always succeed
        return true;
    }

    @Override
    public boolean saveBillWithItems(Bill bill) {
        // Always succeed
        return true;
    }

}
