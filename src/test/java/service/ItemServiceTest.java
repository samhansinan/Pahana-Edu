package service;
import java.util.List;
import dao.FakeItemDAO;
import model.Item;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;
public class ItemServiceTest {
    private ItemService itemService;

    @Before
    public void setUp() {
        itemService = new ItemService(new FakeItemDAO());
    }

    @Test
    public void testAddItemSuccess() {
        Item item = new Item("Laptop", 1200.50, 5);
        String result = itemService.addItem(item);
        System.out.println("Add Item Success: " + result.equals("Item added successfully."));
        assertEquals("Item added successfully.", result);
    }

    @Test
    public void testAddItemEmptyName() {
        Item item = new Item("", 500, 3);
        String result = itemService.addItem(item);
        System.out.println("Add Item Empty Name: " + result.equals("Item name cannot be empty."));
        assertEquals("Item name cannot be empty.", result);
    }

    @Test
    public void testAddItemNegativeValues() {
        Item item = new Item("Phone", -100, -5);
        String result = itemService.addItem(item);
        System.out.println("Add Item Negative Values: " + result.equals("Price and quantity must be positive."));
        assertEquals("Price and quantity must be positive.", result);
    }

    @Test
    public void testGetAllItems() throws Exception {
        Item item = new Item("Tablet", 300, 2);
        itemService.addItem(item);

        List<Item> list = itemService.getAllItems();
        System.out.println("Get All Items: " + (list.size() == 1));
        assertEquals(1, list.size());
    }

    @Test
    public void testUpdateItem() throws Exception {
        Item item = new Item("Monitor", 150, 4);
        item.setItemId(1);
        itemService.addItem(item);

        item.setName("Monitor Updated");
        item.setPrice(200);
        item.setQuantity(10);
        itemService.updateItem(item);

        Item updated = itemService.getItemById("1");
        boolean passed = updated.getName().equals("Monitor Updated") &&
                updated.getPrice() == 200 &&
                updated.getQuantity() == 10;
        System.out.println("Update Item: " + passed);

        assertEquals("Monitor Updated", updated.getName());
        assertEquals(200, updated.getPrice(), 0);
        assertEquals(10, updated.getQuantity());
    }

    @Test
    public void testDeleteItem() throws Exception {
        Item item = new Item("Keyboard", 50, 7);
        item.setItemId(2);
        itemService.addItem(item);

        itemService.deleteItemById("2");
        Item deleted = itemService.getItemById("2");
        System.out.println("Delete Item: " + (deleted == null));

        assertNull(deleted);
    }
}
