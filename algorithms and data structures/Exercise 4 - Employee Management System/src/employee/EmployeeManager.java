package employee;

public class EmployeeManager {
    private Employee[] employees;
    private int size;

    public EmployeeManager(int capacity) {
        employees = new Employee[capacity];
        size = 0;
    }

    // Add: O(1) if not full
    public void addEmployee(Employee emp) {
        if (size < employees.length) {
            employees[size++] = emp;
        } else {
            System.out.println("Array is full");
        }
    }

    // Search: O(n)
    public Employee searchEmployee(String id) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(id)) {
                return employees[i];
            }
        }
        return null;
    }

    // Traverse: O(n)
    public void traverse() {
        for (int i = 0; i < size; i++) {
            System.out.println(employees[i]);
        }
    }

    // Delete: O(n)
    public void deleteEmployee(String id) {
        for (int i = 0; i < size; i++) {
            if (employees[i].getEmployeeId().equals(id)) {
                // Shift elements
                for (int j = i; j < size - 1; j++) {
                    employees[j] = employees[j + 1];
                }
                employees[--size] = null;
                System.out.println("Deleted Employee " + id);
                return;
            }
        }
        System.out.println("Employee not found");
    }
}
