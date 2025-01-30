using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartGarageApi.DTOs;
using HomeAssistant.SmartGarageApi.Models.Domain;

namespace HomeAssistant.SmartGarageApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            //From SmartGarage to SmartGarageDto
            CreateMap<SmartGarage, SmartGarageDto>();


            //From SmartGarageDto to SmartGarage
            CreateMap<SmartGarageDto, SmartGarage>();


        }
    }
}
