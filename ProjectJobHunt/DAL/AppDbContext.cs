using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ProjectJobHunt.Models;
using ProjectJobHunt.Models.Job;

namespace ProjectJobHunt.DAL
{
    public class AppDbContext: IdentityDbContext<AppUser>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options):base(options)
        {
            
        }
        public DbSet<Setting> Settings { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Blog> Blogs { get; set; }
        public DbSet<Profession> Professions { get; set; }
        public DbSet<Experience> Experiences { get; set; }
        public DbSet<Position> Positions { get; set; }
	}
}
