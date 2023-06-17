using Microsoft.AspNetCore.Mvc;

namespace JobHuntProject.Utilities.Extentions
{
    public static class CheckExtentions
    {
        public static IActionResult CheckID(this Controller controller,int? id)
        {
            if (id < 1 || id == null) return controller.RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            return null;
        }
    
        public static IActionResult CheckDbContext<T>(this Controller controller,T context) {

            if (context == null) return controller.RedirectToAction("Error", "Home", new { area = "ProjectJobHunt" });
            return null;
        }
    }
}
