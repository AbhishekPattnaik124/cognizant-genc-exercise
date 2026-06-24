package dependencyinjection;

public class DITest {
    public static void main(String[] args) {
        CustomerRepository repository = new CustomerRepositoryImpl();
        CustomerService service = new CustomerService(repository);
        
        service.getCustomerDetails("1001");
    }
}
