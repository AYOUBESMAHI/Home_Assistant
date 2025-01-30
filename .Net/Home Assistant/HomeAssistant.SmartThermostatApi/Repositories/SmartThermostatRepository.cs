using HomeAssistant.SmartThermostatApi.Data;
using HomeAssistant.SmartThermostatApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartThermostatApi.Repositories
{
    public class SmartThermostatRepository : ISmartThermostatRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartThermostatRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartThermostats.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartThermostat> CreateSmartThermostat(SmartThermostat smartThermostat)
        {
            await dbContext.smartThermostats.AddAsync(smartThermostat);
            await dbContext.SaveChangesAsync();
            return smartThermostat;
        }

        public async Task<SmartThermostat> DeleteSmartThermostat(SmartThermostat smartThermostat)
        {
            dbContext.smartThermostats.Remove(smartThermostat);
            await dbContext.SaveChangesAsync();
            return smartThermostat;
        }

        public List<SmartThermostat> GetAllSmartThermostats()
        {
            return dbContext.smartThermostats.ToList();
        }

        public SmartThermostat? GetSmartThermostatByPassword(string password)
        {
            return dbContext.smartThermostats
                .FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartThermostat? GetSmartThermostatpById(Guid deviceId)
        {
            return dbContext.smartThermostats.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartThermostat> UpdateSmartThermostat(SmartThermostat smartThermostat)
        {
            dbContext.smartThermostats.Update(smartThermostat);
            await dbContext.SaveChangesAsync();
            return smartThermostat;
        }
    }
}
