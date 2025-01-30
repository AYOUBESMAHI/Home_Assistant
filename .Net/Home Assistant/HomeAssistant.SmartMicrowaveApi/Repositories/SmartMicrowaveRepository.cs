using HomeAssistant.SmartMicrowaveApi.Data;
using HomeAssistant.SmartMicrowaveApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartMicrowaveApi.Repositories
{
    public class SmartMicrowaveRepository:ISmartMicrowaveRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartMicrowaveRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartMicrowaves.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartMicrowave> CreateSmartMicrowave(SmartMicrowave smartMicrowave)
        {
            await dbContext.smartMicrowaves.AddAsync(smartMicrowave);
            await dbContext.SaveChangesAsync();
            return smartMicrowave;
        }

        public async Task<SmartMicrowave> DeleteSmartMicrowave(SmartMicrowave smartMicrowave)
        {
            dbContext.smartMicrowaves.Remove(smartMicrowave);
            await dbContext.SaveChangesAsync();
            return smartMicrowave;
        }

        public List<SmartMicrowave> GetAllSmartMicrowaves()
        {
            return dbContext.smartMicrowaves.ToList();
        }

        public SmartMicrowave? GetSmartMicrowaveByPassword(string password)
        {
            return dbContext.smartMicrowaves
                .Where(s => s.DevicePassword == password).FirstOrDefault(d=>d.DevicePassword==password);
        }

        public SmartMicrowave? GetSmartMicrowavepById(Guid deviceId)
        {
            return dbContext.smartMicrowaves.FirstOrDefault(d=>d.DeviceId==deviceId);
        }

        public async Task<SmartMicrowave> UpdateSmartMicrowave(SmartMicrowave smartMicrowave)
        {
            dbContext.smartMicrowaves.Update(smartMicrowave);
            await dbContext.SaveChangesAsync();
            return smartMicrowave;
        }
    }
}
