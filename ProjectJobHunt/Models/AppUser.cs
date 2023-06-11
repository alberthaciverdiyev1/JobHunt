using Microsoft.AspNetCore.Identity;

namespace ProjectJobHunt.Models
{
    public class AppUser:IdentityUser
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public int? UserProfession { get; set; }
        public string? ImageURL { get; set; }
        public DateTime CreatedAt { get; set; }

    }
}
