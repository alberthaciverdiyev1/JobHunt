using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using System.Reflection.Metadata;
using FinalProjectJobHunt.Utilities.Enums;

namespace JobHuntProject.Controllers
{
	public class AccountController : Controller
	{
		private readonly AppDbContext _context;
		private readonly UserManager<AppUser> _userManager;
		private readonly SignInManager<AppUser> _signInManager;
		private readonly IWebHostEnvironment _env;
		private readonly RoleManager<UserRole> _roleManager;

		public AccountController(
			AppDbContext context,
			UserManager<AppUser> userManager,
			SignInManager<AppUser> signInManager,
			IWebHostEnvironment env,
			RoleManager<UserRole> roleManager
			)
		{
			_context = context;
			_userManager = userManager;
			_signInManager = signInManager;
			_env = env;
			_roleManager = roleManager;
		}

	
		public async Task<IActionResult> CreateRole()
		{
			string[] rolenames = { UserRole.ADMIN, UserRole.MODERATOR, UserRole.EMPLOYEE, UserRole.EMPLOYER };
			foreach(var role in rolenames)
			{
				if (!await _roleManager.RoleExistsAsync(role))
				{
					await _roleManager.CreateAsync(new UserRole { Name = role });

				}
			}
			return RedirectToAction("Index", "Home");

		}
		public IActionResult Register()
		{
			
			ViewBag.Professions = _context.Positions.ToList();


			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Register(RegisterVM register)
		{

			if (!ModelState.IsValid)
			{
				ViewBag.Professions = _context.Positions.ToList();

				return View();
			}

			AppUser check = await _userManager.FindByNameAsync(register.UserName);
			if (check == null)
			{


				if (register.Photo != null)
				{

					if (register.Photo.ContentType.Contains("image/"))
					{
						if (register.Photo.Length < 1024 * 500)
						{
							string filename = Guid.NewGuid().ToString() + register.Photo.FileName;
							string path = Path.Combine(_env.WebRootPath, "assets/images/User", filename);
							FileStream stream = new FileStream(path, FileMode.Create);
							await register.Photo.CopyToAsync(stream);
							stream.Close();
							register.DateTime = DateTime.Now;
							register.ImageURL = filename;

						}
						else
						{
							ModelState.AddModelError(string.Empty, "Seklin olcusu 500kbdan boyuk ola bilmez");
							ViewBag.Professions = _context.Positions.ToList();

							return View();
						}
					}
					else
					{
						ModelState.AddModelError(string.Empty, "Seklin formati duzgun deyil");
						ViewBag.Professions = _context.Positions.ToList();

						return View();
					}
				}

				AppUser user = new AppUser
				{

					Email = register.Email,
					Name = register.Name,
					Surname = register.Surname,
					UserName = register.UserName,
					UserProfession = register.PositionId,
					ImageURL = register.ImageURL,
					CreatedAt = register.DateTime

				};
				IdentityResult result = await _userManager.CreateAsync(user, register.Password);
				if (!result.Succeeded)
				{
					foreach (var error in result.Errors)
					{
						ModelState.AddModelError(string.Empty, error.Description);
					}
				}
		
				if (register.Role == false) 
				{

					await _userManager.AddToRoleAsync(user,UserRole.EMPLOYER);
				}

				else 
				{
					await _userManager.AddToRoleAsync(user, UserRole.EMPLOYEE);
				}


					await _signInManager.SignInAsync(user, isPersistent: true);
				}
			else
			{
				ModelState.AddModelError(string.Empty, "This user already exists");
				ViewBag.Professions = _context.Positions.ToList();

				return View();

			}

			return RedirectToAction("Index", "Home");

		}
		public IActionResult Login()
		{


			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Login(LoginVM login, string? ReturnUrl)
		{
			if (!ModelState.IsValid)
			{
				ModelState.AddModelError(string.Empty, "Username , Email or Password is Inccorrect");
				return View();
			}
			AppUser user = await _userManager.FindByNameAsync(login.UsernameOrEmail);
			if (user == null)
			{
				user = await _userManager.FindByEmailAsync(login.UsernameOrEmail);
				if (user == null)
				{
					ModelState.AddModelError(string.Empty, "Username , Email or Password is Inccorrect");
					return View();
				}
			}
			var result = await _signInManager.PasswordSignInAsync(user, login.Password, login.RememberMe, false);
			if (!result.Succeeded)
			{
				ModelState.AddModelError(string.Empty, "Username , Email or Password is Inccorrect");
			}

			if (!string.IsNullOrEmpty(ReturnUrl) && Url.IsLocalUrl(ReturnUrl))
			{
				return LocalRedirect(ReturnUrl);
			}
		
				return RedirectToAction("Index", "Home");
			



		}
		public async Task<IActionResult> Logout()
		{
			await _signInManager.SignOutAsync();


			return RedirectToAction("Index", "Home");

		}
		public IActionResult ForgotPassword()
		{
			return View();
		}

	}
}
