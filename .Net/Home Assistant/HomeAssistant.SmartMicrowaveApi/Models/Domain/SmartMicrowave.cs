using HomeAssistant.Common.Models;
using HomeAssistant.SmartMicrowaveApi.Models.Enums;

namespace HomeAssistant.SmartMicrowaveApi.Models.Domain
{
    public class SmartMicrowave:SmartDevice
    {
        public int Temp { get; set; }
        public int Time { get; set; }
        public CookingMode cookingMode { get; set; }
    }
}
