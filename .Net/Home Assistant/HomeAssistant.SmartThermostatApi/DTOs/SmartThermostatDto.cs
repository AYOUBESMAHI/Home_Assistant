using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartThermostatApi.DTOs
{
    public class SmartThermostatDto : SmartDeviceDto
    {
        public int Temperature { get; set; }
    }
}
