using Microsoft.AspNetCore.Mvc;
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

			HomeVM homeVM= new HomeVM { 
			
			Categories = categories,
			Blogs=blogs
			
			};
			return View(homeVM);
		}
		public IActionResult Error()
		{
			return View();
		}

	}
}