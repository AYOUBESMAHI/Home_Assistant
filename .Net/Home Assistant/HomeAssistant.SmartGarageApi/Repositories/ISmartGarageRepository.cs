using HomeAssistant.SmartGarageApi.Models.Domain;

namespace HomeAssistant.SmartGarageApi.Repositories
{
    public interface ISmartGarageRepository
    {
        Task<SmartGarage> CreateSmartGarage(SmartGarage smartGarage);
        Task<SmartGarage> UpdateSmartGarage(SmartGarage smartGarage);
        Task<SmartGarage> DeleteSmartGarage(SmartGarage smartGarage);
        List<SmartGarage> GetAllSmartGarages();
        SmartGarage? GetSmartGarageById(Guid deviceId);
        SmartGarage? GetSmartGarageByPassword(string devicePassword);
        bool CheckSmartGaarageExist(string devicePassword);
    }
}
