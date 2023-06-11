using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;
using ProjectJobHunt.Utilities.Extentions;

namespace ProjectJobHunt.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AppUserController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public AppUserController(AppDbContext context,IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }
        public async Task<IActionResult> Index()
        {
            List<AppUser> users = await _context.Users.ToListAsync();
            return View(users);
        }
        public IActionResult Delete(string id)
        {
          

            AppUser user = _context.Users.FirstOrDefault(x => x.Id == id);

            
            var check=this.CheckDbContext(user);
            if (check!=null)
            {
                return check;
            }
            if(user.ImageURL!=null)
            {   string filename=Guid.NewGuid().ToString()+user.ImageURL;
                string path = Path.Combine(_env.WebRootPath, "assets/images/User", filename);
                System.IO.File.Delete(path);
               
            }
            _context.Users.Remove(user);
            _context.SaveChanges();
            return RedirectToAction("Index", "AppUser");

        }
    }
}
