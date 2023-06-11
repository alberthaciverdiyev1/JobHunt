using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;
using ProjectJobHunt.ViewModels;
using System.Diagnostics;

namespace ProjectJobHunt.Controllers
{
    public class HomeController : Controller
    {

		private readonly AppDbContext _context;

		public HomeController(AppDbContext context)
		{
			_context = context;
		}
		public IActionResult Index(int count)
		{

			List<Category> categories = _context.Categories.Take(8).ToList();
			List<Blog>blogs=_context.Blogs.ToList();
			List<AppUser>users=_context.Users.ToList();

			HomeVM homeVM= new HomeVM { 
			
			Categories = categories,
			Blogs=blogs,
			Users=users
			};
			return View(homeVM);
		}
		public async Task<ActionResult> Categories() { 
		
		List<Category>categories=await _context.Categories.ToListAsync();
		
		return View(categories);
		}
		public IActionResult Error()
		{
			return View();
		}

	}
}