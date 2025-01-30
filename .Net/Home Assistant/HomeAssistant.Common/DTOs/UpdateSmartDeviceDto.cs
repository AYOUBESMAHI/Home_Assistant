using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeAssistant.Common.DTOs
{
    public class UpdateSmartDeviceDto
    {
        public Guid DeviceId { get; set; }
        public bool IsOn { get; set; }
    }
}
