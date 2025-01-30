using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartClockApi.Models.Domain
{
    public class SmartClock:SmartDevice
    {
        public double Volume { get; set; }
        public DateTime? alarm { get; set; }
    }
}
