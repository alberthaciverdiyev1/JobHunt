using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using System.Diagnostics;
using FinalProjectJobHunt.Models.Job;
using FinalProjectJobHunt.Interfaces;
using Microsoft.AspNetCore.Identity;

namespace FinalProjectJobHunt.Controllers
{
    public class HomeController : Controller
    {

        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public HomeController(AppDbContext context)
        {
            _context = context;
        
        }
        public async Task<IActionResult> Index( string? search)
        {
           
           

            IQueryable<PostJob> query = null;
            IQueryable<UserPostJob> queryUserPostJob = null;

            if (search != null)
            {
                query = _context.PostJobs.Where(p => p.Description.ToLower().Contains(search.ToLower()) ||
                                         p.Category.Name.ToLower().Contains(search.ToLower()) ||
                                         p.City.CityName.ToLower().Contains(search.ToLower()) ||
                                         p.JobType.WorkType.ToLower().Contains(search.ToLower()));

                queryUserPostJob = _context.UserPostJobs.Where(p => p.Description.ToLower().Contains(search.ToLower()) ||
                                                               p.Category.Name.ToLower().Contains(search.ToLower()) ||
                                                               p.City.CityName.ToLower().Contains(search.ToLower()) ||
                                                               p.JobType.WorkType.ToLower().Contains(search.ToLower()));
            }

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
            List<City> cities = _context.Cities.Take(8).ToList();
            List<Position> positions = _context.Positions.ToList();

            HomeVM homeVM = new HomeVM
            {
                Categories = categories,
                Blogs = blogs,
                Users = users,
                Cities = cities,
                PostJobs = query != null ? await query.ToListAsync() : new List<PostJob>(),
                UserPostJobs = queryUserPostJob != null ? await queryUserPostJob.ToListAsync() : new List<UserPostJob>(),
                Positions = positions,
            };

            return View(homeVM);
        }

        //JavaScript ucun idi
        public async Task<ActionResult> Categories()
        {

            List<Category> categories = await _context.Categories.ToListAsync();

            return View(categories);
        }
        //public async Task<IActionResult> Search(string value)
        //{
        //    var Values = await _context.Categories.Where(x => x.Name.Contains(value))
        //        .Include(x => x.Positions).Where(x => x.Name.Contains(value)).ToListAsync();
        //    return View(Values);
        //}

    }
}