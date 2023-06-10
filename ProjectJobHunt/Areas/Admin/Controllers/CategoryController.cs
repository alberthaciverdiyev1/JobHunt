using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;

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
            if (id < 1 || id == null) return BadRequest();
            Category category = _context.Categories.FirstOrDefault(x => x.id == id);
            if (category == null) return NotFound();
            return View(category);
        }
        [HttpPost]

        public async Task<IActionResult> Update(int id, Category category)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            if (id < 1 || id == null) return BadRequest();

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) return NotFound();

            existed.Name = category.Name;
            existed.Icon = category.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Category");
        }
        public IActionResult Delete(int id)
        {
            if (id < 1 || id == null) return BadRequest();

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) return NotFound();
            _context.Categories.Remove(existed);
            _context.SaveChanges();
            return RedirectToAction("Index", "Category");

        }
    }
}
