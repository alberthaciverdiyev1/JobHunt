
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.ViewModels
{
    public class ForgotPasswordVM
    {
        [Required,MaxLength(100)]
        public string? Email { get; set; }
    }
}
