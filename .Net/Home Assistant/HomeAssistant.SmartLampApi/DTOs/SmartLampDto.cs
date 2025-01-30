using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartLampApi.DTOs
{
    public class SmartLampDto:SmartDeviceDto
    {
        public string Color { get; set; }
    }
}
