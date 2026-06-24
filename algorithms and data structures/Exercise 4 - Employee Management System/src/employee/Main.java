package employee;

public class Main {
    public static void main(String[] args) {
        EmployeeManager em = new EmployeeManager(5);
        em.addEmployee(new Employee("E01", "John", "Dev", 60000));
        em.addEmployee(new Employee("E02", "Jane", "Manager", 80000));
        
        System.out.println("Traversing:");
        em.traverse();

        System.out.println("\nSearching for E02: " + em.searchEmployee("E02"));

        em.deleteEmployee("E01");
        System.out.println("\nAfter Deletion:");
        em.traverse();
    }
}
