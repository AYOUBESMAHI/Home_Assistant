using HomeAssistant.Common.DTOs;
namespace HomeAssistant.SmartClockApi.DTOs
{
    public class SmartClockDto:SmartDeviceDto
    {
        public double Volume { get; set; }
        public DateTime? Alarm { get; set; }
    }
}
