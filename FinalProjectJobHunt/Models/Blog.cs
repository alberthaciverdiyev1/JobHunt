using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace FinalProjectJobHunt.Models
{
    public class Blog:BaseEntity
    {
        [Required] 
        public string? Title { get; set; }
        [Required]

        public string? Description { get; set; }

        public string? ImageURL { get; set; }
        [NotMapped]
        public IFormFile? Photo { get; set; }
        public DateTime DateTime { get; set; }
    }
}
