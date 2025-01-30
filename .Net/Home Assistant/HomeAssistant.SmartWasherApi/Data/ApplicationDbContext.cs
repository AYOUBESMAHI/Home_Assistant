using HomeAssistant.Common.Models;
using HomeAssistant.SmartWasherApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartWasherApi.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartWasher> smartWashers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartWasher>()
                        .ToTable(nameof(SmartWasher)).HasBaseType<SmartDevice>();


            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");

            base.OnModelCreating(modelBuilder);
        }
    }
}
