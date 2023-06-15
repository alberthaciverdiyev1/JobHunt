using ProjectJobHunt.Models.Job;
using System.ComponentModel.DataAnnotations;

namespace ProjectJobHunt.Models
{
    public class Category : BaseEntity
    {
        [Required]
        public string Icon { get; set; }
        [Required]
        public string Name { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<Position>? Positions { get; set; }
        public List<Try>? Try { get; set; }

    }
}
