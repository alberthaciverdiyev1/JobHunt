using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using FinalProjectJobHunt.Models;
using FinalProjectJobHunt.Models.Job;
using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Threading.Tasks;
using System;

namespace FinalProjectJobHunt.DAL
{
	public class AppDbContext : IdentityDbContext<AppUser, UserRole, int>
	{
		public DbSet<Setting> Settings { get; set; }
		public DbSet<Category> Categories { get; set; }
		public DbSet<Blog> Blogs { get; set; }
		public DbSet<WorkExperience> WorkExperiences { get; set; }
		public DbSet<JobType> JobTypes { get; set; }
		public DbSet<Position> Positions { get; set; }
		public DbSet<PostJob> PostJobs { get; set; }
		public DbSet<City> Cities { get; set; }
		public DbSet<Education> Educations { get; set; }
		public DbSet<Language> Languages { get; set; }
		public DbSet<UserPostJob> UserPostJobs { get; set; }

		public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
		{

		}



		protected override void OnModelCreating(ModelBuilder modelBuilder)
		{
			base.OnModelCreating(modelBuilder);

			modelBuilder.Entity<AppUser>(entity =>
			{
				entity.ToTable("AspNetUsers"); // Önceki sütun adı
				entity.HasKey(e => e.Id);
				entity.Property(e => e.Id).ValueGeneratedOnAdd();
			});
		}
	}
}
