using HomeAssistant.SmartTvApi.Models.Domain;

namespace HomeAssistant.SmartTvApi.Repositories
{
    public interface ISmartTvRepository
    {
        Task<SmartTv> CreateSmartTv(SmartTv smartTv);
        Task<SmartTv> UpdateSmartTv(SmartTv smartTv);
        Task<SmartTv> DeleteSmartTv(SmartTv smartTv);
        List<SmartTv> GetAllSmartTvs();
        SmartTv? GetSmartTvpById(Guid deviceId);
        SmartTv? GetSmartTvByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
