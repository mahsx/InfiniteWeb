using System.Data.Entity;
using AssessmentQ2.Models;

namespace AssessmentQ2.Data
{
    public class MoviesDbContext : DbContext
    {
        public MoviesDbContext() : base("MoviesDbContext")
        {
        }

        public DbSet<Movie> Movies { get; set; }
    }
}
