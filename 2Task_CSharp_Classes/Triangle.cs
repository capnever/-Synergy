public class Triangle : Figure {
    private double A;
    private double B;
    private double C;

    public Triangle(double side){
        A = side;
        B = side;
        C = side;
    }
    public Triangle(double A,double B,double C){

        if (!(A+B>C) || !(A+C>B) || !(B+C>A)) {
            throw new ArgumentException("This triangle is not valid");
        }
        this.A = A;
        this.B = B;
        this.C = C;
    }

    public override string Name => "Треугольник";
    public override double GetArea(){
        var sp = (A+B+C)/2;
        return Math.Sqrt(sp*(sp-A)*(sp-B)*(sp-C));
    }
    public override double GetPerimeter(){
        return A + B + C;
    }
}