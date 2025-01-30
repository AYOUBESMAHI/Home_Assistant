using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartPlugApi.Models.Domain
{
    public class SmartPlug:SmartDevice
    {
        public float UsageKw { get; set; }
    }
}
