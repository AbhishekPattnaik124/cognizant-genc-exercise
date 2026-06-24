package search;

public class SearchUtil {
    
    // Linear Search: O(n)
    public static Product linearSearch(Product[] arr, String targetId) {
        for (Product p : arr) {
            if (p.getProductId().equals(targetId)) {
                return p;
            }
        }
        return null;
    }

    // Binary Search: O(log n). Requires sorted array
    public static Product binarySearch(Product[] arr, String targetId) {
        int left = 0;
        int right = arr.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = arr[mid].getProductId().compareTo(targetId);

            if (comparison == 0) return arr[mid];
            if (comparison < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }
}
