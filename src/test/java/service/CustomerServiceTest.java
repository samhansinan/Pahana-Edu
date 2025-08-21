package service;

import dao.FakeCustomerDAO;
import model.Customer;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;
public class CustomerServiceTest {
    private CustomerService customerService;

    @Before
    public void setUp() {
        // Inject the Fake DAO into the service
        customerService = new CustomerService(new FakeCustomerDAO());
    }

    @Test
    public void testAddCustomerSuccess() {
        Customer customer = new Customer();
        customer.setAccountNumber("ACC001");
        customer.setName("John Doe");
        customer.setUnitsConsumed(10);

        String result = customerService.addCustomer(customer);
        boolean testPassed = result.equals("Customer added successfully.");
        System.out.println("Add Customer Result: " + testPassed);

        assertEquals("Customer added successfully.", result);
    }

    @Test
    public void testAddCustomerEmptyName() {
        Customer customer = new Customer();
        customer.setAccountNumber("ACC002");
        customer.setName("");
        customer.setUnitsConsumed(5);

        String result = customerService.addCustomer(customer);
        boolean testPassed = result.equals("Customer name cannot be empty.");
        System.out.println("Add Customer Empty Name Result: " + testPassed);

        assertEquals("Customer name cannot be empty.", result);
    }

    @Test
    public void testAddCustomerDuplicateAccount() {
        Customer customer1 = new Customer();
        customer1.setAccountNumber("ACC003");
        customer1.setName("Alice");
        customer1.setUnitsConsumed(5);
        customerService.addCustomer(customer1);

        Customer customer2 = new Customer();
        customer2.setAccountNumber("ACC003");
        customer2.setName("Bob");
        customer2.setUnitsConsumed(8);

        String result = customerService.addCustomer(customer2);
        boolean testPassed = result.equals("Account number already exists.");
        System.out.println("Add Customer Duplicate Account Result: " + testPassed);

        assertEquals("Account number already exists.", result);
    }

    @Test
    public void testGetAllCustomers() {
        Customer customer = new Customer();
        customer.setAccountNumber("ACC004");
        customer.setName("Charlie");
        customer.setUnitsConsumed(12);
        customerService.addCustomer(customer);

        List<Customer> list = customerService.getAllCustomers();
        boolean testPassed = list.size() == 1;
        System.out.println("Get All Customers Result: " + testPassed);

        assertEquals(1, list.size());
    }

    @Test
    public void testUpdateCustomer() {
        Customer customer = new Customer();
        customer.setAccountNumber("ACC005");
        customer.setName("David");
        customer.setUnitsConsumed(7);
        customerService.addCustomer(customer);

        customer.setName("David Updated");
        customer.setUnitsConsumed(15);
        String result = customerService.updateCustomer(customer);
        boolean testPassed = result.equals("Customer updated successfully.");
        System.out.println("Update Customer Result: " + testPassed);

        assertEquals("Customer updated successfully.", result);

        Customer updated = customerService.getCustomerByAccount("ACC005");
        assertEquals("David Updated", updated.getName());
        assertEquals(15, updated.getUnitsConsumed());
    }

    @Test
    public void testDeleteCustomer() {
        Customer customer = new Customer();
        customer.setAccountNumber("ACC006");
        customer.setName("Eve");
        customer.setUnitsConsumed(9);
        customerService.addCustomer(customer);

        String result = customerService.deleteCustomer("ACC006");
        boolean testPassed = result.equals("Customer deleted successfully.");
        System.out.println("Delete Customer Result: " + testPassed);

        assertEquals("Customer deleted successfully.", result);

        Customer deleted = customerService.getCustomerByAccount("ACC006");
        assertNull(deleted);
    }
}
