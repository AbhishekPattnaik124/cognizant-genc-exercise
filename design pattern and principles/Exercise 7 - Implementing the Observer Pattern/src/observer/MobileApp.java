package observer;

public class MobileApp implements Observer {
    @Override
    public void update(double stockPrice) {
        System.out.println("MobileApp notified. New stock price: $" + stockPrice);
    }
}
