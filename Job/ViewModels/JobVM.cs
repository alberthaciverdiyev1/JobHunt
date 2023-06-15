﻿using Job.Models;
using System.ComponentModel.DataAnnotations;

namespace Job.ViewModels
{
    public class JobVM
    {

        public List<Category>? Category { get; set; }
        public List<Position>? Positions { get; set; }
        public List<City>? Cities { get; set; }
        public List<Education>? Educations { get; set; }
        public List<Language>? Languages { get; set; }
        public List<JobType>? JobTypes { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<WorkExperience>? WorkExperiences { get; set; }

        [Required]
        public int CategoryId { get; set; }
        //[Required]
        //public int PositionId { get; set; }
        public int CityId { get; set; }
        public int? LanguageId { get; set; }
        public int? EducationId { get; set; }
        public decimal? Salary { get; set; }
        public int? Experience { get; set; }
        public int? WorkExperienceId { get; set; }
        [Required]
        [MaxLength(13)]
        [MinLength(13)]
        public string PhoneNumber { get; set; }
        [DataType(DataType.EmailAddress)]
        public string? Email { get; set; }
        public string? Website { get; set; }
        [Required]
        public string Description { get; set; }
        [Required]
        public int MinAge { get; set; }
        [Required]
        public int MaxAge { get; set; }
        public DateTime Created { get; set; }
        [Required]
        public int JobTypeId { get; set; }
        public JobType? JobType { get; set; }
    }
}