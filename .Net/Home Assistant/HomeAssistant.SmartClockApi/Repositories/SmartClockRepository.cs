using HomeAssistant.SmartClockApi.Data;
using HomeAssistant.SmartClockApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartClockApi.Repositories
{
    public class SmartClockRepository : ISmartClockRepository
    {
        private readonly ApplicationDbContext _db;

        public SmartClockRepository(ApplicationDbContext dbContext)
        {
            this._db = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return _db.smartClocks.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartClock> CreateSmartClock(SmartClock smartClock)
        {
            await _db.smartClocks.AddAsync(smartClock);
            await _db.SaveChangesAsync();
            return smartClock;
        }

        public async Task<SmartClock> DeleteSmartClock(SmartClock smartClock)
        {
            _db.smartClocks.Remove(smartClock);
            await _db.SaveChangesAsync();
            return smartClock;
        }

        public List<SmartClock> GetAllSmartClocks()
        {
            return _db.smartClocks.ToList();
        }

        public SmartClock GetSmartClockById(Guid deviceId)
        {

            var smartClock = _db.smartClocks.FirstOrDefault(c => c.DeviceId == deviceId);

            if (smartClock == null)
            {
                throw new KeyNotFoundException($"SmartClock with Id {deviceId} not found");
            }

            return smartClock;
        }

        public SmartClock? GetSmartClockByPassword(string devicePassword)
        {
            var smartClock = _db.smartClocks.FirstOrDefault(c => c.DevicePassword == devicePassword);
            return smartClock;
        }

        public async Task<SmartClock> UpdateSmartClock(SmartClock smartClock)
        {

            _db.smartClocks.Update(smartClock);
            await _db.SaveChangesAsync();
            return smartClock;
        }
    }
}
