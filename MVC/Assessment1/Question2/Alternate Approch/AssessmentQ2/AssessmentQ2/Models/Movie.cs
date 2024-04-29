using System;
using System.ComponentModel.DataAnnotations;

namespace AssessmentQ2.Models
{
    public class Movie
    {
        [Key] // Define Mid as the primary key
        public int Mid { get; set; }

        [Required(ErrorMessage = "Please enter the movie name.")]
        public string Moviename { get; set; }

        [Display(Name = "Date of Release")]
        [DataType(DataType.Date)]
        public DateTime DateofRelease { get; set; }
    }
}
