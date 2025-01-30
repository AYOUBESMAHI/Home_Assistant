using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartSpeakerApi.Models.Domain;

namespace HomeAssistant.SmartSpeakerApi.DTOs
{
    public class SmartSpeakerDto:SmartDeviceDto
    {
        public double Volume { get; set; }
        public bool IsPlaying { get; set; }
        public int IndexCurrentSong { get; set; }
        public List<string> Playlist { get; set; } = new List<string>();
    }
}
