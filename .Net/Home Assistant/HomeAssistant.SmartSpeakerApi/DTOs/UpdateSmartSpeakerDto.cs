using HomeAssistant.Common.DTOs;

namespace HomeAssistant.SmartSpeakerApi.DTOs
{
    public class UpdateSmartSpeakerDto: UpdateSmartDeviceDto
    {
        public double Volume { get; set; }
        public bool IsPlaying { get; set; }
        public int IndexCurrentSong { get; set; }
        public List<string> Playlist { get; set; } = new List<string>();
    }
}
