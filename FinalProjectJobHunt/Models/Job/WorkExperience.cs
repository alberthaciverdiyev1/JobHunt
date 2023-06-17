namespace FinalProjectJobHunt.Models
{
    public class WorkExperience:BaseEntity
    {
        public string Experience { get; set; }

        public List<PostJob>? PostJobs { get; set; }
    }
}
