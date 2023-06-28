using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;

namespace FinalProjectJobHunt.ViewModels
{
    public class ProfileVM
    {
        public string? Name { get; set; }
        public string? Surname { get; set; }
        public int? UserProfession { get; set; }
        public string? UserEmail { get; set; }
        public byte? Age { get; set; }
        public string? Phone { get; set; }
        public string? Description { get; set; }
        public string? Username { get; set; }
        public string? ImageURL { get; set; }
        public IFormFile? Photo { get; set; }
        public DateTime CreatedAt { get; set; }
        public int? CategoryId { get; set; }
        public Category? Category { get; set; }
        public int? EducationId { get; set; }
        public Education? Education { get; set; }

        //Bunlar Userin Paylasigi isleri gormek ucundur
        public List<PostJob>? PostJobs { get; set; }
        public List<UserPostJob>? UserPostJobs { get; set; }
        public List<Position>? Positions { get; set; }
        public List<Category> Categories { get; set; }



    }
}
