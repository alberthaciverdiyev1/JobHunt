using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.ViewModels;
using Microsoft.AspNetCore.Identity;
using static System.Net.WebRequestMethods;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.AspNetCore.Mvc;
using System.Web.Mvc;
using FinalProjectJobHunt.Models.Job;
using System.Security.Claims;

namespace FinalProjectJobHunt.Services
{
    public class LayoutService
    {
        private readonly AppDbContext _context;
        private readonly IHttpContextAccessor _http;
        private readonly UserManager<AppUser> _userManager;


        public LayoutService(AppDbContext context, IHttpContextAccessor http, UserManager<AppUser> userManager)
        {
            _context = context;
            _http = http;
            _userManager = userManager;
        }
        public async Task<Dictionary<string, string>> Getsetting()
        {

            Dictionary<string, string> setting = await _context.Settings.ToDictionaryAsync(x => x.Key, x => x.Value);
            return setting;
        }



        public async Task<List<BasketItemVM>> GetBasket()
        {
            List<BasketItemVM> basketItems = new List<BasketItemVM>();
            if (_http.HttpContext.User.Identity.IsAuthenticated)
            {
                string role = _http.HttpContext.User.FindFirst(ClaimTypes.Role)?.Value;
                AppUser user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
                if (user is null) throw new Exception("Exception");
                basketItems = new List<BasketItemVM>();
                if (role == "EMPLOYEE")
                {
                    List<BasketItem> userItems = await _context.BasketItems
                    .Where(b => b.AppUserId == user.Id)
                    .Include(b => b.UserPostJob)
                    .ThenInclude(c=>c.Category)
                    .ToListAsync();

                    foreach (BasketItem item in userItems)
                    {
                        basketItems.Add(new BasketItemVM
                        {
                            Id = item.id,
                            Salary = item.UserPostJob.Salary ?? 0m,
                            Category = item.UserPostJob.Category.Name,
                            //Position=item.UserPostJob.Positions.Where(p => p.id == ).
                            Image = item.AppUser.ImageURL,
                            UserPostJobId=item.UserPostJobId

                        });
                    }

                    return basketItems;
                }
                else
                {
                    List<BasketItem> userItems = await _context.BasketItems
              .Where(b => b.AppUserId == user.Id)
              .Include(b => b.PostJob).ThenInclude(c=>c.Category)
              .ToListAsync();

                    foreach (BasketItem item in userItems)
                    {
                        basketItems.Add(new BasketItemVM
                        {
                            Id = item.id,
                            Salary = item.PostJob.Salary ?? 0m,
                            Category = item.PostJob.Category.Name,
                            //Position=item.UserPostJob.Positions.Where(p => p.id == ).
                            Image = item.AppUser.ImageURL,
                            PostJobId=item.PostJobId

                        });
                    }

                    return basketItems;
                }

            }
            return basketItems;
        }

        public async Task<int>GetMessage()
        {

            int message = 0;

            if (_http.HttpContext.User.Identity.IsAuthenticated)
            {  AppUser user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
                int messages = _context.Messages.Where(x => x.ReceiverId == user.Id).Count();

                     return messages; 
            }
            return message;
        }
        public async Task<int> GetLikes()
        {

            int like = 0;

            if (_http.HttpContext.User.Identity.IsAuthenticated)
            {
                AppUser user = await _userManager.FindByNameAsync(_http.HttpContext.User.Identity.Name);
                string role = _http.HttpContext.User.FindFirst(ClaimTypes.Role)?.Value;

                if (role == "EMPLOYEE")
                {
                    int likes = _context.BasketItems.Where(x => x.AppUserId == user.Id).Count();
                    return likes;
                }
                else
                {
                    int likes = _context.BasketItems.Where(x => x.AppUserId == user.Id).Count();
                    return likes;
                }

            }
            return like;
        }


    }
}
