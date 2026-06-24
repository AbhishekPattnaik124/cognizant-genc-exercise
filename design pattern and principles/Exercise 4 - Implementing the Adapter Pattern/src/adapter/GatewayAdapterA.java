package adapter;

public class GatewayAdapterA implements PaymentProcessor {
    private ThirdPartyGatewayA gatewayA;

    public GatewayAdapterA(ThirdPartyGatewayA gatewayA) {
        this.gatewayA = gatewayA;
    }

    @Override
    public void processPayment(double amount) {
        gatewayA.makePayment(amount);
    }
}
