namespace tourism_aspnet.Models;

public class Country
{
    public long Id { get; set; }
    public string? Name { get; set; }
    public bool Visa { get; set; }
    public List<Hotel> Hotels { get; set; } = new();
}