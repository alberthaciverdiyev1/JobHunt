using Microsoft.AspNetCore.Identity;

namespace JobHuntProject.Models
{
    public class UserRole:IdentityRole<int>
    {

        public const string Admin = "Admin";
        public const string Employee = "Employee";
        public const string Employer = "Employer";
        public const string Moderator = "Moderator";
    }
}
