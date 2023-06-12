using System.ComponentModel.DataAnnotations;

namespace ProjectJobHunt.Models.Job
{
    public class PostJob:BaseEntity
    {

        [Required]
        public int CategoryId { get; set; }
        public Category? Category { get; set; }
        [Required]
        public int JobTypeId { get; set; }
        public JobType? JobType { get; set; }
       
        public int ExperienceYearId { get; set; }
        public ExperienceYear? ExperienceYear { get; set; }
        public int WorkExperienceId { get; set; }
        public WorkExperience? WorkExperience { get; set; }
        public decimal? Salary { get; set; }




    }
}
