using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;
using FinalProjectJobHunt.Utilities.Exceptions;
using FinalProjectJobHunt.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata;
using System.Security.Claims;

namespace FinalProjectJobHunt.Controllers
{
    public class MessageController : Controller
    {
        private readonly AppDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public MessageController(AppDbContext context, UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }
        public async Task<IActionResult> Index()
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            List<Message>recievemessages = await _context.Messages.Where(u => u.ReceiverId == user.Id).ToListAsync();
            List<Message>sendmessages = await _context.Messages.Where(u => u.SenderId == user.Id).ToListAsync();
            List<Position> positions = await _context.Positions.ToListAsync();
            List<AppUser> users = await _context.Users.ToListAsync();
            List<Category> categories = await _context.Categories.ToListAsync();


            MessagesVM messagesVM = new MessagesVM
            {
                RecieveMessages = recievemessages,
                SendMessages = sendmessages,
                AppUsers = users,
                Positions = positions,
                Categories = categories,
                ReceiverId=user.Id,
                SenderId=user.Id

            };


            return View(messagesVM);
        }
        public async Task<IActionResult> SendMessage(MessagesVM send)
        {
            var sender = await _context.Users.FirstOrDefaultAsync(u => u.UserName == User.Identity!.Name);
            var receiver = await _context.Users.FirstOrDefaultAsync(u => u.Id == send.ReceiverId);
            string? role = User.FindFirst(ClaimTypes.Role)?.Value;
            if (role == "EMPLOYEE")
            {
                var job = await _context.UserPostJobs.FirstOrDefaultAsync(x => x.AppUserId == send.ReceiverId);

                if (job == null || sender == null || receiver == null) { return NotFound(); }
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
                    PositionId = job.PositionId,
                    CategoryId = job.CategoryId,
                    Created = DateTime.Now,
                    UserPostJobId = job.id,

                };
                await _context.Messages.AddAsync(message);
            }
            else
            {
                var job = await _context.PostJobs.FirstOrDefaultAsync(x => x.AppUserId == send.ReceiverId);
                var userPostJob = _context.UserPostJobs.FirstOrDefault(x => x.AppUserId == sender.Id);
                if (job == null || sender == null || receiver == null) { return NotFound(); }

                Message message = new Message
                {
                    SenderName = sender.UserName,
                    SenderEmail = sender.Email,
                    SenderId = sender.Id,
                    SenderPhone = sender.Phone,
                    Description = send.Description,
                    ReceiverId = receiver.Id,
                    ReceiverName = receiver.UserName,
                    ReceiverEmail = receiver.Email,
                    ReceiverPhone = receiver.Phone,
                    PositionId = job.PositionId,
                    CategoryId = job.CategoryId,
                    PostJobId = job.id,
                    Created = DateTime.Now
                };
                await _context.Messages.AddAsync(message);
            }

            if (!ModelState.IsValid)
            {
                return View();
            }
            if (sender.Id == receiver.Id)
            {
                ModelState.AddModelError(string.Empty, "It Is Your Job");
                return View();
            }
            await _context.SaveChangesAsync();

            return View();
        }
        public IActionResult Delete(int? id)
        {
            if (id == null || id < 0) throw new BadRequestException("No Message Found With This ID");

            var message = _context.Messages.FirstOrDefault(x => x.id == id);
            if (message == null) throw new NotFoundException("We Could Not Find This Message");
            _context.Messages.Remove(message);
            _context.SaveChanges();
            return RedirectToAction("Index", "Message");
        }

    }
}
