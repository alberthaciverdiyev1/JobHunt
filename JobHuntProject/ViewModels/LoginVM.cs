using JobHuntProject.Models;
using System.ComponentModel.DataAnnotations;

namespace JobHuntProject.ViewModels
{
    public class LoginVM:BaseEntity
    {
        public string UsernameOrEmail { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; }
        public bool RememberMe { get; set; }
    }
}
