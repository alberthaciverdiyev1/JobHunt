using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;

namespace ProjectJobHunt.Controllers
{
    public class BlogController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public BlogController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;
        }

        public async Task<IActionResult> Index()
        {

            List<Blog> blogs = await _context.Blogs.ToListAsync();
            return View(blogs);
        }

        public async Task<IActionResult> Blog(int page)
        {
            ViewBag.Page = page;
            ViewBag.Total = Math.Ceiling((decimal)_context.Blogs.Count() / 6);


            List<Blog> portfolios = await _context.Blogs.Skip(page * 6).Take(6).ToListAsync();
            return View(portfolios);
        }
        public async Task<IActionResult> Create()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Create(Blog blog)
        {
            //if (!ModelState.IsValid) return View();
            if (blog.Photo == null)
            {
                ModelState.AddModelError(string.Empty, "Sekil bos ola bilmez");
                return View();
            }

            if (blog.Photo.ContentType.Contains("image/"))
            {
                if (blog.Photo.Length < 1024 * 500)
                {
                    string filename = Guid.NewGuid().ToString() + blog.Photo.FileName;
                    string path = Path.Combine(_env.WebRootPath, "assets/images/BlogImages", filename);
                    FileStream stream = new FileStream(path, FileMode.Create);
                    await blog.Photo.CopyToAsync(stream);
                    stream.Close();
                    blog.DateTime = DateTime.Now;
                    blog.ImageURL = filename;
                    await _context.AddAsync(blog);
                    await _context.SaveChangesAsync();
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Seklin olcusu 500kbdan boyuk ola bilmez");
                    return View();
                }
            }
            else
            {
                ModelState.AddModelError(string.Empty, "Seklin formati duzgun deyil");
                return View();
            }

            return RedirectToAction("Blog", "Blog");
        }

        public async Task<IActionResult> Update(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home");
            Blog blog = await _context.Blogs.FirstOrDefaultAsync(x => x.id == id);
            if (blog == null) return RedirectToAction("Error", "Home");
            return View(blog);
        }
        [HttpPost]
        public async Task<IActionResult> Update(int id, Blog blog)
        {

            if (id == null || id < 1) return BadRequest();
            Blog existed = _context.Blogs.FirstOrDefault(x => x.id == id);
            if (existed == null) { return NotFound(); }
            //if (!ModelState.IsValid) return View();
            string filename = Guid.NewGuid().ToString() + blog.ImageURL;
            string path = Path.Combine(_env.WebRootPath, "assets/images/BlogImages", filename);
            if (blog.Photo != null)
            {
                if (blog.Photo.ContentType.Contains("image/"))
                {
                    if (blog.Photo.Length < 1024 * 500)
                    {

                        System.IO.File.Delete(path);
                        string newfile = Guid.NewGuid().ToString() + blog.Photo.FileName;
                        string newPath = Path.Combine(_env.WebRootPath, "assets/images/BlogImages", newfile);
                        FileStream stream = new FileStream(newPath, FileMode.Create);
                        await blog.Photo.CopyToAsync(stream);
                        existed.ImageURL = newfile;
                    }
                    else
                    {
                        ModelState.AddModelError(string.Empty, "Seklin olcusu 500kbdan boyuk ola bilmez");
                        return View();
                    }
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Seklin formati duzgun deyil");
                    return View();
                }

            }
            existed.Title = blog.Title;
            existed.Description = blog.Description;
            await _context.SaveChangesAsync();
            return RedirectToAction("Blog", "Blog");
        }
        public async Task<IActionResult> SingleBlog(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home");
            Blog blog = await _context.Blogs.FirstOrDefaultAsync(x => x.id == id);
            if (blog == null) return RedirectToAction("Error", "Home");
            ViewBag.Recent = _context.Blogs.Take(7).OrderByDescending(x => x.DateTime).ToList();
            return View(blog);
        }
        public IActionResult Delete(int id)
        {
            if (id < 1 || id == null) return RedirectToAction("Error", "Home");
            Blog blog = _context.Blogs.FirstOrDefault(x => x.id == id);
            if (blog == null) return RedirectToAction("Error", "Home");
            string filename = Guid.NewGuid().ToString() + blog.ImageURL;
            string path = Path.Combine(_env.WebRootPath, "assets/images/BlogImages", filename);
            System.IO.File.Delete(path);
            _context.Remove(blog);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
