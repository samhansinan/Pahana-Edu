package dao;

import model.BillItem;
import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class FakeCustomerDAO extends CustomerDAO {
    private List<Customer> customers = new ArrayList<>();

    @Override
    public void addCustomer(Customer customer) {
        customers.add(customer);
    }

    @Override
    public boolean accountExists(String accountNumber) {
        return customers.stream()
                .anyMatch(c -> c.getAccountNumber().equals(accountNumber));
    }

    @Override
    public List<Customer> getAllCustomers() {
        return customers;
    }

    @Override
    public Customer getCustomerByAccount(String accountNumber) {
        return customers.stream()
                .filter(c -> c.getAccountNumber().equals(accountNumber))
                .findFirst()
                .orElse(null);
    }

    @Override
    public void updateCustomer(Customer customer) {
        Customer existing = getCustomerByAccount(customer.getAccountNumber());
        if (existing != null) {
            existing.setName(customer.getName());
            existing.setAddress(customer.getAddress());
            existing.setTelephone(customer.getTelephone());
            existing.setUnitsConsumed(customer.getUnitsConsumed());
        }
    }

    @Override
    public void deleteCustomer(String accountNumber) {
        customers.removeIf(c -> c.getAccountNumber().equals(accountNumber));
    }

    @Override
    public List<BillItem> getPurchasedItemsByAccount(String accountNumber) {
        return new ArrayList<>(); // empty for testing
    }
}
