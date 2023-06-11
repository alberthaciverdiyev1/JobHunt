using ProjectJobHunt.ViewModels;

namespace ProjectJobHunt.Models
{
    public class Profession:BaseEntity
    {
        public string ProfessionName { get; set; }
        public List<RegisterVM> RegisterVMs { get; set; }
    }
}
