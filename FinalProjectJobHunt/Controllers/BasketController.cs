using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models.Job;
using FinalProjectJobHunt.Utilities.Exceptions;
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
            if (id == null || id < 0) throw new BadRequestException("No Item Found With This ID");

            UserPostJob product = await _context.UserPostJobs.FirstOrDefaultAsync(p => p.id == id);

            if (product == null) throw new NotFoundException("We Could Not Find This Item");



            return View();
		}
	}
}
