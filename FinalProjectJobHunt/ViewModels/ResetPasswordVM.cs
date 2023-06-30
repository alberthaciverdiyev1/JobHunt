using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.ViewModels
{
    public class ResetPasswordVM
    {
        [Required,DataType(DataType.Password)]
        public string? NewPassword { get; set; }
        [Required, DataType(DataType.Password),Compare(nameof(NewPassword))]
        public string? ConfirmPassword { get; set; }
    }
}
