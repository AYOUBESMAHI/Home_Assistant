using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartPlugApi.DTOs
{
    public class UpdateSmartPlugDto: UpdateSmartDeviceDto
    {
        public float UsageKw { get; set; }

    }
}
