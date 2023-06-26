using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc;
using FinalProjectJobHunt.ViewModels;
using System.Reflection.Metadata;
using FinalProjectJobHunt.Models.Job;
using System.Security.Claims;

namespace FinalProjectJobHunt.Controllers
{
    public class UserController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly IWebHostEnvironment _env;

        public UserController(AppDbContext context, UserManager<AppUser> userManager, IWebHostEnvironment env)
        {
            _context = context;
            _userManager = userManager;
            _env = env;
        }
        public async Task<IActionResult> Index()
        {
            var user = await _context.Users
                .Include(u => u.Category)
                .Include(e => e.Education)
                .FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            var position = await _context.Positions.FirstOrDefaultAsync(p => p.id == user.UserProfession);
            List<PostJob> postJobs = await _context.PostJobs.Where(j => j.AppUserId == user.Id).ToListAsync();
            List<UserPostJob> UserpostJobs = await _context.UserPostJobs.Where(j => j.AppUserId == user.Id).ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<Category> categories = await _context.Categories.ToListAsync();

            if (user == null) return NotFound();
            if (position == null)
            {
                ViewBag.Position = true;

            }
            else { ViewBag.Position = position.PositionName; }



            Profile Profile = new Profile
            {
                Name = user.Name,
                Surname = user.Surname,
                Age = user.Age,
                Phone = user.Phone,
                CategoryId = user.CategoryId,
                EducationId = user.EducationId,
                Education = user.Education,
                UserProfession = user.UserProfession,
                Description = user.Description,
                ImageURL = user.ImageURL,
                UserEmail = user.Email,
                Category = user.Category,
                Username = user.UserName,
                PostJobs = postJobs,
                UserPostJobs = UserpostJobs,
                Positions = positions,
                Categories = categories,

            };

            return View(Profile);
        }
        public async Task<IActionResult> UserInfo(int id)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Id == id);
            if (user == null) return NotFound();
            Profile Profile = new Profile
            {
                Name = user.Name,
                Surname = user.Surname,
                Age = user.Age,
                Phone = user.Phone,
                CategoryId = user.CategoryId,
                EducationId = user.EducationId,
                Education = user.Education,
                UserProfession = user.UserProfession,
                Description = user.Description,
                ImageURL = user.ImageURL,
                UserEmail = user.Email,
                Category = user.Category,
                Username = user.UserName,

            };
            return View(Profile);
        }
        [HttpGet]
        public async Task<IActionResult> Update()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            ViewBag.Categories = _context.Categories.Select(c => new SelectListItem
            {
                Value = c.id.ToString(),
                Text = c.Name
            });

            ViewBag.Education = await _context.Educations.ToListAsync();

            if (user == null) return NotFound();
            Profile Profile = new Profile
            {
                Name = user.Name,
                Surname = user.Surname,
                Age = user.Age,
                Phone = user.Phone,
                CategoryId = user.CategoryId,
                EducationId = user.EducationId,
                UserProfession = user.UserProfession,
                Description = user.Description,
                ImageURL = user.ImageURL,
                UserEmail = user.Email,

            };

            return View(Profile);

        }
        [HttpPost]
        public async Task<IActionResult> Update(Profile profile)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            if (!ModelState.IsValid)
            {
                return View();
            }

            string filename = Guid.NewGuid().ToString() + profile.ImageURL;
            string path = Path.Combine(_env.WebRootPath, "assets/images/User", filename);
            ModelState.Clear();
            if (profile.Photo != null)
            {
                if (profile.Photo.ContentType.Contains("image/"))
                {
                    if (profile.Photo.Length < 1024 * 500)
                    {
                        System.IO.File.Delete(path);
                        string newfile = Guid.NewGuid().ToString() + profile.Photo.FileName;
                        string newPath = Path.Combine(_env.WebRootPath, "assets/images/User", newfile);
                        FileStream stream = new FileStream(newPath, FileMode.Create);
                        await profile.Photo.CopyToAsync(stream);
                        user.ImageURL = newfile;
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Seklin olcusu 500kbdan buyuk olamaz");
                        return RedirectToAction("Update", "User");
                        //return View();
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Seklin formati duzgun degil");
                    return RedirectToAction("Update", "User");
                }
            }


            user.Surname = profile.Surname;
            user.Name = profile.Name;
            user.Age = profile.Age;
            user.Phone = profile.Phone;
            user.UserProfession = profile.UserProfession;
            user.Description = profile.Description;
            user.EducationId = profile.EducationId;
            user.CategoryId = profile.CategoryId;

            await _context.SaveChangesAsync();

            return RedirectToAction("Index", "User");
        }

        public IActionResult Delete(int id)
        {
            if (id == null || id < 1) return BadRequest();
            string role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "EMPLOYEE")
            {  PostJob job = _context.PostJobs.FirstOrDefault(x => x.id == id);
                if (job == null) return NotFound();
                _context.Remove(job);
            }
            else
            {
                UserPostJob job = _context.UserPostJobs.FirstOrDefault(x => x.id == id);
                if (job == null) return NotFound();
                _context.Remove(job);
            }
            _context.SaveChanges();
            return RedirectToAction("Index","User");
        }
    }
}
