using System.ComponentModel.DataAnnotations;

namespace ProjectJobHunt.Models
{
    public class Category:BaseEntity
    {
        [Required]
        public string Icon { get; set; }
        [Required]
        public string Name { get; set; }
    }
}
