using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartGarageApi.DTOs
{
    public class UpdateSmartGarageDto: UpdateSmartDeviceDto
    {
        public bool IsUp { get; set; }
        public bool IsDown { get; set; }
    }
}
