using FinalProjectJobHunt.Models;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FinalProjectJobHunt.ViewModels
{
    public class RegisterVM:BaseEntity
    {
        [Required]
        [MaxLength(50,ErrorMessage = "The Name Is Too Long")]
        [MinLength(3,ErrorMessage = "Name Can't Be Shorter Than Three Letters")]
        public string Name { get; set; }
        [Required]

        [MaxLength(50, ErrorMessage = "The Surname Is Too Long")]
        [MinLength(3, ErrorMessage = "Surname Can't Be Shorter Than Three Letters")]
        public string Surname { get; set; }
        [Required]
        [MaxLength(20, ErrorMessage = "The Name Is Too Long")]
        [MinLength(3, ErrorMessage = "Name Can't Be Shorter Than Three Letters")]
        public string UserName { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [Compare(nameof(Password))]
        public string ConfirmPassword { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        public bool RememberMe { get; set; }
        public string? ImageURL { get; set; }
        [NotMapped]
        public IFormFile? Photo { get; set; }
        public int PositionId { get; set; }
        public Position? Position { get; set; }
        [Required(ErrorMessage ="Role Is Required")]
        public bool Role { get; set; }
        public DateTime DateTime = DateTime.Now;


    }
}
