using HomeAssistant.Common.Models;

namespace HomeAssistant.SmartSpeakerApi.Models.Domain
{
    public class SmartSpeaker : SmartDevice
    {
        public double Volume { get; set; }
        public bool IsPlaying { get; set; }
        public int IndexCurrentSong { get; set; }
        public ICollection<PlaylistItem> Playlist { get; set; } = new List<PlaylistItem>();


    }

    public class PlaylistItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public Guid SmarSpeakerId { get; set; }
        public SmartSpeaker SmartSpeaker { get; set; }

    }


}
