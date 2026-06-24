package builder;

public class BuilderTest {
    public static void main(String[] args) {
        Computer myComputer = new Computer.Builder()
                .setCPU("Intel i9")
                .setRAM("32GB")
                .setStorage("1TB SSD")
                .build();
        
        System.out.println("Built computer: " + myComputer);
    }
}
