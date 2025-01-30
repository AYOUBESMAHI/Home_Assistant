using HomeAssistant.SmartWasherApi.Models.Domain;

namespace HomeAssistant.SmartWasherApi.Repositories
{
    public interface ISmartWasherRepository
    {
        Task<SmartWasher> CreateSmartWasher(SmartWasher smartWasher);
        Task<SmartWasher> UpdateSmartWasher(SmartWasher smartWasher);
        Task<SmartWasher> DeleteSmartWasher(SmartWasher smartWasher);
        List<SmartWasher> GetAllSmartWashers();
        SmartWasher? GetSmartWasherpById(Guid deviceId);
        SmartWasher? GetSmartWasherByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
