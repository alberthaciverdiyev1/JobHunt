using FinalProjectJobHunt.Models;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.ViewModels
{
    public class MessagesVM
    {
      
       
        public string? Description { get; set; }
        public int? SenderId { get; set; }
        public int? ReceiverId { get; set; }
        public List<Message>? SendMessages { get; set; }
        public List<Message>? RecieveMessages { get; set; }
        public List<Position>? Positions { get; set; }
        public List<AppUser>? AppUsers { get; set; }
        public List<Category>? Categories { get; set; }
    }
}
