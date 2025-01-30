using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartPlugApi.DTOs;

namespace HomeAssistant.SmartPlugApi.Services
{
    public interface ISmartPlugService
    {
        Task<ResponseDto> CreateSmartPlug(SmartPlugDto smartPlugDto);
        Task<ResponseDto> DeleteSmartPlug(Guid deviceId);
        Task<ResponseDto> UpdateSmartPlug(UpdateSmartPlugDto smartPlugDto);
        ResponseDto GetAllSmartPlug();
        ResponseDto GetSmartPlugByPassword(string password);
    }
}
