using HomeAssistant.SmartThermostatApi.Models.Domain;

namespace HomeAssistant.SmartThermostatApi.Repositories
{
    public interface ISmartThermostatRepository
    {
        Task<SmartThermostat> CreateSmartThermostat(SmartThermostat smartThermostat);
        Task<SmartThermostat> UpdateSmartThermostat(SmartThermostat smartThermostat);
        Task<SmartThermostat> DeleteSmartThermostat(SmartThermostat smartThermostat);
        List<SmartThermostat> GetAllSmartThermostats();
        SmartThermostat? GetSmartThermostatpById(Guid deviceId);
        SmartThermostat? GetSmartThermostatByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
