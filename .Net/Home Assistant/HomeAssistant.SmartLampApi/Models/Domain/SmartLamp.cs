using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartLampApi.Models.Domain
{
    public class SmartLamp:SmartDevice
    {
        public string Color { get; set; }
    }
}
