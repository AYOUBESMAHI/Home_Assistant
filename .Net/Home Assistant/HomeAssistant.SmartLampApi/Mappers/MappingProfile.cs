using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartLampApi.DTOs;
using HomeAssistant.SmartLampApi.Models.Domain;

namespace HomeAssistant.SmartLampApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartLamp, SmartLampDto>();


            CreateMap<SmartLampDto, SmartLamp>();

        }
    }
}
