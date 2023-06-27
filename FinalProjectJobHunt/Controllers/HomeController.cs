using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using System.Diagnostics;

namespace FinalProjectJobHunt.Controllers
{
    public class HomeController : Controller
    {

        private readonly AppDbContext _context;

        public HomeController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index(int count, string search)
        {
            var user = _context.Users.FirstOrDefault(u => u.UserName == User.Identity!.Name);
            if (User.Identity.IsAuthenticated)
            {
                var messages = _context.Messages.Where(x => x.ReceiverId == user.Id).Count();

                if (messages != null)
                {
                    ViewBag.Messages = messages;


                }
            }
           
            List<Category> categories = _context.Categories.Take(8).ToList();
            List<Blog> blogs = _context.Blogs.ToList();
            List<AppUser> users = _context.Users.ToList();
            HomeVM homeVM = new HomeVM
            {
                Categories = categories,
                Blogs = blogs,
                Users = users,
            };
            return View(homeVM);
        }
        public async Task<ActionResult> Categories()
        {

            List<Category> categories = await _context.Categories.ToListAsync();

            return View(categories);
        }
        public async Task<IActionResult> Search(string value)
        {
            var Values = await _context.Categories.Where(x => x.Name.Contains(value))
                .Include(x => x.Positions).Where(x => x.Name.Contains(value)).ToListAsync();
            return View(Values);
        }

    }
}