using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.Models
{
    public class Category : BaseEntity
    {
        [Required]
        public string Icon { get; set; }
        [Required]
        public string Name { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<Position>? Positions { get; set; }
        public List<AppUser>? AppUsers { get; set; }

	}
}
