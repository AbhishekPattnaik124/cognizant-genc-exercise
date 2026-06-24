package observer;

public class WebApp implements Observer {
    @Override
    public void update(double stockPrice) {
        System.out.println("WebApp notified. New stock price: $" + stockPrice);
    }
}
