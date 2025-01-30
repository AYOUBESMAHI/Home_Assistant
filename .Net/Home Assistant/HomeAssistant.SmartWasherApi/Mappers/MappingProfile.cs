using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartWasherApi.DTOs;
using HomeAssistant.SmartWasherApi.Models.Domain;

namespace HomeAssistant.SmartMicrowaveApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartWasher, SmartWasherDto>();

            CreateMap<SmartWasherDto, SmartWasher>();

        }
    }
}
