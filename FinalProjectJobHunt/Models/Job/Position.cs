
using FinalProjectJobHunt.Models.Job;
using FinalProjectJobHunt.ViewModels;
using System.ComponentModel.DataAnnotations;


namespace FinalProjectJobHunt.Models
{
    public class Position : BaseEntity
    {
        [Required]
        public string PositionName { get; set; }
        public Category? Category { get; set; }
        [Required]
        public int? CategoryId { get; set; }

        public List<PostJob>? PostJobs { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }



    }
}
