using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using FinalProjectJobHunt.Models.Job;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using FinalProjectJobHunt.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.Rendering;
using System.Data;
using System.Text.Json.Serialization;
using System.Text.Json;
using System.Net.Http.Json;
using static System.Net.WebRequestMethods;

namespace FinalProjectJobHunt.Controllers
{
    public class JobController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public JobController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }


        public async Task<IActionResult> Index(int page, string? search, int? categoryId, int? order, int? city, int?[] jobtype, int? salary, int? experienceId)
        {
            IQueryable<PostJob> query = _context.PostJobs
            .Include(p => p.AppUser).Include(x => x.Category).ThenInclude(y => y.Positions)
            .Include(x => x.JobType)
            .Include(x => x.City).Skip(page * 6).Take(6).AsQueryable();
             ViewBag.Page = page;
            ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);
            
            
            switch (order)
            {
                case 1:
                    query = query.OrderByDescending(p => p.Created);
                    break;
                case 2:
                    query = query.OrderByDescending(p => p.Salary);
                    break;
                case 3:
                    query = query.OrderBy(p => p.Salary);
                    break;
            }
            switch (salary)
            {
                case 1:
                    query = query.Where(p => p.Salary < 500);
                    break;
                case 2:
                    query = query.Where(p => p.Salary >= 500 && p.Salary < 1000);
                    break;
                case 3:
                    query = query.Where(p => p.Salary >= 1000 && p.Salary < 1500);
                    break;
                case 4:
                    query = query.Where(p => p.Salary >= 1000);
                    break;
            }
            if (city != null)
            {
                query = query.Where(p => p.City.id == city);

            }
            if (experienceId != null)
            {

                query = query.Where(p => p.WorkExperienceId == experienceId);

            }
            if (search != null)
            {
                query = query.Where(p => p.Description.ToLower().Contains(search.ToLower()) ||
                                         //p.Category.||
                                         p.Category.Name.Contains(search.ToLower()) ||
                                         p.City.CityName.ToLower().Contains(search.ToLower()) ||
                                         p.JobType.WorkType.ToLower().Contains(search.ToLower()));
            }
            if (jobtype.Length != 0)
            {
                query = query.Where(p => jobtype.Contains(p.JobType.id));
            }
            if (categoryId != null)
            {
                query = query.Where(p => p.CategoryId == categoryId);
            }

           

            PostJobVM jobVM = new PostJobVM
            {
                Category = await _context.Categories.Include(x => x.Positions).ToListAsync(),
                Positions = await _context.Positions.ToListAsync(),
                PostJobs = await query.ToListAsync(),
                AppUsers = await _context.Users.ToListAsync(),
                Cities = await _context.Cities.ToListAsync(),
                JobTypes = await _context.JobTypes.ToListAsync(),
                WorkExperiences = await _context.WorkExperiences.ToListAsync(),
                Search = search,
                categoryId = categoryId,
                Order = order,
                City = city,
                Jobtype = jobtype,
                salary = salary,
                ExperienceId = experienceId

            };

            return View(jobVM);
        }

        public async Task<IActionResult> UserIndex(int page, string? search, int? categoryId, int? order, int? city, int?[] jobtype, int? salary, int? experienceId)
        {
            ViewBag.Page = page;
            ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);

            IQueryable<UserPostJob> query = _context.UserPostJobs
         .Include(p => p.AppUser).Include(x => x.Category).ThenInclude(x => x.Positions)
         .Include(x => x.JobType).Skip(page * 6).Take(6)
         .Include(x => x.City).AsQueryable();
            switch (order)
            {
                case 1:
                    query = query.OrderByDescending(p => p.Created);
                    break;
                case 2:
                    query = query.OrderByDescending(p => p.Salary);
                    break;
                case 3:
                    query = query.OrderBy(p => p.Salary);
                    break;
            }
            switch (salary)
            {
                case 1:
                    query = query.Where(p => p.Salary < 500);
                    break;
                case 2:
                    query = query.Where(p => p.Salary >= 500 && p.Salary < 1000);
                    break;
                case 3:
                    query = query.Where(p => p.Salary >= 1000 && p.Salary < 1500);
                    break;
                case 4:
                    query = query.Where(p => p.Salary >= 1000);
                    break;
            }
            if (city != null)
            {
                query = query.Where(p => p.City.id == city);

            }
            if (experienceId != null)
            {

                query = query.Where(p => p.WorkExperienceId == experienceId);

            }
            if (search != null)
            {
                query = query.Where(p => p.Description.ToLower().Contains(search.ToLower()) ||
                                         p.Category.Name.ToLower().Contains(search.ToLower()) ||
                                         p.City.CityName.ToLower().Contains(search.ToLower()) ||
                                         p.JobType.WorkType.ToLower().Contains(search.ToLower()));
            }
            if (jobtype.Length != 0)
            {
                query = query.Where(p => jobtype.Contains(p.JobType.id));
            }
            if (categoryId != null)
            {
                query = query.Where(p => p.CategoryId == categoryId);
            }



            UserPostJobVM jobVM = new UserPostJobVM
            {

                UserPostJobs = await query.ToListAsync(),
                Category = await _context.Categories.Include(x => x.Positions).ToListAsync(),
                Positions = await _context.Positions.ToListAsync(),
                AppUsers = await _context.Users.ToListAsync(),
                Cities = await _context.Cities.ToListAsync(),
                JobTypes = await _context.JobTypes.ToListAsync(),
                WorkExperiences = await _context.WorkExperiences.ToListAsync(),
                Search = search,
                categoryId = categoryId,
                Order = order,
                City = city,
                Jobtype = jobtype,
                salary = salary,
                ExperienceId = experienceId
            };

            return View(jobVM);
        }


        public async Task<IActionResult> Detail(int id)
        {

            UserPostJob singleJob = await _context.UserPostJobs
                .Include(x => x.Education)
                .Include(x => x.WorkExperience)
                .Include(x => x.Category)
                .Include(x => x.JobType)
                .Include(x => x.City)
                .FirstOrDefaultAsync(x => x.id == id);
            AppUser appUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == singleJob.AppUserId);
            Position positionName = await _context.Positions.FirstOrDefaultAsync(x => x.id == singleJob.PositionId);

            DetailVM detail = new DetailVM
            {
                UserPostJob = singleJob,
                AppUser = appUser,
                Position = positionName
            };
            return View(detail);
        }
        public async Task<IActionResult> CompanyJobDetail(int id)
        {

            PostJob singleJob = await _context.PostJobs
                .Include(x => x.Education)
                .Include(x => x.WorkExperience)
                .Include(x => x.Category)
                .Include(x => x.JobType)
                .Include(x => x.City)
                .FirstOrDefaultAsync(x => x.id == id);
            Position positionName = await _context.Positions.FirstOrDefaultAsync(x => x.id == singleJob.PositionId);

            AppUser appUser = await _context.Users.FirstOrDefaultAsync(u => u.Id == singleJob.AppUserId);

            DetailVM detail = new DetailVM
            {
                PostJob = singleJob,
                AppUser = appUser,
                Position = positionName
            };
            return View(detail);
        }
        [Authorize]

        public async Task<IActionResult> PostJob()
        {

            if (!ModelState.IsValid)
            {
                return View();
            }
            
            if (User.Identity.IsAuthenticated)
            {
                string role = User.FindFirst(ClaimTypes.Role)?.Value;
                if (role == "EMPLOYER")
                {
                    return RedirectToAction("UserPostJob");
                }
            }
            ViewBag.Categories = new SelectList(_context.Categories, "id", "Name");
            ViewBag.City = new SelectList(_context.Cities, "id", "CityName");

            List<Category> categories = await _context.Categories.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();
            List<Language> languages = await _context.Languages.ToListAsync();
            List<Education> education = await _context.Educations.ToListAsync();
            List<WorkExperience> workExperiences = await _context.WorkExperiences.ToListAsync();
            List<JobType> jobTypes = await _context.JobTypes.ToListAsync();
            PostJobVM jobVM = new PostJobVM
            {
                Category = categories,
                Languages = languages,
                WorkExperiences = workExperiences,
                JobTypes = jobTypes,
                Educations = education,
                Cities = cities,

            };
            return View(jobVM);
        }
        [HttpPost]
        public async Task<IActionResult> PostJob(PostJobVM job)
        {
            ViewBag.Categories = new SelectList(_context.Categories, "id", "Name");
            ViewBag.City = new SelectList(_context.Cities, "id", "CityName");
            List<Category> categories = await _context.Categories.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();
            List<Language> languages = await _context.Languages.ToListAsync();
            List<Education> education = await _context.Educations.ToListAsync();
            List<WorkExperience> workExperiences = await _context.WorkExperiences.ToListAsync();
            List<JobType> jobTypes = await _context.JobTypes.ToListAsync();
            job.Category= categories;
            job.Languages= languages;
            job.WorkExperiences= workExperiences;
            job.JobTypes= jobTypes;
            job.Educations= education;
            job.Cities= cities;
            if (!ModelState.IsValid)
            {
               
                ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
                return View(job);
            }
            var currentUser = await _userManager.GetUserAsync(User);

            PostJob postJob = new PostJob
            {
                PhoneNumber = job.PhoneNumber,
                LanguageId = job.LanguageId,
                CategoryId = job.CategoryId,
                MaxAge = job.MaxAge,
                MinAge = job.MinAge,
                EducationId = job.EducationId,
                Email = job.Email,
                Experience = job.Experience,
                WorkExperienceId = job.WorkExperienceId,
                Salary = job.Salary,
                CityId = job.CityId,
                Website = job.Website,
                JobTypeId = job.JobTypeId,
                Description = job.Description,
                Created = DateTime.Now,
                PositionId = job.PositionId,
                AppUserId = currentUser.Id
            };
            await _context.AddAsync(postJob);
            await _context.SaveChangesAsync();



            return RedirectToAction("Index", "Job");
        }


        public async Task<IActionResult> UserPostJob()
        {

            ViewBag.Categories = new SelectList(_context.Categories, "id", "Name");

            List<Category> categories = await _context.Categories.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();
            List<Language> languages = await _context.Languages.ToListAsync();
            List<Education> education = await _context.Educations.ToListAsync();
            List<WorkExperience> workExperiences = _context.WorkExperiences.ToList();
            List<JobType> jobTypes = _context.JobTypes.ToList();
            UserPostJobVM jobVM = new UserPostJobVM
            {
                Category = categories,
                Languages = languages,
                WorkExperiences = workExperiences,
                JobTypes = jobTypes,
                Educations = education,
                Cities = cities,

            };

            return View(jobVM);

        }
        [HttpPost]
        public async Task<IActionResult> UserPostJob(UserPostJobVM job)
        {

            ViewBag.Categories = new SelectList(_context.Categories, "id", "Name");
            ViewBag.City = new SelectList(_context.Cities, "id", "CityName");
            List<Category> categories = await _context.Categories.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();
            List<Language> languages = await _context.Languages.ToListAsync();
            List<Education> education = await _context.Educations.ToListAsync();
            List<WorkExperience> workExperiences = await _context.WorkExperiences.ToListAsync();
            List<JobType> jobTypes = await _context.JobTypes.ToListAsync();
            job.Category = categories;
            job.Languages = languages;
            job.WorkExperiences = workExperiences;
            job.JobTypes = jobTypes;
            job.Educations = education;
            job.Cities = cities;
            if (!ModelState.IsValid)
            {

                ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
                return View(job);
            }
            var currentUser = await _userManager.GetUserAsync(User);

            UserPostJob postJob = new UserPostJob
            {
                PhoneNumber = job.PhoneNumber,
                LanguageId = job.LanguageId,
                CategoryId = job.CategoryId,
                Age = job.Age,
                EducationId = job.EducationId,
                Email = job.Email,
                Experience = job.Experience,
                WorkExperienceId = job.WorkExperienceId,
                Salary = job.Salary,
                CityId = job.CityId,
                JobTypeId = job.JobTypeId,
                Description = job.Description,
                Created = DateTime.Now,
                AppUserId = currentUser.Id,
                PositionId = job.PositionId,

            };
            await _context.AddAsync(postJob);
            await _context.SaveChangesAsync();

            return RedirectToAction("UserIndex", "Job");
        }
        [HttpPost]
        public JsonResult GetProfessionsByCategory(int id)
        {

            try
            {
                List<Position> positions = _context.Positions.Where(p => p.CategoryId == id).ToList();

                return Json(new SelectList(positions, "id", "PositionName"));

            }
            catch (Exception ex)
            {
                return Json(new { error = ex.Message });
            }


        }

        [Authorize]
        public async Task<IActionResult> AddBasket(int? id)
        {
            if (id == null || id < 1) return BadRequest();



            string role = User.FindFirst(ClaimTypes.Role)?.Value;

            if (User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                if (user is null) return NotFound();

                if (role == "EMPLOYEE")
                {
                    UserPostJob job = await _context.UserPostJobs.FirstOrDefaultAsync(p => p.id == id);
                    if (job == null) return NotFound();
                    BasketItem existedItem = await _context.BasketItems
                       .FirstOrDefaultAsync(b => b.AppUserId == user.Id && b.UserPostJobId == job.id);
                    if (existedItem is null)
                    {
                        existedItem = new BasketItem
                        {
                            AppUserId = user.Id,
                            UserPostJobId = job.id,

                        };
                        await _context.BasketItems.AddAsync(existedItem);
                    }
                    else
                    {
                        _context.Remove(existedItem);
                    }
                }
                else
                {
                    PostJob job = await _context.PostJobs.FirstOrDefaultAsync(p => p.id == id);
                    if (job == null) return NotFound();
                    BasketItem existedItem = await _context.BasketItems
                        .FirstOrDefaultAsync(b => b.AppUserId == user.Id && b.PostJobId == job.id);
                    if (existedItem is null)
                    {
                        existedItem = new BasketItem
                        {
                            AppUserId = user.Id,
                            PostJobId = job.id,

                        };
                        await _context.BasketItems.AddAsync(existedItem);
                    }
                    else
                    {
                        _context.Remove(existedItem);

                    }
                }

                await _context.SaveChangesAsync();
            }
            return Ok();
        }
        public async Task<IActionResult> GetBasket()
        {
            List<BasketItemVM> basketItems = new List<BasketItemVM>();
            if (User.Identity.IsAuthenticated)
            {
                string role =User.FindFirst(ClaimTypes.Role)?.Value;
                AppUser user = await _userManager.FindByNameAsync(User.Identity.Name);
                if (user is null) throw new Exception("Exception");
                basketItems = new List<BasketItemVM>();
                if (role == "EMPLOYEE")
                {
                    List<BasketItem> userItems = await _context.BasketItems
                    .Where(b => b.AppUserId == user.Id)
                    .Include(b => b.UserPostJob)
                    .ToListAsync();

                    foreach (BasketItem item in userItems)
                    {
                        basketItems.Add(new BasketItemVM
                        {
                            Id = item.id,
                            Salary = item.UserPostJob.Salary ?? 0m,
                            Category = item.UserPostJob.Category.Name,
                            //Position=item.UserPostJob.Positions.Where(p => p.id == ).
                            Image = item.AppUser.ImageURL,
                            UserPostJobId = item.UserPostJobId

                        });
                    }

                    return PartialView("_BasketPartial", basketItems);
                }
                else
                {
                    List<BasketItem> userItems = await _context.BasketItems
              .Where(b => b.AppUserId == user.Id)
              .Include(b => b.PostJob)
              .ToListAsync();

                    foreach (BasketItem item in userItems)
                    {
                        basketItems.Add(new BasketItemVM
                        {
                            Id = item.id,
                            Salary = item.PostJob.Salary ?? 0m,
                            Category = item.PostJob.Category.Name,
                            //Position=item.UserPostJob.Positions.Where(p => p.id == ).
                            Image = item.AppUser.ImageURL,
                            PostJobId = item.UserPostJobId

                        });
                    }

                    return PartialView("_BasketPartial", basketItems);
                }

            }
            return PartialView("_BasketPartial",basketItems);
        }


    }


}
