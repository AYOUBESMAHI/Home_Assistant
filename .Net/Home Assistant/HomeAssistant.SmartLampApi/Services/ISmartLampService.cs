using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartLampApi.DTOs;

namespace HomeAssistant.SmartLampApi.Repositories
{
    public interface ISmartLampService
    {
        Task<ResponseDto> CreateSmartLamp(SmartLampDto smartLampDto);
        Task<ResponseDto> DeleteSmartLamp(Guid deviceId);
        Task<ResponseDto> UpdateSmartLamp(UpdateSmartLampDto smartLampDto);
        ResponseDto GetAllSmartLamp();
        ResponseDto GetSmartLampByPassword(string password);
    }
}
