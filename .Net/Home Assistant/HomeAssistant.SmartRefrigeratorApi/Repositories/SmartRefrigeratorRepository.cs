using HomeAssistant.SmartRefrigeratorApi.Data;
using HomeAssistant.SmartRefrigeratorApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartRefrigeratorApi.Repositories
{
    public class SmartRefrigeratorServvice : ISmartRefrigeratorRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartRefrigeratorServvice(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartRefrigerators.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartRefrigerator> CreateSmartRefrigerator(SmartRefrigerator smartRefrigerator)
        {
            await dbContext.smartRefrigerators.AddAsync(smartRefrigerator);
            await dbContext.SaveChangesAsync();
            return smartRefrigerator;
        }

        public async Task<SmartRefrigerator> DeleteSmartRefrigerator(SmartRefrigerator smartRefrigerator)
        {
            dbContext.smartRefrigerators.Remove(smartRefrigerator);
            await dbContext.SaveChangesAsync();
            return smartRefrigerator;
        }

        public List<SmartRefrigerator> GetAllSmartRefrigerators()
        {
            return dbContext.smartRefrigerators.ToList();
        }

        public SmartRefrigerator? GetSmartRefrigeratorByPassword(string password)
        {
            return dbContext.smartRefrigerators.FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartRefrigerator? GetSmartRefrigeratorpById(Guid deviceId)
        {
            return dbContext.smartRefrigerators.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartRefrigerator> UpdateSmartRefrigerator(SmartRefrigerator smartRefrigerator)
        {
            dbContext.smartRefrigerators.Update(smartRefrigerator);
            await dbContext.SaveChangesAsync();
            return smartRefrigerator;
        }

    }
}
