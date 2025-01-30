using HomeAssistant.Common.Models;
using HomeAssistant.SmartSpeakerApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartSpeakerApi.Data
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions options) : base(options) { }

        public DbSet<SmartSpeaker> smartSpeakers { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<SmartSpeaker>()
                        .ToTable(nameof(SmartSpeaker)).HasBaseType<SmartDevice>();

            modelBuilder.Entity<PlaylistItem>()
                        .HasOne(p => p.SmartSpeaker)
                        .WithMany(m => m.Playlist)
                        .HasForeignKey(fr => fr.SmarSpeakerId);


            modelBuilder.Entity<SmartDevice>().ToTable("SmartDevices");


            base.OnModelCreating(modelBuilder);
        }
    }
}
