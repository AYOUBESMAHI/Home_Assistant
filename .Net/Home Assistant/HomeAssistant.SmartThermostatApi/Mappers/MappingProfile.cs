using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartThermostatApi.DTOs;
using HomeAssistant.SmartThermostatApi.Models.Domain;

namespace HomeAssistant.SmartMicrowaveApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartThermostat, SmartThermostatDto>();

            CreateMap<SmartThermostatDto, SmartThermostat>();

        }
    }
}
