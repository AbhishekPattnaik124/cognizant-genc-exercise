package inventory;
import java.util.HashMap;

public class Inventory {
    // HashMap provides O(1) average time complexity for add, update, and delete
    private HashMap<String, Product> products = new HashMap<>();

    public void addProduct(Product product) {
        products.put(product.getProductId(), product);
        System.out.println("Added: " + product);
    }

    public void updateProduct(String productId, int newQuantity, double newPrice) {
        if (products.containsKey(productId)) {
            Product p = products.get(productId);
            p.setQuantity(newQuantity);
            p.setPrice(newPrice);
            System.out.println("Updated: " + p);
        } else {
            System.out.println("Product not found: " + productId);
        }
    }

    public void deleteProduct(String productId) {
        if (products.remove(productId) != null) {
            System.out.println("Deleted Product ID: " + productId);
        } else {
            System.out.println("Product not found: " + productId);
        }
    }
}
