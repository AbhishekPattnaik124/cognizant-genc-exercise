package task;

public class Main {
    public static void main(String[] args) {
        SinglyLinkedList list = new SinglyLinkedList();
        list.addTask(new Task("T1", "Setup DB", "Pending"));
        list.addTask(new Task("T2", "Create API", "In Progress"));
        
        System.out.println("Traversing List:");
        list.traverse();

        System.out.println("\nSearch T2: " + list.searchTask("T2"));

        list.deleteTask("T1");
        System.out.println("\nAfter Deletion:");
        list.traverse();
    }
}
