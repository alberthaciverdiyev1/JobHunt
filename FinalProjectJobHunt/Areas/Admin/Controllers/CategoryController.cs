using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Utilities.Extentions;
using System.Data.Odbc;
using System.Drawing.Printing;
using FinalProjectJobHunt.Utilities.Exceptions;
using System.Reflection.Metadata;

namespace FinalProjectJobHunt.Areas.Admin.Controllers
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
            if (id == null || id < 0) throw new BadRequestException("No Category Found With This ID");


            Category category = _context.Categories.FirstOrDefault(x => x.id == id);
            if (category == null) throw new NotFoundException("We Could Not Find This Category");

            return View(category);
        }
        [HttpPost]

        public async Task<IActionResult> Update(int id, Category category)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            if (id == null || id < 0) throw new BadRequestException("No Category Found With This ID");

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) throw new NotFoundException("We Could Not Find This Category");
            existed.Name = category.Name;
            existed.Icon = category.Icon;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Category");
        }
        public IActionResult Delete(int id)
        {
            if (id == null || id < 0) throw new BadRequestException("No Category Found With This ID");

            Category existed = _context.Categories.FirstOrDefault(x => x.id == id);
            if (existed == null) throw new NotFoundException("We Could Not Find This Category");

            _context.Categories.Remove(existed);
            _context.SaveChanges();
            return RedirectToAction("Index", "Category");

        }
        public async Task<IActionResult> PositionIndex(int id)
        {
            if (id == null || id < 0) throw new BadRequestException("No Category Found With This ID");

            List<Position> position = await _context.Positions.Where(x => x.CategoryId == id).Include(x => x.Category).ToListAsync();
            if (position == null) throw new NotFoundException("We Could Not Find This Category");

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
        public IActionResult UpdatePosition(int id)
        {
            if (id == null || id < 0) throw new BadRequestException("No Position Found With This ID");

            Position position = _context.Positions.FirstOrDefault(x => x.id == id);
            if (position == null) throw new NotFoundException("We Could Not Find This Position");

            ViewBag.Categories = _context.Categories.ToList();

            return View(position);
        }
        [HttpPost]
        public async Task<IActionResult> UpdatePosition(int id, Position position)
        {
            if (id == null || id < 0) throw new BadRequestException("No Position Found With This ID");

            Position existed = _context.Positions.FirstOrDefault(x => x.id == id);
            if (existed == null) throw new NotFoundException("We Could Not Find This Position");

            ViewBag.Categories = _context.Categories.ToList();
            existed.PositionName = position.PositionName;
            existed.CategoryId = position.CategoryId;
            _context.SaveChangesAsync();
            return RedirectToAction("PositionIndex", "Category");

        }
        public IActionResult DeletePosition(int id)
        {
            if (id == null || id < 0) throw new BadRequestException("No Position Found With This ID");

            Position existed = _context.Positions.FirstOrDefault(x => x.id == id);
            if (existed == null) throw new NotFoundException("We Could Not Find This Position");

            _context.Remove(existed);
            _context.SaveChanges();
            return RedirectToAction("PositionIndex", "Category");


        }
    }
}
