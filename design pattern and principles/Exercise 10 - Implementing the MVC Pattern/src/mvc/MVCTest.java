package mvc;

public class MVCTest {
    public static void main(String[] args) {
        Student model = new Student("1", "John Doe", "A");
        StudentView view = new StudentView();
        
        StudentController controller = new StudentController(model, view);
        
        System.out.println("Initial Details:");
        controller.updateView();
        
        controller.setStudentName("John Doe Jr.");
        controller.setStudentGrade("A+");
        
        System.out.println("\nUpdated Details:");
        controller.updateView();
    }
}
