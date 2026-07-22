package designpatterns;

interface PaymentProcessor { void processPayment(); }
class PaypalGateway { void makePayment() { System.out.println("Paypal payment"); } }
class PaypalAdapter implements PaymentProcessor {
    private PaypalGateway gateway = new PaypalGateway();
    public void processPayment() { gateway.makePayment(); }
}

public class AdapterPatternExample {
    public static void main(String[] args) {
        PaymentProcessor processor = new PaypalAdapter();
        processor.processPayment();
    }
}
