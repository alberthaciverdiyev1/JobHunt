
using ProjectJobHunt.ViewModels;
using System.ComponentModel.DataAnnotations;


namespace ProjectJobHunt.Models
{
    public class Position : BaseEntity
    {
        [Required]
        public string PositionName { get; set; }
        public Category? Category { get; set; }
        [Required]
        public int CategoryId { get; set; }
        public List<RegisterVM> RegisterVMs { get; set; }

    }
}
