public class Circle : Figure {
    private double radius;
    public Circle(double radius) {
        this.radius = radius;
    }
    public override string Name => "Окружность";
    public override double GetArea(){
        return Math.PI * radius * radius;
    }
    public override double GetPerimeter(){
        return 2.0 * Math.PI * radius;
    }
}