package adapter;

public class AdapterTest {
    public static void main(String[] args) {
        PaymentProcessor processorA = new GatewayAdapterA(new ThirdPartyGatewayA());
        processorA.processPayment(150.00);

        PaymentProcessor processorB = new GatewayAdapterB(new ThirdPartyGatewayB());
        processorB.processPayment(300.50);
    }
}
