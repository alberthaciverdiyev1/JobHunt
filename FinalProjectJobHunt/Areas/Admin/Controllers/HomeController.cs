using FinalProjectJobHunt.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;

namespace FinalProjectJobHunt.Areas.Admin.Controllers
{   
    public class HomeController : Controller
    {
        private readonly UserManager<AppUser> _usermanager;

        public HomeController(UserManager<AppUser> usermanager)
        {
            _usermanager = usermanager;
        }
        [Area("Admin")]
        public IActionResult Index()
        {

            string role = User.FindFirst(ClaimTypes.Role)?.Value;


            return View();
        }

        public IActionResult Messages()
        {
            return View();
        }

    }
}
