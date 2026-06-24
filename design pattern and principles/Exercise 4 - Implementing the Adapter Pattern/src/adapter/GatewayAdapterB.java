package adapter;

public class GatewayAdapterB implements PaymentProcessor {
    private ThirdPartyGatewayB gatewayB;

    public GatewayAdapterB(ThirdPartyGatewayB gatewayB) {
        this.gatewayB = gatewayB;
    }

    @Override
    public void processPayment(double amount) {
        gatewayB.executeTransaction(amount);
    }
}
