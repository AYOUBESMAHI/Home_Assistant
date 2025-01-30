using HomeAssistant.SmartClockApi.Models.Domain;

namespace HomeAssistant.SmartClockApi.Repositories
{
    public interface ISmartClockRepository
    {
        public Task<SmartClock> CreateSmartClock(SmartClock smartClock);
        public Task<SmartClock> UpdateSmartClock(SmartClock smartClock);
        public Task<SmartClock> DeleteSmartClock(SmartClock smartClock);
        public List<SmartClock> GetAllSmartClocks();
        public SmartClock GetSmartClockById(Guid deviceId);
        public SmartClock? GetSmartClockByPassword(string devicePassword);
        bool CheckPasswordExist(string password);

    }
}
