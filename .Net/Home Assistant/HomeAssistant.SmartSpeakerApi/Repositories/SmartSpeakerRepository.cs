using HomeAssistant.SmartSpeakerApi.Data;
using HomeAssistant.SmartSpeakerApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartSpeakerApi.Repositories
{
    public class SmartSpeakerRepository:ISmartSpeakerRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartSpeakerRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartSpeakers.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartSpeaker> CreateSmartSpeaker(SmartSpeaker smartSpeaker)
        {
            await dbContext.smartSpeakers.AddAsync(smartSpeaker);
            await dbContext.SaveChangesAsync();
            return smartSpeaker;
        }

        public async Task<SmartSpeaker> DeleteSmartSpeaker(SmartSpeaker smartSpeaker)
        {
            dbContext.smartSpeakers.Remove(smartSpeaker);
            await dbContext.SaveChangesAsync();
            return smartSpeaker;
        }

        public List<SmartSpeaker> GetAllSmartSpeakers()
        {
            return dbContext.smartSpeakers.Include(s=>s.Playlist).ToList();
        }

        public SmartSpeaker? GetSmartSpeakerByPassword(string password)
        {
            return dbContext.smartSpeakers
                .Include(s => s.Playlist)
                .FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartSpeaker? GetSmartSpeakerpById(Guid deviceId)
        {
            return dbContext.smartSpeakers.Include(s => s.Playlist)
                .FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartSpeaker> UpdateSmartSpeaker(SmartSpeaker smartSpeaker)
        {
            dbContext.smartSpeakers.Update(smartSpeaker);
            await dbContext.SaveChangesAsync();
            return smartSpeaker;
        }
    }
}
