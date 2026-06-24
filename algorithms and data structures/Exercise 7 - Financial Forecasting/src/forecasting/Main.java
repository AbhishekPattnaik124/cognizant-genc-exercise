package forecasting;

public class Main {
    public static void main(String[] args) {
        double presentValue = 1000.0;
        double growthRate = 0.05; // 5% growth
        int periods = 10; // 10 years

        double futureValue = ForecastingUtil.predictFutureValue(presentValue, growthRate, periods);
        
        System.out.printf("Future Value after %d periods: $%.2f\n", periods, futureValue);
    }
}
