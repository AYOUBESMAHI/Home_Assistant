using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartMicrowaveApi.Models.Enums;

namespace HomeAssistant.SmartMicrowaveApi.DTO_s
{
    public class UpdateSmartMicrowaveDto: UpdateSmartDeviceDto
    {
        public int Temp { get; set; }
        public int Time { get; set; }
        public CookingMode cookingMode { get; set; }
    }
}
