
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
        public int CategoryId { get; set; }
        public int? UserPostJobId { get; set; }
        public UserPostJob? UserPostJob { get; set; }
        public int? PostJobId { get; set; }
        public PostJob? PostJob { get; set; }




    }
}
