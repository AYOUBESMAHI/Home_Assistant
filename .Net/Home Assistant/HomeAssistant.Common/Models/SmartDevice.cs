using HomeAssistant.Common.Models;
using System.ComponentModel.DataAnnotations;

namespace HomeAssistant.Common.Models
{
    public class SmartDevice
    {
        [Key]
        public Guid DeviceId { get; set; }
        public string DevicePassword { get; set; }
        public string Name { get; set; }
        public int RoomIndex { get; set; } 
        public bool IsOn { get; set; }
    }

    public class RoomIndex
    {
        [Key]
        public Guid Id { get; set; }
        public int Index { get; set; }

        public Guid DeviceId { get; set; }
        public SmartDevice SmartDevice { get; set; }
    }
}


