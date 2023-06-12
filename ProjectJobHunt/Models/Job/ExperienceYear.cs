using ProjectJobHunt.Models.Job;

namespace ProjectJobHunt.Models
{
    public class ExperienceYear:BaseEntity
    {
        public int Year { get; set; }
        public List<PostJob>? PostJobs { get; set; }

    }
}
