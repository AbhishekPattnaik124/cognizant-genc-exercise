package task;

public class SinglyLinkedList {
    private class Node {
        Task task;
        Node next;
        Node(Task t) { this.task = t; this.next = null; }
    }

    private Node head;

    // Add: O(n) to end, or O(1) to head
    public void addTask(Task t) {
        Node newNode = new Node(t);
        if (head == null) {
            head = newNode;
        } else {
            Node temp = head;
            while (temp.next != null) {
                temp = temp.next;
            }
            temp.next = newNode;
        }
    }

    // Search: O(n)
    public Task searchTask(String taskId) {
        Node temp = head;
        while (temp != null) {
            if (temp.task.getTaskId().equals(taskId)) return temp.task;
            temp = temp.next;
        }
        return null;
    }

    // Traverse: O(n)
    public void traverse() {
        Node temp = head;
        while (temp != null) {
            System.out.println(temp.task);
            temp = temp.next;
        }
    }

    // Delete: O(n)
    public void deleteTask(String taskId) {
        if (head == null) return;
        if (head.task.getTaskId().equals(taskId)) {
            head = head.next;
            System.out.println("Deleted Task " + taskId);
            return;
        }
        Node temp = head;
        while (temp.next != null && !temp.next.task.getTaskId().equals(taskId)) {
            temp = temp.next;
        }
        if (temp.next != null) {
            temp.next = temp.next.next;
            System.out.println("Deleted Task " + taskId);
        } else {
            System.out.println("Task not found");
        }
    }
}
