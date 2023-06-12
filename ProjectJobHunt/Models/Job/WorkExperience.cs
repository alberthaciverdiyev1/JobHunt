namespace ProjectJobHunt.Models.Job
{
    public class WorkExperience:BaseEntity
    {
        public string Experience { get; set; }

        public List<PostJob>? PostJobs { get; set; }
    }
}
