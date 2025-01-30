using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartGarageApi.Models.Domain
{
    public class SmartGarage:SmartDevice
    {
        public bool IsUp { get; set; }
        public bool IsDown { get; set; }
    }
}
