using Microsoft.EntityFrameworkCore;
using PlatformService.Models;

namespace PlatformService.Data
{

    public class AppDbContext :DbContext
    {
        private readonly string connectionString;

        public AppDbContext(DbContextOptions<AppDbContext> options, IConfiguration configuration)
           : base(options)
        {
            connectionString = configuration.GetConnectionString("DefaultConnection");
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(connectionString);
        }
        public DbSet<Platform> Platform { get; set; }
    }
}