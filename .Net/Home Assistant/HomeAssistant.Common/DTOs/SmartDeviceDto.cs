using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeAssistant.Common.DTOs
{
    public class SmartDeviceDto
    {
        public Guid DeviceId { get; set; }
        public string DevicePassword { get; set; }
        public string Name { get; set; }
        public int RoomIndex { get; set; }
        public bool IsOn { get; set; }
    }
}
