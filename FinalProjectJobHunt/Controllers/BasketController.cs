using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models.Job;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FinalProjectJobHunt.Controllers
{
	public class BasketController : Controller
	{
		private readonly AppDbContext _context;

		public BasketController(AppDbContext context)
		{
			_context = context;
		}
		public async Task<IActionResult> AddBasket(int id)
		{
			if (id == null || id < 1) return BadRequest();

			UserPostJob product = await _context.UserPostJobs.FirstOrDefaultAsync(p => p.id == id);

			if (product == null) return NotFound();


			return View();
		}
	}
}
