using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartTvApi.Models.Enums;

namespace HomeAssistant.SmartTvApi.DTOs
{
    public class SmartTvDto:SmartDeviceDto
    {
        public double Volume { get; set; }
        public TvModes TvMode { get; set; }
    }
}
