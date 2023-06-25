using FinalProjectJobHunt.Models.Job;

namespace FinalProjectJobHunt.Models
{
	public class BasketItem:BaseEntity
	{
		public int? AppUserId { get; set; }
		public AppUser? AppUser { get; set; }
		public int? UserPostJobId { get; set; }
		public UserPostJob? UserPostJob { get; set; }
		public int? PostJobId { get; set; }
		public PostJob? PostJob { get; set; }
	}
}
