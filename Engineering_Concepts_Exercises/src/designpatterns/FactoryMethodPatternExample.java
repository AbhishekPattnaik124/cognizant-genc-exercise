package designpatterns;

interface Document { void open(); }
class WordDocument implements Document { public void open() { System.out.println("Word"); } }
class PdfDocument implements Document { public void open() { System.out.println("PDF"); } }
class ExcelDocument implements Document { public void open() { System.out.println("Excel"); } }

abstract class DocumentFactory {
    public abstract Document createDocument(String type);
}

class ConcreteDocumentFactory extends DocumentFactory {
    public Document createDocument(String type) {
        if(type.equals("Word")) return new WordDocument();
        else if(type.equals("Pdf")) return new PdfDocument();
        else if(type.equals("Excel")) return new ExcelDocument();
        return null;
    }
}

public class FactoryMethodPatternExample {
    public static void main(String[] args) {
        DocumentFactory factory = new ConcreteDocumentFactory();
        Document doc = factory.createDocument("Pdf");
        doc.open();
    }
}
