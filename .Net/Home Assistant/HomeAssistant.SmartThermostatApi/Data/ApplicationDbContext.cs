using HomeAssistant.Common.Models;
using HomeAssistant.SmartThermostatApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartThermostatApi.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartThermostat> smartThermostats { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartThermostat>()
                        .ToTable(nameof(SmartThermostat)).HasBaseType<SmartDevice>();

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");

            base.OnModelCreating(modelBuilder);
        }
    }
}
