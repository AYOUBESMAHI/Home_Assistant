using HomeAssistant.Common.Models;
using HomeAssistant.SmartTvApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartTvApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartTv> smartTvs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartTv>()
                        .ToTable(nameof(SmartTv)).HasBaseType<SmartDevice>();


            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");


            base.OnModelCreating(modelBuilder);
        }
    }
}
