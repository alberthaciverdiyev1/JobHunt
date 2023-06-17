using FinalProjectJobHunt.Models;

namespace FinalProjectJobHunt.Models
{
    public class City:BaseEntity
    {
        public string CityName { get; set; }
       public List<PostJob>? PostJobs { get; set;}
    }
}
