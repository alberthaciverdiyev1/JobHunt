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
        public byte? Age { get; set; }
        public string? Phone { get; set; }
        public string? Description { get; set; }
        public string? ImageURL { get; set; }
        public DateTime CreatedAt { get; set; }
        public int? CategoryId { get; set; }
        public Category? Category { get; set; }
        public int? EducationId { get; set; }
        public Education? Education { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<BasketItem>? BasketItems { get; set; }

    }
}
