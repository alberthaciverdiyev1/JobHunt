namespace FinalProjectJobHunt.ViewModels
{
	public class BasketItemVM
    {
        public int Id { get; set; }
        public string? Category { get; set; }
        public string? Position { get; set; }
        public string? Image { get; set; }
        public decimal Salary { get; set; }
        public int Count { get; set; }
        public int? UserPostJobId { get; set; }
        public int? PostJobId { get; set; }

    }
}
