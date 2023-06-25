using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Web.Mvc;

namespace FinalProjectJobHunt.Controllers
{
	public class UserController : Microsoft.AspNetCore.Mvc.Controller
    {
		private readonly AppDbContext _context;
		private readonly UserManager<AppUser> _userManager;

		public UserController( AppDbContext context, UserManager<AppUser>userManager)
        {
		_context = context;
		_userManager = userManager;
		}
        public async Task<IActionResult> Index()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);

            if (user == null) return NotFound();

            return View(user);
        }
        public async Task<IActionResult> Update()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
			ViewBag.Categories = new SelectList(_context.Categories, "id", "Name");
			ViewBag.Education=await _context.Educations.ToListAsync();

            if (user == null) return NotFound();

            return View(user);
        }

	}
}
