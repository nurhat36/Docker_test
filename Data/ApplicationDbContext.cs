using Microsoft.EntityFrameworkCore;
using MyMvcApp.Models;
using System.Collections.Generic;

namespace MyMvcApp.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        // Örnek DbSet
        public DbSet<Student> Students { get; set; }
    }
}
