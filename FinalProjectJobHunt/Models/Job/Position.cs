﻿
using FinalProjectJobHunt.ViewModels;
using System.ComponentModel.DataAnnotations;


namespace FinalProjectJobHunt.Models
{
    public class Position : BaseEntity
    {
        [Required]
        public string PositionName { get; set; }
        public Category? Category { get; set; }
        [Required]
        public int CategoryId { get; set; }

    }
}