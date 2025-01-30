using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartPlugApi.DTOs
{
    public class SmartPlugDto:SmartDeviceDto
    {
        public float UsageKw { get; set; }

    }
}
