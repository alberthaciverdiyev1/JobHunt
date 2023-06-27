﻿using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
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
            List<Message> messages = await _context.Messages.Where(u => u.ReceiverId == user.Id).ToListAsync();
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
            string role = User.FindFirst(ClaimTypes.Role)?.Value;
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
                    Created = DateTime.Now
                };
                await _context.Messages.AddAsync(message);

            }
            else
            {
                var job = await _context.PostJobs.FirstOrDefaultAsync(x => x.AppUserId == send.ReceiverId);
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

            return View(); // Assuming you have a view named "Success.cshtml" to show the success message


        }
        public IActionResult Delete(int? id)
        {
            if (id < 1 || id == null) return BadRequest();
            var message = _context.Messages.FirstOrDefault(x => x.id == id);
            if (message == null) return NotFound();
            _context.Messages.Remove(message);
            _context.SaveChanges();
            return RedirectToAction("Index", "Message");
        }

    }
}