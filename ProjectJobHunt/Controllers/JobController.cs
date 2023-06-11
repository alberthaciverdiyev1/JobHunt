using Microsoft.AspNetCore.Mvc;

namespace ProjectJobHunt.Controllers
{
    public class JobController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult PostJob()
        {
            return View();
        }
    }
}
