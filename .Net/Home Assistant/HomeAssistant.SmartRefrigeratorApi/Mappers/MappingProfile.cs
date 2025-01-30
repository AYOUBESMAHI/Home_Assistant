using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartRefrigeratorApi.DTOs;
using HomeAssistant.SmartRefrigeratorApi.Models.Domain;

namespace HomeAssistant.SmartRefrigeratorApi.Mappers
{
    public class MappingProfile:Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartRefrigerator, SmartRefrigeratorDto>();

            CreateMap<SmartRefrigeratorDto, SmartRefrigerator>();


        }
    }
}
