using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Utilities.Exceptions;

namespace FinalProjectJobHunt.Areas.Admin.Controllers
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
            if (id == null || id < 0) throw new BadRequestException("No Setting Found With This ID");

            Setting settings = _context.Settings.FirstOrDefault(x => x.id == id);
            if (settings == null) throw new NotFoundException("We Could Not Find This Setting");
            return View(settings);
        }
        [HttpPost]
        public async Task<IActionResult> Update(int id, Setting setting)
        {
            if (id == null || id < 0) throw new BadRequestException("No Setting Found With This ID");

            Setting existed = await _context.Settings.FirstOrDefaultAsync(x => x.id == id);
            if (existed == null) throw new NotFoundException("We Could Not Find This Setting");
            existed.Value = setting.Value;
            await _context.SaveChangesAsync();
            return RedirectToAction("Index", "Setting");

        }
    }
}
