package observer;

public class ObserverTest {
    public static void main(String[] args) {
        StockMarket appleStock = new StockMarket();

        Observer mobileApp = new MobileApp();
        Observer webApp = new WebApp();

        appleStock.register(mobileApp);
        appleStock.register(webApp);

        System.out.println("Setting stock price to .00:");
        appleStock.setStockPrice(150.00);

        appleStock.deregister(mobileApp);

        System.out.println("\nSetting stock price to .00:");
        appleStock.setStockPrice(155.00);
    }
}
