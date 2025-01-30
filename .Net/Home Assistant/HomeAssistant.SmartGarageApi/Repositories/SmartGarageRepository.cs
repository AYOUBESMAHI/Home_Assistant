using HomeAssistant.SmartGarageApi.Data;
using HomeAssistant.SmartGarageApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartGarageApi.Repositories
{
    public class SmartGarageRepository : ISmartGarageRepository
    {
        private readonly ApplicationDbContext dbContext;
        public SmartGarageRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public bool CheckSmartGaarageExist(string devicePassword)
        {
           return dbContext.smartGarages.Where(d=>d.DevicePassword== devicePassword).Any();
        }

        public async Task<SmartGarage> CreateSmartGarage(SmartGarage smartGarage)
        {
            await dbContext.smartGarages.AddAsync(smartGarage);
            await dbContext.SaveChangesAsync();
            return smartGarage;
        }

        public async Task<SmartGarage> DeleteSmartGarage(SmartGarage smartGarage)
        {
            dbContext.smartGarages.Remove(smartGarage);
            await dbContext.SaveChangesAsync();
            return smartGarage;
        }

        public List<SmartGarage> GetAllSmartGarages()
        {
            return dbContext.smartGarages.ToList();
        }

        public SmartGarage? GetSmartGarageById(Guid deviceId)
        {
            return dbContext.smartGarages.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public SmartGarage? GetSmartGarageByPassword(string devicePassword)
        {
            return dbContext.smartGarages.FirstOrDefault(d => d.DevicePassword == devicePassword);
        }

        public async Task<SmartGarage> UpdateSmartGarage(SmartGarage smartGarage)
        {
            dbContext.smartGarages.Update(smartGarage);
            await dbContext.SaveChangesAsync();
            return smartGarage;
        }
    }
}
