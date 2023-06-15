using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;
using ProjectJobHunt.Models.Job;
using ProjectJobHunt.ViewModels;

namespace ProjectJobHunt.Controllers
{
    public class JobController : Controller
    {
        private readonly AppDbContext _context;

        public JobController(AppDbContext context)
        {
            _context = context;
        }
        //public async Task<IActionResult> Index()
        //{

        //    List<Category> categories = await _context.Categories.ToListAsync();
        //    List<Position> positions = await _context.Positions.ToListAsync();

        //    JobVM jobVM = new JobVM
        //    {
        //        Category = categories,
        //        Positions = positions
        //    };

        //    return View(jobVM);
        //}
        public async Task<IActionResult> PostJob()
        {

            //List<Category> categories = await _context.Categories.ToListAsync();
            //List<City> cities = await _context.Cities.ToListAsync();
            //List<Language> languages = await _context.Languages.ToListAsync();
            //List<Education> education = await _context.Educations.ToListAsync();
            //List<ExperienceYear> experienceYears = _context.ExperienceYears.ToList();
            //List<WorkExperience> workExperiences = _context.WorkExperiences.ToList();
            //List<JobType> jobTypes = _context.JobTypes.ToList();
            //JobVM jobVM = new JobVM
            //{
            //    Category = categories,
            //    Languages = languages,
            //    ExperienceYears = experienceYears,
            //    WorkExperiences = workExperiences,
            //    JobTypes = jobTypes,
            //    Educations = education,
            //    Cities = cities,


            //};
            ViewBag.Category = await _context.Categories.ToListAsync();
            ViewBag.Position = await _context.Positions.ToListAsync();
            ViewBag.Language = await _context.Languages.ToListAsync();
            ViewBag.Education = await _context.Educations.ToListAsync();
            ViewBag.ExpeerienceYear = await _context.ExperienceYears.ToListAsync();
            ViewBag.WorkExperience = await _context.WorkExperiences.ToListAsync();
            ViewBag.City = await _context.Cities.ToListAsync();
            ViewBag.JobType = await _context.JobTypes.ToListAsync();
            return View(/*jobVM*/);
        }
        [HttpPost]
        public async Task<IActionResult> PostJob(JobVM job)
        {

            PostJob postJob = new PostJob
            {
                PhoneNumber = job.PhoneNumber,
                LanguageId = job.LanguageId,
                CategoryId = job.CategoryId,
                MaxAge = job.MaxAge,
                MinAge = job.MinAge,
                EducationId = job.EducationId,
                Email = job.Email,
                ExperienceYearId = job.ExperienceYearId,
                WorkExperienceId = job.WorkExperienceId,
                Salary = job.Salary,
                Website = job.Website,
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
