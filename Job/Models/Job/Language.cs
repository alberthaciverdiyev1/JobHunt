namespace Job.Models
{
    public class Language:BaseEntity
    {
        public string LanguageName { get; set; }
        public List<PostJob> PostJobs { get; set; }
    }
}
