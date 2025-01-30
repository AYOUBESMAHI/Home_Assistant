using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartSpeakerApi.DTOs;
using HomeAssistant.SmartSpeakerApi.Models.Domain;
using HomeAssistant.SmartSpeakerApi.Repositories;

namespace HomeAssistant.SmartSpeakerApi.Services
{
    public class SmartSpeakerService:ISmartSpeakerService
    {
        private readonly IMapper mapper;
        private readonly ISmartSpeakerRepository smartSpeakerRepository;

        public SmartSpeakerService(IMapper mapper, ISmartSpeakerRepository smartSpeakerRepository)
        {
            this.mapper = mapper;
            this.smartSpeakerRepository = smartSpeakerRepository;
        }


        public async Task<ResponseDto> CreateSmartSpeaker(SmartSpeakerDto smartSpeakerDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartSpeakerRepository.CheckPasswordExist(smartSpeakerDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartSpeaker smartSpeaker = mapper.Map<SmartSpeaker>(smartSpeakerDto);
                    responseDto.Result = mapper.Map<SmartSpeakerDto>(
                                                await smartSpeakerRepository.CreateSmartSpeaker(smartSpeaker));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Password Already Exist!";
                    responseDto.Success = false;
                }
            }
            catch (Exception e)
            {
                responseDto.Success = false;
                responseDto.Message = e.Message;
                throw;
            }
            return responseDto;
        }

        public async Task<ResponseDto> DeleteSmartSpeaker(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartSpeaker = smartSpeakerRepository.GetSmartSpeakerpById(deviceId);

                if (smartSpeaker != null)
                {
                    responseDto.Result = mapper.Map<SmartSpeakerDto>(
                                            await smartSpeakerRepository.DeleteSmartSpeaker(smartSpeaker));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Speaker Not Found !";
                    responseDto.Success = false;
                }
            }
            catch (Exception e)
            {
                responseDto.Success = false;
                responseDto.Message = e.Message;
                throw;
            }
            return responseDto;
        }

        public ResponseDto GetAllSmartSpeaker()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartSpeakerDto>>(smartSpeakerRepository.GetAllSmartSpeakers());
                responseDto.Success = true;
            }
            catch (Exception e)
            {
                responseDto.Success = false;
                responseDto.Message = e.Message;
                throw;
            }
            return responseDto;
        }

        public ResponseDto GetSmartSpeakerByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartSpeakerRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartSpeakerDto>(
                                                 smartSpeakerRepository.GetSmartSpeakerByPassword(password));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Please Check Password. Device Not Found!";
                    responseDto.Success = false;
                }
            }
            catch (Exception e)
            {
                responseDto.Success = false;
                responseDto.Message = e.Message;
                throw;
            }
            return responseDto;
        }

        public async Task<ResponseDto> UpdateSmartSpeaker(UpdateSmartSpeakerDto smartSpeakerDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartSpeaker smartSpeaker = smartSpeakerRepository.GetSmartSpeakerpById(smartSpeakerDto.DeviceId)!;
                smartSpeaker.IsPlaying = smartSpeakerDto.IsPlaying;
                smartSpeaker.Volume = smartSpeakerDto.Volume;
                smartSpeaker.Playlist = mapper.Map<List<PlaylistItem>>(smartSpeakerDto.Playlist);
                smartSpeaker.IndexCurrentSong = smartSpeakerDto.IndexCurrentSong;
                smartSpeaker.IsOn = smartSpeakerDto.IsOn;

                responseDto.Result = mapper.Map<SmartSpeakerDto>(
                                        await smartSpeakerRepository.UpdateSmartSpeaker(smartSpeaker));
                responseDto.Success = true;
            }
            catch (Exception e)
            {
                responseDto.Success = false;
                responseDto.Message = e.Message;
                throw;
            }
            return responseDto;
        }
    }
}
