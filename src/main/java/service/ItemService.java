package service;

import dao.ItemDAO;
import model.Item;

import java.util.List;

public class ItemService {
    private ItemDAO itemDAO;

    public ItemService() {
        this.itemDAO = new ItemDAO();
    }

    // Constructor for testing (inject fake DAO)
    public ItemService(ItemDAO itemDAO) {
        this.itemDAO = itemDAO;
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

    // Get all items
    public List<Item> getAllItems() throws Exception {
        return itemDAO.getAllItem();
    }

    // Update item
    public void updateItem(Item item) throws Exception {
        itemDAO.updateItem(item);
    }

    // Get item by ID
    public Item getItemById(String itemId) throws Exception {
        return itemDAO.getItemId(itemId);
    }

    // Delete item by ID
    public void deleteItemById(String itemId) throws Exception {
        itemDAO.deleteItem(itemId);
    }
}
