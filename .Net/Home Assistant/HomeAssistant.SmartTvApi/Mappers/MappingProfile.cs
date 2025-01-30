using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartTvApi.DTOs;
using HomeAssistant.SmartTvApi.Models.Domain;

namespace HomeAssistant.SmartMicrowaveApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartTv, SmartTvDto>();

            CreateMap<SmartTvDto, SmartTv>();

        }
    }
}
