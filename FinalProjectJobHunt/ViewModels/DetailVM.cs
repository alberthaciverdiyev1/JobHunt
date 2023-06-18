using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;

namespace FinalProjectJobHunt.ViewModels
{
	public class DetailVM
	{
		public List<Category>? Categories { get; set; }
		public List<Position>? Positions { get; set; }
		public List<City>? Cities { get; set; }
		public List<Education>? Educations { get; set; }
		public List<Language>? Languages { get; set; }
		public List<JobType>? JobTypes { get; set; }
		public List<PostJob>? PostJobs { get; set; }
		public List<UserPostJob>? UserPostJobs { get; set; }
		public List<WorkExperience>? WorkExperiences { get; set; }

		public AppUser AppUser { get; set; }
		public UserPostJob UserPostJob { get; set; }
		public PostJob PostJob { get; set; }
        public Position Position { get; set; }

    }
}
