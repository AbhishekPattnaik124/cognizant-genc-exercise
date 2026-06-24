package forecasting;

public class ForecastingUtil {
    
    // Recursive calculation: FV = PV * (1 + rate)^periods
    // We can recursively calculate this by multiplying the previous period's value by (1 + rate)
    public static double predictFutureValue(double currentValue, double growthRate, int periods) {
        if (periods == 0) {
            return currentValue;
        }
        return predictFutureValue(currentValue * (1 + growthRate), growthRate, periods - 1);
    }
}
