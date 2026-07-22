package designpatterns;

interface Notifier { void send(String msg); }
class EmailNotifier implements Notifier { public void send(String msg) { System.out.println("Email: " + msg); } }

abstract class NotifierDecorator implements Notifier {
    protected Notifier notifier;
    public NotifierDecorator(Notifier n) { this.notifier = n; }
    public void send(String msg) { notifier.send(msg); }
}

class SMSNotifierDecorator extends NotifierDecorator {
    public SMSNotifierDecorator(Notifier n) { super(n); }
    public void send(String msg) { super.send(msg); System.out.println("SMS: " + msg); }
}

public class DecoratorPatternExample {
    public static void main(String[] args) {
        Notifier notifier = new SMSNotifierDecorator(new EmailNotifier());
        notifier.send("Hello World");
    }
}
