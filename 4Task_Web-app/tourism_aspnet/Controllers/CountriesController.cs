using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using tourism_aspnet.Models;

namespace tourism_aspnet.Controllers;

[Route("[controller]")]
[ApiController]
public class CountriesController : ControllerBase
{
    private readonly ApplicationDbContext _context;

    public CountriesController(ApplicationDbContext context)
    {
        _context = context;
    }

    [HttpGet]
    public async Task<ActionResult<IEnumerable<Country>>> GetCountries()
    {
        return await _context.Countries.ToListAsync();
    }
}