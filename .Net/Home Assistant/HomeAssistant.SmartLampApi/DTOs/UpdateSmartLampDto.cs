using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartLampApi.DTOs
{
    public class UpdateSmartLampDto: UpdateSmartDeviceDto
    {
        public string Color { get; set; }

    }
}
