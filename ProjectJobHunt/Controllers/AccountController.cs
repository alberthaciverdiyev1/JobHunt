using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using ProjectJobHunt.DAL;
using ProjectJobHunt.Models;
using ProjectJobHunt.Utilities.Enums;
using ProjectJobHunt.ViewModels;
using System.Reflection.Metadata;

namespace ProjectJobHunt.Controllers
{
	public class AccountController : Controller
	{
		private readonly AppDbContext _context;
		private readonly UserManager<AppUser> _userManager;
		private readonly SignInManager<AppUser> _signInManager;
		private readonly IWebHostEnvironment _env;
		private readonly RoleManager<IdentityRole> _roleManager;

		public AccountController(
			AppDbContext context,
			UserManager<AppUser> userManager,
			SignInManager<AppUser> signInManager,
			IWebHostEnvironment env,
			RoleManager<IdentityRole> roleManager
			)
		{
			_context = context;
			_userManager = userManager;
			_signInManager = signInManager;
			_env = env;
			_roleManager = roleManager;
		}
		public IActionResult Register()
		{

			ViewBag.Professions = _context.Professions.ToList();


			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Register(RegisterVM register)
		{

			if (!ModelState.IsValid)
			{
				ViewBag.Professions = _context.Professions.ToList();

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
							ViewBag.Professions = _context.Professions.ToList();

							return View();
						}
					}
					else
					{
						ModelState.AddModelError(string.Empty, "Seklin formati duzgun deyil");
						ViewBag.Professions = _context.Professions.ToList();

						return View();
					}
				}

				AppUser user = new AppUser
				{


					Email = register.Email,
					Name = register.Name,
					Surname = register.Surname,
					UserName = register.UserName,
					UserProfession = register.ProfessionId,
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
				await _userManager.AddToRoleAsync(user,UserRole.Employer.ToString());
				}
				else
				{
					await _userManager.AddToRoleAsync(user, UserRole.Employee.ToString());

				}
				await _signInManager.SignInAsync(user, isPersistent: true);
			}
			else
			{
				ModelState.AddModelError(string.Empty, "This user already exists");
				ViewBag.Professions = _context.Professions.ToList();

				return View();

			}

			return RedirectToAction("Index", "Home");

		}
		public IActionResult Login()
		{


			return View();
		}
		[HttpPost]
		public async Task<IActionResult> Login(LoginVM login, string ReturnUrl)
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

			if (ReturnUrl != null) { return Redirect(ReturnUrl); }

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
		public async Task<IActionResult> CreateRole()
		{
			foreach (var role in Enum.GetValues(typeof(UserRole)))
			{
				if (!await _roleManager.RoleExistsAsync(role.ToString()))
				{
					await _roleManager.CreateAsync(new IdentityRole { Name = role.ToString() });

				}
			}
			return RedirectToAction("Index", "Home");


		}
	}
}
