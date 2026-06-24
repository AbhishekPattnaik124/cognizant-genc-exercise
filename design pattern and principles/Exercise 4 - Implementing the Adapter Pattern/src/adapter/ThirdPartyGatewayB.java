package adapter;

public class ThirdPartyGatewayB {
    public void executeTransaction(double amount) {
        System.out.println("Gateway B processing transaction of $" + amount);
    }
}
