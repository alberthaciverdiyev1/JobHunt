using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Job.DAL;
using Job.Models;
using Job.ViewModels;
using Job.Models.Job;
using Job.Utilities.Enums;
using Microsoft.AspNetCore.Authorization;

namespace Job.Controllers
{
    public class JobController : Controller
    {
        private readonly AppDbContext _context;

        public JobController(AppDbContext context)
        {
            _context = context;
        }
        [Authorize(Roles = "Employer")]

        public async Task<IActionResult> Index(int page)
        {
            ViewBag.Page = page;
            ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);

            List<Category> categories = await _context.Categories.ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<PostJob> postJobs = await _context.PostJobs
                .Include(x => x.JobType).Skip(page * 6).Take(6)
                .Include(x => x.City)
                .Include(x => x.Category).ToListAsync();

            JobVM jobVM = new JobVM
            {
                Category = categories,
                Positions = positions,
                PostJobs = postJobs

            };

            return View(jobVM);
        }

        [Authorize(Roles = "Employee")]

        public async Task<IActionResult> UserIndex(int page)
        {
            ViewBag.Page = page;
            ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);

            List<Category> categories = await _context.Categories.ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<PostJob> postJobs = await _context.PostJobs
                .Include(x => x.JobType).Skip(page * 6).Take(6)
                .Include(x => x.City)
                .Include(x => x.Category).ToListAsync();

            UserPostJobVM jobVM = new UserPostJobVM
            {
                Category = categories,
                Positions = positions,
                PostJobs = postJobs,
                

            };

            return View(jobVM);
        }


        [Authorize(Roles = "Employee")]
        public async Task<IActionResult> PostJob()
        {


            List<Category> categories = await _context.Categories.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();
            List<Language> languages = await _context.Languages.ToListAsync();
            List<Education> education = await _context.Educations.ToListAsync();
            List<WorkExperience> workExperiences = _context.WorkExperiences.ToList();
            List<JobType> jobTypes = _context.JobTypes.ToList();
            JobVM jobVM = new JobVM
            {
                Category = categories,
                Languages = languages,
                WorkExperiences = workExperiences,
                JobTypes = jobTypes,
                Educations = education,
                Cities = cities,

            };

            //ViewBag.Category = await _context.Categories.ToListAsync();
            //ViewBag.Position = await _context.Positions.ToListAsync();
            //ViewBag.Language = await _context.Languages.ToListAsync();
            //ViewBag.Education = await _context.Educations.ToListAsync();
            //ViewBag.ExpeerienceYear = await _context.ExperienceYears.ToListAsync();
            //ViewBag.WorkExperience = await _context.WorkExperiences.ToListAsync();
            //ViewBag.City = await _context.Cities.ToListAsync();
            //ViewBag.JobType = await _context.JobTypes.ToListAsync();
            return View(jobVM);
        }
        [HttpPost]
        public async Task<IActionResult> PostJob(JobVM job)
        {
            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
                return View();
            }

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
                Created = DateTime.Now
            };
            await _context.AddAsync(postJob);
            await _context.SaveChangesAsync();



            return RedirectToAction("Index", "Job");
        }


        [Authorize(Roles = "Employer")]
        public async Task<IActionResult> UserPostJob()
        {


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

            if (!ModelState.IsValid)
            {
                ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
                return View();
            }

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
                Created = DateTime.Now
            };
            await _context.AddAsync(postJob);
            await _context.SaveChangesAsync();



            return RedirectToAction("Index", "Job");




        }
    }


}
