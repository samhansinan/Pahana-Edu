package dao;

import model.Item;

import java.util.ArrayList;
import java.util.List;

public class FakeItemDAO extends ItemDAO {
    private List<Item> items = new ArrayList<>();

    @Override
    public boolean addItem(Item item) {
        // Check duplicate by name
        for (Item i : items) {
            if (i.getName().equals(item.getName())) return false;
        }
        items.add(item);
        return true;
    }

    @Override
    public List<Item> getAllItem() {
        return items;
    }

    @Override
    public void updateItem(Item item) {
        for (Item i : items) {
            if (i.getItemId() == item.getItemId()) {
                i.setName(item.getName());
                i.setPrice(item.getPrice());
                i.setQuantity(item.getQuantity());
            }
        }
    }

    @Override
    public Item getItemId(String itemId) {
        int id = Integer.parseInt(itemId);
        for (Item i : items) {
            if (i.getItemId() == id) return i;
        }
        return null;
    }

    @Override
    public void deleteItem(String itemId) {
        int id = Integer.parseInt(itemId);
        items.removeIf(i -> i.getItemId() == id);
    }

}
