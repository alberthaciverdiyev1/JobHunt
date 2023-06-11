
using System.ComponentModel.DataAnnotations;
using ProjectJobHunt.Models;

namespace ProjectJobHunt.Models
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
