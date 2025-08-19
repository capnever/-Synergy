
List<Figure> figures = new List<Figure>{
    new Triangle(4),
    new Triangle(3,4,5),
    new Square(4),
    new Circle(4)
};

foreach (var figure in figures){
    Console.WriteLine($"Фигура: {figure.Name}");
    Console.WriteLine($"Площадь: {figure.GetArea():F2}");
    var perimimeter = figure is Circle ? "Длинна окружности" : "Периметр";
    Console.WriteLine($"{perimimeter}: {figure.GetPerimeter():F2} \n");
}

Geometry g = new();
Square s = new(4);
Triangle t = new(4);

g.Show();
s.Show();
t.Show();
