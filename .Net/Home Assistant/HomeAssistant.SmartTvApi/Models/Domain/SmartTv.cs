using HomeAssistant.Common.Models;
using HomeAssistant.SmartTvApi.Models.Enums;

namespace HomeAssistant.SmartTvApi.Models.Domain
{
    public class SmartTv:SmartDevice
    {
        public double Volume { get; set; }
        public TvModes TvMode { get; set; }
    }
}
