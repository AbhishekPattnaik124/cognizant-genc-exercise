package algorithms;

import java.util.Arrays;

class EProduct {
    int productId;
    String productName;
    String category;

    public EProduct(int productId, String productName, String category) {
        this.productId = productId;
        this.productName = productName;
        this.category = category;
    }
}

public class SearchECommerce {
    public static EProduct linearSearch(EProduct[] products, int targetId) {
        for (EProduct p : products) {
            if (p.productId == targetId) return p;
        }
        return null;
    }

    public static EProduct binarySearch(EProduct[] products, int targetId) {
        int left = 0, right = products.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (products[mid].productId == targetId) return products[mid];
            if (products[mid].productId < targetId) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }
}
