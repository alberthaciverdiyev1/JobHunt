
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.ViewModels
{
    public class UserPostJobVM
    {
        private sbyte _minAge = 16;

        public List<Category>? Category { get; set; }
        public List<Position>? Positions { get; set; }
        public List<City>? Cities { get; set; }
        public List<Education>? Educations { get; set; }
        public List<Language>? Languages { get; set; }
        public List<JobType>? JobTypes { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }
        public List<AppUser>? AppUsers { get; set; }
        public List<WorkExperience>? WorkExperiences { get; set; }

        [Required]
        public int CategoryId { get; set; }
        [Required]
        public int PositionId { get; set; }
        public int CityId { get; set; }
        public int? LanguageId { get; set; }
        public int? EducationId { get; set; }
        [Range(0.01, double.MaxValue, ErrorMessage = "Salary Must Be Greater Than Zero")]
        public decimal? Salary { get; set; }
        public int? Experience { get; set; }
        public int? WorkExperienceId { get; set; }
        [Required]
        [MaxLength(13)]
        [MinLength(13)]
        public string PhoneNumber { get; set; }
        [DataType(DataType.EmailAddress)]
        public string? Email { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        [Range(16, 90, ErrorMessage = "Age Must Be Between 16 and 90")]

        public sbyte Age { get; set; }

        public DateTime Created { get; set; }
        [Required]
        public int JobTypeId { get; set; }
        public JobType? JobType { get; set; }

        public string? Search;
        public int? categoryId;
        public int? Order;
        public int? City;
        public int?[] Jobtype;
        public int? salary;
        public int? ExperienceId;
    }
}
