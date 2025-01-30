using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartClockApi.DTOs;
using HomeAssistant.SmartClockApi.Models.Domain;

namespace HomeAssistant.SmartClockApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //From SmartClock to SmartClockDto
            CreateMap<SmartClock, SmartClockDto>();

            //From SmartClockDto to SmartClock
            CreateMap<SmartClockDto, SmartClock>();
        }
    }
}
