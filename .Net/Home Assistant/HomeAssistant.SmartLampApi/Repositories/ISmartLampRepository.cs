using HomeAssistant.SmartLampApi.Models.Domain;

namespace HomeAssistant.SmartLampApi.Repositories
{
    public interface ISmartLampRepository
    {
        Task<SmartLamp> CreateSmartLamp(SmartLamp smartLamp);
        Task<SmartLamp> UpdateSmartLamp(SmartLamp smartLamp);
        Task<SmartLamp> DeleteSmartLamp(SmartLamp smartLamp);
        List<SmartLamp> GetAllSmartLamps();
        SmartLamp? GetSmartLampById(Guid deviceId);
        SmartLamp? GetSmartLampByPassword(string password);
        bool CheckPasswordExist(string password);

    }
}
