using HomeAssistant.Common.Models;
using HomeAssistant.SmartRefrigeratorApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartRefrigeratorApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartRefrigerator> smartRefrigerators { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartRefrigerator>().ToTable(nameof(SmartRefrigerator)).HasBaseType<SmartDevice>();

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");

            base.OnModelCreating(modelBuilder);
        }

    }
}
