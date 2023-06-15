using Job.Models;

namespace Job.Models
{
    public class Education:BaseEntity
    {
        public string EducationName { get; set; }
        public List<PostJob>? PostJobs { get; set; }
    }
}
