using HomeAssistant.SmartTvApi.Data;
using HomeAssistant.SmartTvApi.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace HomeAssistant.SmartTvApi.Repositories
{
    public class SmartTvRepository:ISmartTvRepository
    {
        private readonly ApplicationDbContext dbContext;

        public SmartTvRepository(ApplicationDbContext dbContext)
        {
            this.dbContext = dbContext;
        }


        public bool CheckPasswordExist(string password)
        {
            return dbContext.smartTvs.Where(s => s.DevicePassword == password).Any();
        }

        public async Task<SmartTv> CreateSmartTv(SmartTv smartTv)
        {
            await dbContext.smartTvs.AddAsync(smartTv);
            await dbContext.SaveChangesAsync();
            return smartTv;
        }

        public async Task<SmartTv> DeleteSmartTv(SmartTv smartTv)
        {
            dbContext.smartTvs.Remove(smartTv);
            await dbContext.SaveChangesAsync();
            return smartTv;
        }

        public List<SmartTv> GetAllSmartTvs()
        {
            return dbContext.smartTvs.ToList();
        }

        public SmartTv? GetSmartTvByPassword(string password)
        {
            return dbContext.smartTvs
                .FirstOrDefault(d => d.DevicePassword == password);
        }

        public SmartTv? GetSmartTvpById(Guid deviceId)
        {
            return dbContext.smartTvs.FirstOrDefault(d => d.DeviceId == deviceId);
        }

        public async Task<SmartTv> UpdateSmartTv(SmartTv smartTv)
        {
            dbContext.smartTvs.Update(smartTv);
            await dbContext.SaveChangesAsync();
            return smartTv;
        }
    }
}
