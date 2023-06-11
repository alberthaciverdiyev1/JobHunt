using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;
using ProjectJobHunt.ViewModels;

namespace ProjectJobHunt.Controllers
{
    public class JobController : Controller
    {
        private readonly AppDbContext _context;

        public JobController(AppDbContext context)
        {
            _context = context;
        }
        public async Task<IActionResult> Index()
        {

            List<Category> categories = await _context.Categories.ToListAsync();

            JobVM jobVM = new JobVM
            {
                Category = categories,

            };

            return View(jobVM);
        }
        public IActionResult PostJob()
        {
            return View();
        }
    }
}
