using HomeAssistant.Common.Models;
using HomeAssistant.SmartGarageApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartGarageApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartGarage> smartGarages { get; set; }
        public DbSet<SmartDevice> smartDevices { get; set; }
        public DbSet<RoomIndex> roomsIndex { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");

            modelBuilder.Entity<SmartGarage>().ToTable("SmartGarages")
                                               .HasBaseType<SmartDevice>();


            base.OnModelCreating(modelBuilder);
        }

    }
}
