using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Migrations;
using ProjectJobHunt.Models;
using Category = ProjectJobHunt.Models.Category;

namespace ProjectJobHunt.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class CategoryController : Controller
    {
        private readonly AppDbContext _context;

        public CategoryController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {

            List<Category> categories = _context.Categories.ToList();
            return View(categories);
        }
        public IActionResult Create()
        {

            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Category category)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            await _context.AddAsync(category);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Category");
        }
        public IActionResult Update(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            Category category = _context.Categories.FirstOrDefault(x => x.id == id);
            if (category == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            return View(category);
        }
        [HttpPost]

        public async Task<IActionResult> Update(int id, Category category)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            if (id < 1 || id == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });

            existed.Name = category.Name;
            existed.Icon = category.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Category");
        }
        public IActionResult Delete(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            _context.Categories.Remove(existed);
            _context.SaveChanges();
            return RedirectToAction("Index", "Category");

        }
        public async Task<IActionResult> PositionIndex(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            List<Position> position = await _context.Positions.Where(x => x.id == id).ToListAsync();
            if (position == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            return View(position);
        }


        public IActionResult AddPosition()
        {

            ViewBag.Categories = _context.Categories.ToList();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddPosition(Position position, int id)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Categories = _context.Categories.ToList();
                return View();
            }

            if (position == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            var category = await _context.Categories.FindAsync(id);
            if (category == null) return RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });

            position.Category = category;

            await _context.AddAsync(position);
            await _context.SaveChangesAsync();

            return RedirectToAction("PositionIndex", "Category");
        }

    }
}
