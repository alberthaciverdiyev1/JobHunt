using FinalProjectJobHunt.Models.Job;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.Models
{
    public class AppUser : IdentityUser<int>
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public override int Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int? UserProfession { get; set; }
        public string? ImageURL { get; set; }
        public DateTime CreatedAt { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }

    }
}
