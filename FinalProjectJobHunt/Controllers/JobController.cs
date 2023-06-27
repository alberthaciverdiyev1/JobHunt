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
		public async Task<IActionResult> Index(int page)
		{

			ViewBag.Page = page;
			ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);

			List<Category> categories = await _context.Categories.ToListAsync();
			List<Position> positions = await _context.Positions.ToListAsync();
			List<AppUser> users = await _context.Users.ToListAsync();
			List<City> cities = await _context.Cities.ToListAsync();
            List<JobType> jobTypes = await _context.JobTypes.ToListAsync();
            List<PostJob> postJobs = await _context.PostJobs
				.Include(x => x.JobType).Skip(page * 6).Take(6)
				.Include(x => x.City)
				.Include(x => x.Category).ToListAsync();
      
            PostJobVM jobVM = new PostJobVM
			{
				Category = categories,
				Positions = positions,
				PostJobs = postJobs,
				AppUsers = users,
				Cities = cities,
                JobTypes= jobTypes

            };

			return View(jobVM);
		}

		public async Task<IActionResult> UserIndex(int page, string jobType)
		{
			ViewBag.Page = page;
			ViewBag.Total = Math.Ceiling((decimal)_context.PostJobs.Count() / 6);

			IQueryable<UserPostJob> postJobsQuery = _context.UserPostJobs
				.Include(x => x.JobType)
				.Include(x => x.City)
				.Include(x => x.Category);

			if (!string.IsNullOrEmpty(jobType))
			{
				postJobsQuery = postJobsQuery.Where(x => x.JobType.WorkType == jobType);
			}

			List<UserPostJob> postJobs = await postJobsQuery.ToListAsync();

			List<Category> categories = await _context.Categories.ToListAsync();
			List<Position> positions = await _context.Positions.ToListAsync();
			List<AppUser> users = await _context.Users.ToListAsync();
			List<City> cities = await _context.Cities.ToListAsync();
			List<JobType> jobTypes = await _context.JobTypes.ToListAsync();

			UserPostJobVM jobVM = new UserPostJobVM
			{
				Category = categories,
				Positions = positions,
				UserPostJobs = postJobs,
				AppUsers = users,
				Cities = cities,
				JobTypes = jobTypes,
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
			List<WorkExperience> workExperiences = _context.WorkExperiences.ToList();
			List<JobType> jobTypes = _context.JobTypes.ToList();
			PostJobVM jobVM = new PostJobVM
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
		public async Task<IActionResult> PostJob(PostJobVM job)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
				return View();
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

			if (!ModelState.IsValid)
			{
				ModelState.AddModelError(string.Empty, "Bu Model State Errorudur");
				return View();
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
        public async Task<IActionResult> Search(string searchText, int cityId, string[] jobTypes)
        {
            List<Category> categories = await _context.Categories.ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<AppUser> users = await _context.Users.ToListAsync();
            List<City> cities = await _context.Cities.ToListAsync();

            var query = _context.PostJobs
                .Include(x => x.JobType)
                .Include(x => x.City)
                .Include(x => x.Category)
                .Where(x => x.Description.Contains(searchText));

            if (cityId != 0)
            {
                query = query.Where(x => x.CityId == cityId);
            }

            if (jobTypes != null && jobTypes.Length > 0)
            {
                query = query.Where(x => jobTypes.Contains(x.JobType.WorkType));
            }

            List<PostJob> searchResults = await query.ToListAsync();

            PostJobVM jobVM = new PostJobVM
            {
                Category = categories,
                Positions = positions,
                PostJobs = searchResults,
                AppUsers = users,
                Cities = cities
            };

            return PartialView("_SearchResultsPartial", jobVM);
        }



    }


}
