namespace FinalProjectJobHunt.Models.Job
{
    public class UserPostJob:BaseEntity
    {
        public int CategoryId { get; set; }
        public Category? Category { get; set; }

        public int JobTypeId { get; set; }
        public JobType? JobType { get; set; }
        public int PositionId { get; set; }

        public int? Experience { get; set; }
        public int? WorkExperienceId { get; set; }
        public WorkExperience? WorkExperience { get; set; }
        public decimal? Salary { get; set; }
        public int? CityId { get; set; }
        public City? City { get; set; }

        public int? EducationId { get; set; }
        public Education? Education { get; set; }

        public int? LanguageId { get; set; }
        public Language? Language { get; set; }
        public string PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string Description { get; set; }
        public int Age { get; set; }
        public DateTime Created { get; set; }
        public int AppUserId { get; set; }
        public AppUser? AppUser { get; set; }
        public List<BasketItem>? BasketItems { get; set; }
    }
}
