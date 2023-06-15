using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Job.DAL;
using Job.Models;

namespace Job.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SettingController : Controller
    {
        private readonly AppDbContext _context;

        public SettingController(AppDbContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {

            List<Setting> settings = _context.Settings.ToList();
            return View(settings);
        }

        public IActionResult Update(int id)
        {
            if (id == null || id < 1) return BadRequest();

            Setting settings = _context.Settings.FirstOrDefault(x => x.id == id);
            if (settings == null) return BadRequest();
            return View(settings);
        }
        [HttpPost]
        public async Task<IActionResult> Update(int id, Setting setting)
        {
            if (id == null || id < 1) return BadRequest();

            Setting existed = await _context.Settings.FirstOrDefaultAsync(x => x.id == id);
            if (existed == null) return BadRequest();
            existed.Value=setting.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Setting");

        }
    }
}
