using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartClockApi.DTOs;

namespace HomeAssistant.SmartClockApi.Services
{
    public interface ISmartClockService
    {
        Task<ResponseDto> CreateSmartClock(SmartClockDto smartClockDto);
        Task<ResponseDto> UpdateSmartClock(UpdateSmartClockDto smartClockDto);
        Task<ResponseDto> DeleteSmartClock(Guid DeviceId);
        ResponseDto GetAllSmartClocks();
        ResponseDto GetSmartClockByPassword(string devicePassword);
    }
}
