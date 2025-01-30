using HomeAssistant.SmartPlugApi.Data;
using HomeAssistant.SmartPlugApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartPlugApi.Repositories
{
    public class SmartPlugRepository:ISmartPlugRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartPlugRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartPlugs.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartPlug> CreateSmartPlug(SmartPlug smartPlug)
        {
            await dbContext.smartPlugs.AddAsync(smartPlug);
            await dbContext.SaveChangesAsync();
            return smartPlug;
        }

        public async Task<SmartPlug> DeleteSmartPlug(SmartPlug smartPlug)
        {
            dbContext.smartPlugs.Remove(smartPlug);
            await dbContext.SaveChangesAsync();
            return smartPlug;
        }

        public List<SmartPlug> GetAllSmartPlugs()
        {
            return dbContext.smartPlugs.ToList();
        }

        public SmartPlug? GetSmartPlugByPassword(string password)
        {
            return dbContext.smartPlugs
                .Where(s => s.DevicePassword == password).FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartPlug? GetSmartPlugpById(Guid deviceId)
        {
            return dbContext.smartPlugs.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartPlug> UpdateSmartPlug(SmartPlug smartPlug)
        {
            dbContext.smartPlugs.Update(smartPlug);
            await dbContext.SaveChangesAsync();
            return smartPlug;
        }
    }
}
