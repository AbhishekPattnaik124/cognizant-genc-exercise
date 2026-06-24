package library;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        Book[] books = {
            new Book("B1", "The Great Gatsby", "F. Scott Fitzgerald"),
            new Book("B2", "1984", "George Orwell"),
            new Book("B3", "To Kill a Mockingbird", "Harper Lee")
        };

        System.out.println("Linear Search '1984': " + LibrarySearchUtil.linearSearch(books, "1984"));

        Arrays.sort(books);
        System.out.println("Binary Search '1984': " + LibrarySearchUtil.binarySearch(books, "1984"));
    }
}
