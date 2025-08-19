using System.ComponentModel.DataAnnotations.Schema;

namespace tourism_aspnet.Models;

public class Hotel
{
    public long Id { get; set; }
    public string? Name { get; set; }
    
    [ForeignKey("Country")]
    public long CountryId { get; set; }
    public Country? Country { get; set; }
}