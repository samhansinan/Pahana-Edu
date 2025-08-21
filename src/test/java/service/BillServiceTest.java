package service;
import dao.FakeBillDAO;
import model.Bill;
import model.BillItem;
import org.junit.Before;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;
public class BillServiceTest {
    private BillService billService;

    @Before
    public void setUp() {
        billService = new BillService(new FakeBillDAO());
    }

    @Test
    public void testCalculateBill() throws Exception {
        Bill bill = billService.calculateBill("ACC001", 5);
        System.out.println("Calculate Bill Total: " + (bill.getTotalAmount() == 50));
        assertEquals(50, bill.getTotalAmount(), 0);
        assertEquals(10, bill.getUnitsConsumed());
        assertEquals(5, bill.getRatePerUnit(), 0);
    }

    @Test
    public void testSaveBill() {
        Bill bill = new Bill();
        bill.setAccountNumber("ACC001");
        bill.setUnitsConsumed(10);
        bill.setRatePerUnit(5);
        bill.setTotalAmount(50);

        boolean saved = billService.saveBill(bill);
        System.out.println("Save Bill: " + saved);
        assertTrue(saved);
    }

    @Test
    public void testSaveBillWithItems() {
        List<BillItem> items = new ArrayList<>();
        BillItem item1 = new BillItem();
        item1.setItemName("Item1");
        item1.setUnits(2);
        item1.setPrice(10);
        item1.setSubtotal(20);

        BillItem item2 = new BillItem();
        item2.setItemName("Item2");
        item2.setUnits(3);
        item2.setPrice(15);
        item2.setSubtotal(45);

        items.add(item1);
        items.add(item2);

        Bill bill = billService.calculateBillFromItems("ACC001", items);

        boolean saved = billService.saveBillWithItems(bill);
        System.out.println("Save Bill With Items: " + saved);
        assertTrue(saved);
        assertEquals(5, bill.getUnitsConsumed());
        assertEquals(65, bill.getTotalAmount(), 0);
        assertEquals(13, bill.getRatePerUnit(), 0);
    }
}
