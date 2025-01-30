using HomeAssistant.SmartRefrigeratorApi.Models.Domain;

namespace HomeAssistant.SmartRefrigeratorApi.Repositories
{
    public interface ISmartRefrigeratorRepository
    {
        Task<SmartRefrigerator> CreateSmartRefrigerator(SmartRefrigerator smartRefrigerator);
        Task<SmartRefrigerator> UpdateSmartRefrigerator(SmartRefrigerator smartRefrigerator);
        Task<SmartRefrigerator> DeleteSmartRefrigerator(SmartRefrigerator smartRefrigerator);
        List<SmartRefrigerator> GetAllSmartRefrigerators();
        SmartRefrigerator? GetSmartRefrigeratorpById(Guid deviceId);
        SmartRefrigerator? GetSmartRefrigeratorByPassword(string password);
        bool CheckPasswordExist(string password);
    }
}
