package dependencyinjection;

public class CustomerRepositoryImpl implements CustomerRepository {
    @Override
    public String findCustomerById(String id) {
        // Mock data retrieval
        return "Customer_" + id;
    }
}
