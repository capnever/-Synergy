using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using tourism_aspnet.Models;

namespace tourism_aspnet.Controllers;

[Route("[controller]")]
[ApiController]
public class HotelsController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public HotelsController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet("{countryId}")]
    public async Task<ActionResult<IEnumerable<Hotel>>> GetHotelsByCountry(long countryId)
    {
        return await _context.Hotels
            .Where(h => h.CountryId == countryId)
            .ToListAsync();
    }
}