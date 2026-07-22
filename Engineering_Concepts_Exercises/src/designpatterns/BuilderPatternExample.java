package designpatterns;

class Computer {
    private String CPU;
    private String RAM;

    private Computer(Builder builder) {
        this.CPU = builder.CPU;
        this.RAM = builder.RAM;
    }

    public static class Builder {
        private String CPU;
        private String RAM;

        public Builder setCPU(String cpu) { this.CPU = cpu; return this; }
        public Builder setRAM(String ram) { this.RAM = ram; return this; }
        public Computer build() { return new Computer(this); }
    }
    
    @Override
    public String toString() {
        return "Computer[CPU=" + CPU + ", RAM=" + RAM + "]";
    }
}

public class BuilderPatternExample {
    public static void main(String[] args) {
        Computer comp = new Computer.Builder().setCPU("Intel i9").setRAM("32GB").build();
        System.out.println(comp);
    }
}
