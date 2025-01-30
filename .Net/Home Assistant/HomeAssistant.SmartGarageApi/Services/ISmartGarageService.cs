using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartGarageApi.DTOs;

namespace HomeAssistant.SmartGarageApi.Services
{
    public interface ISmartGarageService
    {
        Task<ResponseDto> CreateSmartGarage(SmartGarageDto smartGarageDto);
        Task<ResponseDto> UpdateSmartGarage(UpdateSmartGarageDto smartGarageDto);
        Task<ResponseDto> DeleteSmartGarage(Guid deviceId);
        ResponseDto GetAllSmartGarages();
        ResponseDto GetSmartGarageByPassword(string devicePassword);
    }
}
