namespace ProjectJobHunt.Models.Job
{
	public class Experience:BaseEntity
	{
        public string  Junior { get; set; }
        public string  Middle { get; set; }
        public string Internship  { get; set; }
        public string  Senior { get; set; }
       public List<AppUser>? AppUsers { get; set; }
	}
}



