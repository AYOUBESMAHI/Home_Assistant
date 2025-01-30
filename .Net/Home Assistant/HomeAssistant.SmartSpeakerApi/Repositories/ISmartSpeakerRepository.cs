using HomeAssistant.SmartSpeakerApi.Models.Domain;

namespace HomeAssistant.SmartSpeakerApi.Repositories
{
    public interface ISmartSpeakerRepository
    {
        Task<SmartSpeaker> CreateSmartSpeaker(SmartSpeaker smartSpeaker);
        Task<SmartSpeaker> UpdateSmartSpeaker(SmartSpeaker smartSpeaker);
        Task<SmartSpeaker> DeleteSmartSpeaker(SmartSpeaker smartSpeaker);
        List<SmartSpeaker> GetAllSmartSpeakers();
        SmartSpeaker? GetSmartSpeakerpById(Guid deviceId);
        SmartSpeaker? GetSmartSpeakerByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
