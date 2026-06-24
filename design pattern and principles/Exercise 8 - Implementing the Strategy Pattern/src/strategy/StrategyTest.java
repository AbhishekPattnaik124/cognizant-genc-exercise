package strategy;

public class StrategyTest {
    public static void main(String[] args) {
        PaymentContext context = new PaymentContext();

        context.setPaymentStrategy(new CreditCardPayment());
        context.executePayment(250.00);

        context.setPaymentStrategy(new PayPalPayment());
        context.executePayment(50.00);
    }
}
