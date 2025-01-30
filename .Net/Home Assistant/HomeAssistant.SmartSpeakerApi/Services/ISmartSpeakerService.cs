using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartSpeakerApi.DTOs;

namespace HomeAssistant.SmartSpeakerApi.Services
{
    public interface ISmartSpeakerService
    {
        Task<ResponseDto> CreateSmartSpeaker(SmartSpeakerDto smartSpeakerDto);
        Task<ResponseDto> DeleteSmartSpeaker(Guid deviceId);
        Task<ResponseDto> UpdateSmartSpeaker(UpdateSmartSpeakerDto smartSpeakerDto);
        ResponseDto GetAllSmartSpeaker();
        ResponseDto GetSmartSpeakerByPassword(string password);
    }
}
