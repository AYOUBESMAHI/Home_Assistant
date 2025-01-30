using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartTvApi.DTOs;

namespace HomeAssistant.SmartTvApi.Services
{
    public interface ISmartTvService
    {
        Task<ResponseDto> CreateSmartTv(SmartTvDto smartTvDto);
        Task<ResponseDto> DeleteSmartTv(Guid deviceId);
        Task<ResponseDto> UpdateSmartTv(UpdateSmartTvDto smartTvDto);
        ResponseDto GetAllSmartTv();
        ResponseDto GetSmartTvByPassword(string password);
    }
}
