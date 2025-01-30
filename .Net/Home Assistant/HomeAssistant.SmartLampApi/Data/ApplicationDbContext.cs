using HomeAssistant.Common.Models;
using HomeAssistant.SmartLampApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartLampApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartLamp> smartLamps { get; set; }
        public DbSet<SmartDevice> smartDevices { get; set; }
        public DbSet<RoomIndex> roomsIndex { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            modelBuilder.Entity<SmartLamp>().ToTable("SmartLamps")
                                            .HasBaseType<SmartDevice>();

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");


            base.OnModelCreating(modelBuilder);
        }

    }
}
