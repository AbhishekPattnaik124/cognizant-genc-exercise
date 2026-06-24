package singleton;

public class SingletonTest {
    public static void main(String[] args) {
        Logger logger1 = Logger.getInstance();
        Logger logger2 = Logger.getInstance();

        logger1.log("This is the first log message.");
        logger2.log("This is the second log message.");

        if (logger1 == logger2) {
            System.out.println("Singleton pattern successfully implemented: Both instances are the same.");
        } else {
            System.out.println("Singleton pattern failed: Instances are different.");
        }
    }
}
