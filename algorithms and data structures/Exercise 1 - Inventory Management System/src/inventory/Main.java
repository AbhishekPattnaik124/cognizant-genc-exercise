package inventory;

public class Main {
    public static void main(String[] args) {
        Inventory inv = new Inventory();
        
        Product p1 = new Product("P001", "Laptop", 10, 999.99);
        Product p2 = new Product("P002", "Mouse", 50, 19.99);
        
        inv.addProduct(p1);
        inv.addProduct(p2);
        
        inv.updateProduct("P001", 8, 950.00);
        inv.deleteProduct("P002");
    }
}
