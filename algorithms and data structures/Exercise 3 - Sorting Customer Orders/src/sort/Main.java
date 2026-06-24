package sort;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Order[] ordersForBubble = {
            new Order("O1", "Alice", 250.0),
            new Order("O2", "Bob", 150.0),
            new Order("O3", "Charlie", 300.0)
        };
        
        Order[] ordersForQuick = Arrays.copyOf(ordersForBubble, ordersForBubble.length);

        SortUtil.bubbleSort(ordersForBubble);
        System.out.println("Bubble Sorted:");
        for(Order o : ordersForBubble) System.out.println(o);

        SortUtil.quickSort(ordersForQuick, 0, ordersForQuick.length - 1);
        System.out.println("\nQuick Sorted:");
        for(Order o : ordersForQuick) System.out.println(o);
    }
}
