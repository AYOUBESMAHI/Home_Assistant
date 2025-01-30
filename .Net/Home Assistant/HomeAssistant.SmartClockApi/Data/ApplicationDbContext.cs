using HomeAssistant.Common.Models;
using HomeAssistant.SmartClockApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartClockApi.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartClock> smartClocks { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder) {

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");
            modelBuilder.Entity<SmartClock>().ToTable("SmartClocks");

            base.OnModelCreating(modelBuilder);
        }


    }
}