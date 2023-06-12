using ProjectJobHunt.Models;
using ProjectJobHunt.Models.Job;

namespace ProjectJobHunt.ViewModels
{
    public class HomeVM
    {
        public List<Category> Categories { get; set; }
        public List<Blog> Blogs { get; set; }
        public List<AppUser> Users { get; set; }


    }
}
