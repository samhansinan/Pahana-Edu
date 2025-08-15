package service;

import dao.ItemDAO;
import model.Item;

import java.util.List;

public class ItemService {
    private ItemDAO itemDAO;

    public ItemService() {
        this.itemDAO = new ItemDAO();
    }

    // Add item with business logic
    public String addItem(Item item) {
        if (item.getName() == null || item.getName().isEmpty()) {
            return "Item name cannot be empty.";
        }
        if (item.getPrice() < 0 || item.getQuantity() < 0) {
            return "Price and quantity must be positive.";
        }

        boolean success = itemDAO.addItem(item);
        return success ? "Item added successfully." : "Failed to add item.";
    }

    // Optional: get all items
    public List<Item> getAllItems() throws Exception {
        return itemDAO.getAllItem();
    }
}
