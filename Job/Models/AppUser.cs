using Job.Models.Job;
using Microsoft.AspNetCore.Identity;

namespace Job.Models
{
    public class AppUser:IdentityUser
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public int? UserProfession { get; set; }
        public string? ImageURL { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<UserPostJob>?UserPostJobs { get; set; }

    }
}
