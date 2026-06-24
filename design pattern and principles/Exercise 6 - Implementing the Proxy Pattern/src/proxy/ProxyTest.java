package proxy;

public class ProxyTest {
    public static void main(String[] args) {
        Image image = new ProxyImage("test_image.jpg");

        // First call loads from server
        image.display();

        System.out.println("");

        // Second call uses cached instance
        image.display();
    }
}
