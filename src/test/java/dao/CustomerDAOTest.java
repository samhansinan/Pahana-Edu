package dao;

import model.Customer;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;
public class CustomerDAOTest {
    @Test
    public void testAddAndGetCustomer() throws Exception {
        CustomerDAO dao = new CustomerDAO();
        Customer customer = new Customer();
        customer.setAccountNumber("DB001");
        customer.setName("Test User");
        customer.setUnitsConsumed(15);
        dao.addCustomer(customer);

        Customer fromDB = dao.getCustomerByAccount("DB001");
        assertNotNull(fromDB);
        assertEquals("Test User", fromDB.getName());

        dao.deleteCustomer("DB001"); // cleanup
    }

    @Test
    public void testGetAllCustomers() throws Exception {
        CustomerDAO dao = new CustomerDAO();
        List<Customer> customers = dao.getAllCustomers();
        assertNotNull(customers);
    }
}
