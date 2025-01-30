using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartGarageApi.DTOs
{
    public class SmartGarageDto:SmartDeviceDto
    {
        public bool IsUp { get; set; }
        public bool IsDown { get; set; }
    }
}
