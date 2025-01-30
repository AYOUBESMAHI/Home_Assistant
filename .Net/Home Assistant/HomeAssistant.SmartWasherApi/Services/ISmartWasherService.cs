using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartWasherApi.DTOs;

namespace HomeAssistant.SmartWasherApi.Services
{
    public interface ISmartWasherService
    {
        Task<ResponseDto> CreateSmartWasher(SmartWasherDto smartWasherDto);
        Task<ResponseDto> DeleteSmartWasher(Guid deviceId);
        Task<ResponseDto> UpdateSmartWasher(UpdateSmartWasherDto smartWasherDto);
        ResponseDto GetAllSmartWasher();
        ResponseDto GetSmartWasherByPassword(string password);
    }
}
