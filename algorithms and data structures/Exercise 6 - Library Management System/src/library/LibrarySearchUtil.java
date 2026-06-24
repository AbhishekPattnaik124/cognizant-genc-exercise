package library;

public class LibrarySearchUtil {
    // Linear Search: O(n)
    public static Book linearSearch(Book[] books, String title) {
        for (Book b : books) {
            if (b.getTitle().equalsIgnoreCase(title)) {
                return b;
            }
        }
        return null;
    }

    // Binary Search: O(log n)
    public static Book binarySearch(Book[] books, String title) {
        int left = 0;
        int right = books.length - 1;

        while (left <= right) {
            int mid = left + (right - left) / 2;
            int comparison = books[mid].getTitle().compareToIgnoreCase(title);

            if (comparison == 0) return books[mid];
            if (comparison < 0) left = mid + 1;
            else right = mid - 1;
        }
        return null;
    }
}
