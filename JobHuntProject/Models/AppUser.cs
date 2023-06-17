using JobHuntProject.Models.Job;
using Microsoft.AspNetCore.Identity;

namespace JobHuntProject.Models
{
    public class AppUser:IdentityUser<int>
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public int? UserProfession { get; set; }
        public string? ImageURL { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<UserPostJob>?UserPostJobs { get; set; }

    }
}
