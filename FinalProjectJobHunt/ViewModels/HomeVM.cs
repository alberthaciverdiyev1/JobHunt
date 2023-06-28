using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;

namespace FinalProjectJobHunt.Models
{
    public class HomeVM
    {
        public List<Category>? Categories { get; set; }
        public List<Blog>? Blogs { get; set; }
        public List<City>? Cities { get; set; }
        public List<AppUser>? Users { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }
        public List<Position>? Positions { get; set; }



    }
}
