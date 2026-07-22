package algorithms;
import java.util.HashMap;

class Product {
    int productId;
    String productName;
    int quantity;
    double price;

    public Product(int productId, String productName, int quantity, double price) {
        this.productId = productId;
        this.productName = productName;
        this.quantity = quantity;
        this.price = price;
    }
}

public class InventorySystem {
    private HashMap<Integer, Product> inventory = new HashMap<>();

    public void addProduct(Product p) { inventory.put(p.productId, p); }
    public void updateProduct(Product p) { inventory.put(p.productId, p); }
    public void deleteProduct(int productId) { inventory.remove(productId); }

    public static void main(String[] args) {
        System.out.println("Inventory system initialized.");
    }
}
