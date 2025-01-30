using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartPlugApi.DTOs;
using HomeAssistant.SmartPlugApi.Models.Domain;

namespace HomeAssistant.SmartPlugApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartPlug, SmartPlugDto>();

            CreateMap<SmartPlugDto, SmartPlug>();


        }
    }
}
