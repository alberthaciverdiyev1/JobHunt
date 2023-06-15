using Job.Models;

namespace Job.Models
{
    public class City:BaseEntity
    {
        public string CityName { get; set; }
       public List<PostJob>? PostJobs { get; set;}
    }
}
