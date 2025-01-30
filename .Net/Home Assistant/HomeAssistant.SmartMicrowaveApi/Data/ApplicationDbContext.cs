using HomeAssistant.Common.Models;
using HomeAssistant.SmartMicrowaveApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartMicrowaveApi.Data
{
    public class ApplicationDbContext:DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartMicrowave> smartMicrowaves { get; set; }
        public DbSet<SmartDevice> smartDevices { get; set; }
        public DbSet<RoomIndex> roomsIndex { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            
            modelBuilder.Entity<SmartMicrowave>().ToTable("SmartMicrowave")
                                            .HasBaseType<SmartDevice>();

            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");


            base.OnModelCreating(modelBuilder);
        }

    }
}
