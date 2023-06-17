
using JobHuntProject.ViewModels;
using System.ComponentModel.DataAnnotations;


namespace JobHuntProject.Models
{
    public class Position : BaseEntity
    {
        [Required]
        public string PositionName { get; set; }
        public Category? Category { get; set; }
        [Required]
        public int CategoryId { get; set; }

    }
}
