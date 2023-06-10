using Microsoft.AspNetCore.Mvc;

namespace ProjectJobHunt.Controllers
{
    public class CandidateController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
