namespace ProjectJobHunt.Models.Job
{
    public class WorkExperience:BaseEntity
    {
        public string Experience { get; set; }

        public List<AppUser>? AppUsers { get; set; }
    }
}
