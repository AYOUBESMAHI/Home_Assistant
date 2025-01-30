using HomeAssistant.SmartLampApi.Data;
using HomeAssistant.SmartLampApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartLampApi.Repositories
{
    public class SmartLampRepository : ISmartLampRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartLampRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartLamps.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartLamp> CreateSmartLamp(SmartLamp smartLamp)
        {
            await dbContext.smartLamps.AddAsync(smartLamp);
            await dbContext.SaveChangesAsync();
            return smartLamp;
        }

        public async Task<SmartLamp> DeleteSmartLamp(SmartLamp smartLamp)
        {
            dbContext.smartLamps.Remove(smartLamp);
            await dbContext.SaveChangesAsync();
            return smartLamp;
        }

        public List<SmartLamp> GetAllSmartLamps()
        {
            return dbContext.smartLamps.ToList();
        }

        public SmartLamp? GetSmartLampById(Guid deviceId)
        {
            return dbContext.smartLamps.FirstOrDefault(d=>d.DeviceId==deviceId);
        }

        public SmartLamp? GetSmartLampByPassword(string password)
        {
            return dbContext.smartLamps
                .Where(s => s.DevicePassword == password).FirstOrDefault(d=>d.DevicePassword==password);
        }

        public async Task<SmartLamp> UpdateSmartLamp(SmartLamp smartLamp)
        {
            dbContext.smartLamps.Update(smartLamp);
            await dbContext.SaveChangesAsync();
            return smartLamp;
        }
    }
}
