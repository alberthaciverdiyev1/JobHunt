﻿using System.ComponentModel.DataAnnotations;

namespace JobHuntProject.Models
{
    public class Category : BaseEntity
    {
        [Required]
        public string Icon { get; set; }
        [Required]
        public string Name { get; set; }
        public List<PostJob>? PostJobs { get; set; }
        public List<Position>? Positions { get; set; }

    }
}