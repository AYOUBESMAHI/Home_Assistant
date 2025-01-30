using HomeAssistant.Common.Models;
using HomeAssistant.SmartPlugApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartPlugApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartPlug> smartPlugs { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartPlug>().ToTable(nameof(SmartPlug)).HasBaseType<SmartDevice>();

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");


            base.OnModelCreating(modelBuilder);
        }

    }
}
