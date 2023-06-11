using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Migrations;
using ProjectJobHunt.Models;
using ProjectJobHunt.Utilities.Extentions;
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
            var check = this.CheckID(id);
            if (check != null)
            {
                return check;
            }

            Category category = _context.Categories.FirstOrDefault(x => x.id == id);
            var checkContext = this.CheckDbContext(category);
            if (checkContext != null)
            {
                return checkContext;
            }
            return View(category);
        }
        [HttpPost]

        public async Task<IActionResult> Update(int id, Category category)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            var check = this.CheckID(id);
            if (check != null)
            {
                return check;
            }
            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            var checkContext = this.CheckDbContext(existed);
            if (checkContext != null)
            {
                return checkContext;
            }
            existed.Name = category.Name;
            existed.Icon = category.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Category");
        }
        public IActionResult Delete(int id)
        {
            var check = this.CheckID(id);
            if (check != null)
            {
                return check;
            }
            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            var checkContext = this.CheckDbContext(existed);
            if (checkContext != null)
            {
                return checkContext;
            }
            _context.Categories.Remove(existed);
            _context.SaveChanges();
            return RedirectToAction("Index", "Category");

        }
        public async Task<IActionResult> PositionIndex()
        {
            List<Position> position = await _context.Positions.Include(x => x.Category).ToListAsync();
            var checkContext = this.CheckDbContext(position);
            if (checkContext != null)
            {
                return checkContext;
            }
            return View(position);
        }


        public IActionResult AddPosition()
        {

            ViewBag.Categories = _context.Categories.ToList();
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> AddPosition(Position position)
        {
            if (!ModelState.IsValid)
            {
                ViewBag.Categories = _context.Categories.ToList();
                return View();
            }
            var checkContext = this.CheckDbContext(position);
            if (checkContext != null)
            {
                return checkContext;
            }
            await _context.AddAsync(position);
            await _context.SaveChangesAsync();

            return RedirectToAction("PositionIndex", "Category");
        }

    }
}
