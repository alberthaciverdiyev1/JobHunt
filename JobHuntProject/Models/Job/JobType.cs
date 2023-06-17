using JobHuntProject.Models;

namespace JobHuntProject.Models
{
    public class JobType:BaseEntity
    {
        public string WorkType { get; set; }
        public List<PostJob>? PostJobs { get; set; }
    }
}
