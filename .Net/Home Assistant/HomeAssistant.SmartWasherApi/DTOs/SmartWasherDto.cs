using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartWasherApi.Models.Enums;

namespace HomeAssistant.SmartWasherApi.DTOs
{
    public class SmartWasherDto:SmartDeviceDto
    {
        public int Temperature { get; set; }
        public SpeedLevels SpeedLevel { get; set; }
        public SoilLevels SoilLevel { get; set; }
        public WashingModes WashingMode { get; set; }
    }
}
