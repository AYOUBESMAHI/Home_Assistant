using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartMicrowaveApi.DTO_s;
using HomeAssistant.SmartMicrowaveApi.Models.Domain;

namespace HomeAssistant.SmartMicrowaveApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartMicrowave, SmartMicrowaveDto>();

            CreateMap<SmartMicrowaveDto, SmartMicrowave>();

        }
    }
}
