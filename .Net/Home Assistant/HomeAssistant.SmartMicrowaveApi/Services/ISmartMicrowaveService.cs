using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartMicrowaveApi.DTO_s;

namespace HomeAssistant.SmartMicrowaveApi.Services
{
    public interface ISmartMicrowaveService
    {
        Task<ResponseDto> CreateSmartMicrowave(SmartMicrowaveDto smartMicrowaveDto);
        Task<ResponseDto> DeleteSmartMicrowave(Guid deviceId);
        Task<ResponseDto> UpdateSmartMicrowave(UpdateSmartMicrowaveDto smartMicrowaveDto);
        ResponseDto GetAllSmartMicrowave();
        ResponseDto GetSmartMicrowaveByPassword(string password);
    }
}
