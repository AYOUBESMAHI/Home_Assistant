using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartThermostatApi.DTOs;

namespace HomeAssistant.SmartThermostatApi.Services
{
    public interface ISmartThermostatService
    {
        Task<ResponseDto> CreateSmartThermostat(SmartThermostatDto smartThermostatDto);
        Task<ResponseDto> DeleteSmartThermostat(Guid deviceId);
        Task<ResponseDto> UpdateSmartThermostat(UpdateSmartThermostatDto smartThermostatDto);
        ResponseDto GetAllSmartThermostat();
        ResponseDto GetSmartThermostatByPassword(string password);
    }
}
