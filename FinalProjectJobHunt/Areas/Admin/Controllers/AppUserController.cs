using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Utilities.Extentions;
using Microsoft.AspNetCore.Identity;
using System.Security.Claims;

namespace FinalProjectJobHunt.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AppUserController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;
        private readonly UserManager<AppUser> _userManager;

        public AppUserController(AppDbContext context,IWebHostEnvironment env, UserManager<AppUser>userManager)
        {
            _context = context;
            _env = env;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index()
        {
            List<AppUser> users = await _userManager.Users.ToListAsync();
            return View(users);
        }
        public IActionResult Delete(int id)
        {
            AppUser user = _context.Users.FirstOrDefault(x => x.Id == id);
            var check = this.CheckDbContext(user);
            if (check != null)
            {
                return check;
            }
          string filename = Guid.NewGuid().ToString() + user.ImageURL;
                string path = Path.Combine(_env.WebRootPath, "assets/images/User", filename);
            if(System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }

            _context.Users.Remove(user);
            _context.SaveChanges();
            return RedirectToAction("Index", "AppUser");

        }
    }
}
