using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartThermostatApi.Models.Domain
{
    public class SmartThermostat:SmartDevice
    {
        public int Temperature { get; set; }
    }
}
