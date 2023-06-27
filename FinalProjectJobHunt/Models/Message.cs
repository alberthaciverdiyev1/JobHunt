using FinalProjectJobHunt.Models.Job;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.Models
{
    public class Message:BaseEntity
    {

        public string SenderName { get; set; }
        [DataType(DataType.EmailAddress)]
        public string SenderEmail { get; set; }
        
        public string? SenderPhone { get; set; }
        public string ReceiverName { get; set; }
        [DataType(DataType.EmailAddress)]
        public string ReceiverEmail { get; set; }

        public string? ReceiverPhone { get; set; }
        public string Description { get; set; }
        public DateTime? Created { get; set; }

        public int? SenderId { get; set; }
        public int? ReceiverId { get; set; }
        public int? PositionId { get; set; }
        public int? CategoryId { get; set; }
        public int? PostJobId { get; set; }
        public int? UserPostJobId { get; set; }


    }
}
