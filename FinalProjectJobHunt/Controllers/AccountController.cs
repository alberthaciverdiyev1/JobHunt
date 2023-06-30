using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using System.Reflection.Metadata;
using FinalProjectJobHunt.Utilities.Enums;
using FinalProjectJobHunt.Interfaces;

namespace JobHuntProject.Controllers
{
    public class AccountController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;
        private readonly SignInManager<AppUser> _signInManager;
        private readonly IWebHostEnvironment _env;
        private readonly RoleManager<UserRole> _roleManager;
        private readonly IEmailService _emailService;

        public AccountController(
            AppDbContext context,
            UserManager<AppUser> userManager,
            SignInManager<AppUser> signInManager,
            IWebHostEnvironment env,
            RoleManager<UserRole> roleManager,
             IEmailService emailService
)
        {
            _context = context;
            _userManager = userManager;
            _signInManager = signInManager;
            _env = env;
            _roleManager = roleManager;
            _emailService = emailService;
        }


        //public async Task<IActionResult> CreateRole()
        //{
        //	string[] rolenames = { UserRole.ADMIN, UserRole.MODERATOR, UserRole.EMPLOYEE, UserRole.EMPLOYER };
        //	foreach(var role in rolenames)
        //	{
        //		if (!await _roleManager.RoleExistsAsync(role))
        //		{
        //			await _roleManager.CreateAsync(new UserRole { Name = role });

        //		}
        //	}
        //	return RedirectToAction("Index", "Home");

        //}
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
                else
                {
                    string filename = "NoImage.png";

                    register.DateTime = DateTime.Now;
                    register.ImageURL = filename;
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
                    ViewBag.Professions = _context.Positions.ToList();

                    return View();

                }
                else
                {
                    if (register.Role == false)
                    {

                        await _userManager.AddToRoleAsync(user, UserRole.EMPLOYER);
                    }

                    else
                    {
                        await _userManager.AddToRoleAsync(user, UserRole.EMPLOYEE);
                    }


                    var token = await _userManager.GenerateEmailConfirmationTokenAsync(user);
                    var confirmationLink = Url.Action(nameof(ConfirmEmail), "Account", new { token, Email = user.Email }, Request.Scheme);

                    await _emailService.SendEmail(user.Email, "Email Confirmation", confirmationLink);
                }


                //await _signInManager.SignInAsync(user,false);

                return RedirectToAction(nameof(SuccessfullyRegistered), "Account");
            }
            else
            {
                ModelState.AddModelError(string.Empty, "This user already exists");
                ViewBag.Professions = _context.Positions.ToList();

                return View();

            }
        }
        public async Task<IActionResult> ConfirmEmail(string token, string email)
        {
            AppUser user = await _userManager.FindByEmailAsync(email);
            if (user == null) return NotFound();
            var result = await _userManager.ConfirmEmailAsync(user, token);

            if (!result.Succeeded)
            {
                return BadRequest();
            }
            await _signInManager.SignInAsync(user, false);
            return View();
        }

        public IActionResult SuccessfullyRegistered()
        {
            return View();
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
                ModelState.AddModelError(string.Empty, "Username, Email or Password is Incorrect");
                return View();
            }

            AppUser user = await _userManager.FindByNameAsync(login.UsernameOrEmail);
            if (user == null)
            {
                user = await _userManager.FindByEmailAsync(login.UsernameOrEmail);
                if (user == null)
                {
                    ModelState.AddModelError(string.Empty, "Username, Email or Password is Incorrect");
                    return View();
                }
            }
            if (!user.EmailConfirmed)
            {
                ModelState.AddModelError(String.Empty, "Please confirm your email");
                return View();

            }
            var result = await _signInManager.PasswordSignInAsync(user, login.Password, login.RememberMe, false);
            if (!result.Succeeded)
            {
                ModelState.AddModelError(string.Empty, "Username, Email or Password is Incorrect");
                return View();
            }

            DateTime dateTime = DateTime.Now;
            string body = $@"<!DOCTYPE html>
                                         <html>
                                         <head>
                                             <title>Security Warning</title>
                                             <style>
                                                 body {{
                                                     font-family: Arial, sans-serif;
                                                     background-color: #f9f9f9;
                                                     margin: 0;
                                                     padding: 0;
                                                 }}
                                                 
                                                 .container {{
                                                     max-width: 600px;
                                                     margin: 20px auto;
                                                     background-color: #ffffff;
                                                     padding: 20px;
                                                     border-radius: 5px;
                                                     box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                                 }}
                                                 
                                                 h1 {{
                                                     font-size: 24px;
                                                     color: #ff0000;
                                                     margin-top: 0;
                                                 }}
                                                 
                                                 p {{
                                                     font-size: 16px;
                                                     color: #333333;
                                                 }}
                                             </style>
                                         </head>
                                         <body>
                                             <div class=""container"">
                                                 <h1>Security Warning</h1>
                                                 <p>You logged in on <span>{dateTime}</span>.</p>
                                             </div>
                                         </body>
                                         </html>
                                         ";
            await _emailService.SendEmail(user.Email, "Security Warning", body, true);

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
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgotPassword(ForgotPasswordVM forgotPassword)
        {

            if (!ModelState.IsValid) return View(forgotPassword);
            AppUser user = await _userManager.FindByEmailAsync(forgotPassword.Email);
            if (user == null)
            {

                user = await _userManager.FindByNameAsync(forgotPassword.Email);
                if (user == null)
                {
                    ModelState.AddModelError(string.Empty, "Username, Email or Password is Incorrect");
                    return View();
                }

            }

            string token = await _userManager.GeneratePasswordResetTokenAsync(user);
            string link = Url.Action("ResetPassword", "Account", new { userId = user.Id, token = token }, HttpContext.Request.Scheme);
            string body = $@"<!DOCTYPE html>
                                         <html>
                                         <head>
                                             <title>Security Warning</title>
                                             <style>
                                                 body {{
                                                     font-family: Arial, sans-serif;
                                                     background-color: #f9f9f9;
                                                     margin: 0;
                                                     padding: 0;
                                                 }}
                                                 
                                                 .container {{
                                                     max-width: 600px;
                                                     margin: 20px auto;
                                                     background-color: #ffffff;
                                                     padding: 20px;
                                                     border-radius: 5px;
                                                     box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                                                 }}
                                                 
                                                 h1 {{
                                                     font-size: 24px;
                                                     color: #ff0000;
                                                     margin-top: 0;
                                                 }}
                                                 
                                                 p {{
                                                     font-size: 16px;
                                                     color: #333333;
                                                 }}
                                             </style>
                                         </head>
                                         <body>
                                             <div class=""container"">
                                                 <h1>Security Warning</h1>
                                                 <p>You logged in on <span>{link}</span>.</p>
                                             </div>
                                         </body>
                                         </html>
                                         ";
            await _emailService.SendEmail(user.Email, "Reset Password", body, true);
            return RedirectToAction(nameof(Login));
        }
        public async Task<IActionResult> ResetPassword(string userId, string token)
        {
            if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(token)) return BadRequest();
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return NotFound();
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> ResetPassword(ResetPasswordVM resetPassword, string userId, string token)
        {
            if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(token)) return BadRequest();
            if (!ModelState.IsValid) return View(resetPassword);
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null) return NotFound();
            var identityUser = await _userManager.ResetPasswordAsync(user, token, resetPassword.ConfirmPassword);
            return RedirectToAction(nameof(Login));


        }


    }
}
