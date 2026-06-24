package search;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Product[] products = {
            new Product("P003", "Keyboard", "Electronics"),
            new Product("P001", "Laptop", "Electronics"),
            new Product("P004", "Monitor", "Electronics"),
            new Product("P002", "Mouse", "Electronics")
        };

        System.out.println("Linear Search for P004: " + SearchUtil.linearSearch(products, "P004"));

        // Binary search requires sorted array
        Arrays.sort(products);
        System.out.println("Binary Search for P002: " + SearchUtil.binarySearch(products, "P002"));
    }
}
