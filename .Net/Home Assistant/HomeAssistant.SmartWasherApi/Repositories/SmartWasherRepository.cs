using HomeAssistant.SmartWasherApi.Data;
using HomeAssistant.SmartWasherApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartWasherApi.Repositories
{
    public class SmartWasherRepository:ISmartWasherRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartWasherRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartWashers.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartWasher> CreateSmartWasher(SmartWasher smartWasher)
        {
            await dbContext.smartWashers.AddAsync(smartWasher);
            await dbContext.SaveChangesAsync();
            return smartWasher;
        }

        public async Task<SmartWasher> DeleteSmartWasher(SmartWasher smartWasher)
        {
            dbContext.smartWashers.Remove(smartWasher);
            await dbContext.SaveChangesAsync();
            return smartWasher;
        }

        public List<SmartWasher> GetAllSmartWashers()
        {
            return dbContext.smartWashers.ToList();
        }

        public SmartWasher? GetSmartWasherByPassword(string password)
        {
            return dbContext.smartWashers
                .FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartWasher? GetSmartWasherpById(Guid deviceId)
        {
            return dbContext.smartWashers.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartWasher> UpdateSmartWasher(SmartWasher smartWasher)
        {
            dbContext.smartWashers.Update(smartWasher);
            await dbContext.SaveChangesAsync();
            return smartWasher;
        }
    }
}
