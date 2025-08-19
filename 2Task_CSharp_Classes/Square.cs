public class Square : Figure {
    private double side;
    public Square(double side) {
        this.side = side;
    }
    public override string Name => "Квадрат";
    public override double GetArea(){
        return side*side;
    }
    public override double GetPerimeter(){
        return 4*side;
    }
    public override void Show(){
        Console.WriteLine("This method from child class");
    }
}