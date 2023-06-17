using Microsoft.AspNetCore.Identity;

namespace FinalProjectJobHunt.Models
{
    public class UserRole:IdentityRole<int>
    {

        public const string ADMIN = "ADMIN";
        public const string EMPLOYEE = "EMPLOYEE";
        public const string EMPLOYER = "EMPLOYER";
        public const string MODERATOR = "MODERATOR";
    }
}
