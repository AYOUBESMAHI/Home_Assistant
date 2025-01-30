using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartTvApi.Models.Enums;

namespace HomeAssistant.SmartTvApi.DTOs
{
    public class UpdateSmartTvDto:UpdateSmartDeviceDto
    {
        public double Volume { get; set; }
        public TvModes TvMode { get; set; }
    }
}
