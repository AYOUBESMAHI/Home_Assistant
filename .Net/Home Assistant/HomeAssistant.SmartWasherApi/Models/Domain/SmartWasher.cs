using HomeAssistant.Common.Models;
using HomeAssistant.SmartWasherApi.Models.Enums;

namespace HomeAssistant.SmartWasherApi.Models.Domain
{
    public class SmartWasher:SmartDevice
    {
        public int Temperature { get; set; }
        public SpeedLevels SpeedLevel { get; set; }
        public SoilLevels SoilLevel { get; set; }
        public WashingModes WashingMode { get; set; }
    }
}
