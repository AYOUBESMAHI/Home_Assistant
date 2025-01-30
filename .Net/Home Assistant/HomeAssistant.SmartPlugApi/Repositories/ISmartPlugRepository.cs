using HomeAssistant.SmartPlugApi.Models.Domain;

namespace HomeAssistant.SmartPlugApi.Repositories
{
    public interface ISmartPlugRepository
    {
        Task<SmartPlug> CreateSmartPlug(SmartPlug smartPlug);
        Task<SmartPlug> UpdateSmartPlug(SmartPlug smartPlug);
        Task<SmartPlug> DeleteSmartPlug(SmartPlug smartPlug);
        List<SmartPlug> GetAllSmartPlugs();
        SmartPlug? GetSmartPlugpById(Guid deviceId);
        SmartPlug? GetSmartPlugByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
