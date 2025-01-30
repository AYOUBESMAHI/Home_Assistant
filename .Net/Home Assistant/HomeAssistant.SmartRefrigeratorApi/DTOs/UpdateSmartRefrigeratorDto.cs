using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartRefrigeratorApi.Models.Enums;

namespace HomeAssistant.SmartRefrigeratorApi.DTOs
{
    public class UpdateSmartRefrigeratorDto: UpdateSmartDeviceDto
    {
        public bool IsDoorOpen { get; set; }
        public int FridgeTemp { get; set; }
        public int FreezerTemp { get; set; }
        public CoolingModes coolingModes { get; set; }
    }
}
