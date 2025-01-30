using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartThermostatApi.DTOs
{
    public class UpdateSmartThermostatDto: UpdateSmartDeviceDto
    {
        public int Temperature { get; set; }

    }
}
