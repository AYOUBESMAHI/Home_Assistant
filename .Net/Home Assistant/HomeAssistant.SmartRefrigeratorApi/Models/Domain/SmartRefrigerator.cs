using HomeAssistant.Common.Models;
using HomeAssistant.SmartRefrigeratorApi.Models.Enums;

namespace HomeAssistant.SmartRefrigeratorApi.Models.Domain
{
    public class SmartRefrigerator:SmartDevice
    {
        public bool IsDoorOpen { get; set; }
        public int FridgeTemp { get; set; }
        public int FreezerTemp { get; set; }
        public CoolingModes coolingModes { get; set; }
    }
}
