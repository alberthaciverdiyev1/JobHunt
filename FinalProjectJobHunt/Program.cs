using FinalProjectJobHunt.DAL;
using FinalProjectJobHunt.Interfaces;
using FinalProjectJobHunt.Middlewares;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Services;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using System;
using System.Web.Mvc;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();
builder.Services.AddScoped<LayoutService>();
builder.Services.AddScoped<IEmailService, EmailService>();
builder.Services.AddDbContext<AppDbContext>(x => x.UseSqlServer(builder.Configuration.GetConnectionString("Default")));
builder.Services.AddIdentity<AppUser, UserRole>(x =>
{
	x.Password.RequiredUniqueChars = 0;
	x.Password.RequireNonAlphanumeric = false;
	x.Password.RequireUppercase = false;
    x.Password.RequiredLength = 4;
    x.SignIn.RequireConfirmedEmail = true;
    x.User.RequireUniqueEmail = true;



}).AddEntityFrameworkStores<AppDbContext>().AddDefaultTokenProviders();



var app = builder.Build();

app.UseStaticFiles();

app.UseRouting();
app.UseAuthentication();
app.UseAuthorization();
app.UseMiddleware<GlobalExceptionHandlerMiddleware>();
app.UseEndpoints(endpoints =>
{
	endpoints.MapControllerRoute(
	  name: "areas",
	  pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
	);
});
app.MapControllerRoute(
	name: "default",
	pattern: "{controller=Home}/{action=Index}/{id?}");



app.Run();
