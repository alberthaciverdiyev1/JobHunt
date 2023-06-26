using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace FinalProjectJobHunt.Controllers
{
    public class MessageController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public MessageController(AppDbContext context,UserManager<AppUser>userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            List<Message> messages = await _context.Messages.Where(u=>u.ReceiverId==user.Id).ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<AppUser> users = await _context.Users.ToListAsync();
            List<Category> categories = await _context.Categories.ToListAsync();

            MessagesVM messagesVM = new MessagesVM
            {
                Messages = messages,
                AppUsers = users,
                Positions = positions,
                Categories = categories,

            };


            return View(messagesVM);
        }
        public async Task<IActionResult> SendMessage(MessagesVM send)
        {
            var sender = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            var receiver = await _context.Users.FirstOrDefaultAsync(u => u.Id == send.ReceiverId);
            var job = await _context.UserPostJobs.FirstOrDefaultAsync(x => x.AppUserId == send.ReceiverId);
            if(!ModelState.IsValid)
            {
                return View();
            }

            if (receiver != null)
            {
               
                Message message = new Message
                {
                    SenderName = sender.UserName,
                    ReceiverName = receiver.UserName,
                    ReceiverEmail = receiver.Email,
                    SenderEmail = sender.Email,
                    ReceiverId = receiver.Id,
                    SenderId = sender.Id,
                    SenderPhone = sender.Phone,
                    ReceiverPhone = receiver.Phone,
                    Description = send.Description,
                    PositionId=job.PositionId,
                    CategoryId=job.CategoryId,
                    Created = DateTime.Now
                };

                await _context.Messages.AddAsync(message);
                await _context.SaveChangesAsync();

                return View(); // Assuming you have a view named "Success.cshtml" to show the success message
            }
            else
            {
                return View("Error"); // Assuming you have a view named "Error.cshtml" to show an error message if the receiver is not found
            }
        }

    }
}
