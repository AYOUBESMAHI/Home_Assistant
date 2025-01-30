using HomeAssistant.SmartMicrowaveApi.Models.Domain;

namespace HomeAssistant.SmartMicrowaveApi.Repositories
{
    public interface ISmartMicrowaveRepository
    {
        Task<SmartMicrowave> CreateSmartMicrowave(SmartMicrowave smartMicrowave);
        Task<SmartMicrowave> UpdateSmartMicrowave(SmartMicrowave smartMicrowave);
        Task<SmartMicrowave> DeleteSmartMicrowave(SmartMicrowave smartMicrowave);
        List<SmartMicrowave> GetAllSmartMicrowaves();
        SmartMicrowave? GetSmartMicrowavepById(Guid deviceId);
        SmartMicrowave? GetSmartMicrowaveByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
