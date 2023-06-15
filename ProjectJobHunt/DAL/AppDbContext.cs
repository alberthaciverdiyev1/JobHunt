﻿using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
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
        public DbSet<WorkExperience> WorkExperiences { get; set; }
        public DbSet<ExperienceYear> ExperienceYears { get; set; }
        public DbSet<JobType> JobTypes { get; set; }
        public DbSet<Position> Positions { get; set; }
        public DbSet<PostJob> PostJobs { get; set; }
        public DbSet<City> Cities { get; set; }
        public DbSet<Education> Educations { get; set; }
        public DbSet<Language> Languages { get; set; }
        public DbSet<Try> Tries { get; set; }
    }
}
