using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartClockApi.DTOs
{
    public class UpdateSmartClockDto:UpdateSmartDeviceDto
    {
        public double Volume { get; set; }
        public DateTime? Alarm { get; set; }
    }
}
