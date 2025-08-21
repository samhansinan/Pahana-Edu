package service;

import dao.CustomerDAO;
import model.BillItem;
import model.Customer;

import java.util.List;

public class CustomerService {
    private CustomerDAO customerDAO;

    // Production constructor (uses real DAO)
    public CustomerService() {
        this.customerDAO = new CustomerDAO();
    }

    // Constructor for testing (inject a fake DAO)
    public CustomerService(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    // Add new customer with validation
    public String addCustomer(Customer customer) {
        if (customer.getAccountNumber() == null || customer.getAccountNumber().isEmpty()) {
            return "Account number cannot be empty.";
        }
        if (customer.getName() == null || customer.getName().isEmpty()) {
            return "Customer name cannot be empty.";
        }
        if (customer.getUnitsConsumed() < 0) {
            return "Units consumed cannot be negative.";
        }

        try {
            if (customerDAO.accountExists(customer.getAccountNumber())) {
                return "Account number already exists.";
            }
            customerDAO.addCustomer(customer);
            return "Customer added successfully.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to add customer: " + e.getMessage();
        }
    }

    // Get all customers
    public List<Customer> getAllCustomers() {
        try {
            return customerDAO.getAllCustomers();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Get customer by account number
    public Customer getCustomerByAccount(String accountNumber) {
        try {
            return customerDAO.getCustomerByAccount(accountNumber);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // Update customer details
    public String updateCustomer(Customer customer) {
        if (customer.getName() == null || customer.getName().isEmpty()) {
            return "Customer name cannot be empty.";
        }
        if (customer.getUnitsConsumed() < 0) {
            return "Units consumed cannot be negative.";
        }

        try {
            customerDAO.updateCustomer(customer);
            return "Customer updated successfully.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to update customer: " + e.getMessage();
        }
    }

    // Delete customer
    public String deleteCustomer(String accountNumber) {
        try {
            customerDAO.deleteCustomer(accountNumber);
            return "Customer deleted successfully.";
        } catch (Exception e) {
            e.printStackTrace();
            return "Failed to delete customer: " + e.getMessage();
        }
    }

    // Get purchased items by account number
    public List<BillItem> getPurchasedItemsByAccount(String accountNumber) {
        try {
            return customerDAO.getPurchasedItemsByAccount(accountNumber);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
