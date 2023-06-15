﻿using System.ComponentModel.DataAnnotations;

namespace ProjectJobHunt.Models.Job
{
    public class PostJob:BaseEntity
    {


        public int CategoryId { get; set; }
        public Category? Category { get; set; }

        public int JobTypeId { get; set; }
        public JobType? JobType { get; set; }

        public int? ExperienceYearId { get; set; }
        public ExperienceYear? ExperienceYear { get; set; }
        public int? WorkExperienceId { get; set; }
        public WorkExperience? WorkExperience { get; set; }
        public decimal? Salary { get; set; }
        public City? City { get; set; }
        public int? CityId { get; set; }
        public int? EducationId { get; set; }
        public Education? Education { get; set; }

        public int? LanguageId { get; set; }
        public Language? Language { get; set; }
        public int PhoneNumber { get; set; }
        public string? Email { get; set; }
        public string? Website { get; set; }
        public string Description { get; set; }
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
        public DateTime Created { get; set;}
    }
}
