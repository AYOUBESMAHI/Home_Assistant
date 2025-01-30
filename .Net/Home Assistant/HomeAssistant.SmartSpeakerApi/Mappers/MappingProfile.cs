using AutoMapper;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartSpeakerApi.DTOs;
using HomeAssistant.SmartSpeakerApi.Models.Domain;

namespace HomeAssistant.SmartPlugApi.Mappers
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {

            CreateMap<SmartSpeaker, SmartSpeakerDto>()
                .ForMember(dest => dest.Playlist,
                src => src.MapFrom(o => o.Playlist.Select(x => x.Name).ToList()));


            CreateMap<SmartSpeakerDto, SmartSpeaker>()
                .ForMember(dest => dest.Playlist,
                src => src.MapFrom(o => o.Playlist.Select(x => new PlaylistItem() { Name = x }).ToList()));


            CreateMap<string, PlaylistItem>()
                .ForMember(dest => dest.Name, o => o.MapFrom(src=>src))
                .ForMember(dest => dest.Id, o => o.Ignore())
                .ForMember(dest => dest.SmarSpeakerId, o => o.Ignore())
                .ForMember(dest => dest.SmartSpeaker, o => o.Ignore());


        }
    }
}
