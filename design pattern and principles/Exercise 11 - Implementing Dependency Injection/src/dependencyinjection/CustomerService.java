package dependencyinjection;

public class CustomerService {
    private CustomerRepository repository;

    // Dependency Injection via constructor
    public CustomerService(CustomerRepository repository) {
        this.repository = repository;
    }

    public void getCustomerDetails(String id) {
        String customer = repository.findCustomerById(id);
        System.out.println("Found customer: " + customer);
    }
}
