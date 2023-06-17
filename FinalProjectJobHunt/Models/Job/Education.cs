using FinalProjectJobHunt.Models;

namespace FinalProjectJobHunt.Models
{
    public class Education:BaseEntity
    {
        public string EducationName { get; set; }
        public List<PostJob>? PostJobs { get; set; }
    }
}
