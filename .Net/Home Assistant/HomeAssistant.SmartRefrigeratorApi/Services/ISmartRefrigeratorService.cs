using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartRefrigeratorApi.DTOs;

namespace HomeAssistant.SmartRefrigeratorApi.Services
{
    public interface ISmartRefrigeratorService
    {
        Task<ResponseDto> CreateSmartRefrigerator(SmartRefrigeratorDto smartRefrigeratorDto);
        Task<ResponseDto> DeleteSmartRefrigerator(Guid deviceId);
        Task<ResponseDto> UpdateSmartRefrigerator(UpdateSmartRefrigeratorDto smartRefrigeratorDto);
        ResponseDto GetAllSmartRefrigerator();
        ResponseDto GetSmartRefrigeratorByPassword(string password);
    }
}
