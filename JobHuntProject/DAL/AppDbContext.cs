using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using JobHuntProject.Models;
using JobHuntProject.Models.Job;
using Microsoft.AspNetCore.Identity;

namespace JobHuntProject.DAL
{
   

    public class AppDbContext: IdentityDbContext<AppUser,UserRole,int>
    { 
        
        protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<AppUser>(entity =>
        {
            entity.Property(e => e.Id)
                .ValueGeneratedNever()
                .IsRequired();

            // Diğer özellikler...
        });
    }
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {
            
        }
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
    }
}
