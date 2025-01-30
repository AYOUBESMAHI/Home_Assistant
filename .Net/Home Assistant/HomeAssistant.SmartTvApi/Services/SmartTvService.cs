using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartTvApi.DTOs;
using HomeAssistant.SmartTvApi.Models.Domain;
using HomeAssistant.SmartTvApi.Repositories;

namespace HomeAssistant.SmartTvApi.Services
{
    public class SmartTvService:ISmartTvService
    {
        private readonly IMapper mapper;
        private readonly ISmartTvRepository smartTvRepository;

        public SmartTvService(IMapper mapper, ISmartTvRepository smartTvRepository)
        {
            this.mapper = mapper;
            this.smartTvRepository = smartTvRepository;
        }


        public async Task<ResponseDto> CreateSmartTv(SmartTvDto smartTvDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartTvRepository.CheckPasswordExist(smartTvDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartTv smartTv = mapper.Map<SmartTv>(smartTvDto);
                    responseDto.Result = mapper.Map<SmartTvDto>(
                                                await smartTvRepository.CreateSmartTv(smartTv));
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

        public async Task<ResponseDto> DeleteSmartTv(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartTv = smartTvRepository.GetSmartTvpById(deviceId);

                if (smartTv != null)
                {
                    responseDto.Result = mapper.Map<SmartTvDto>(
                                            await smartTvRepository.DeleteSmartTv(smartTv));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Tv Not Found !";
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

        public ResponseDto GetAllSmartTv()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartTvDto>>(smartTvRepository.GetAllSmartTvs());
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

        public ResponseDto GetSmartTvByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartTvRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartTvDto>(
                                                 smartTvRepository.GetSmartTvByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartTv(UpdateSmartTvDto smartTvDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartTv smartTv = smartTvRepository.GetSmartTvpById(smartTvDto.DeviceId)!;
                smartTv.Volume = smartTvDto.Volume;
                smartTv.TvMode = smartTvDto.TvMode;
                smartTv.IsOn = smartTvDto.IsOn;

                responseDto.Result = mapper.Map<SmartTvDto>(
                                        await smartTvRepository.UpdateSmartTv(smartTv));
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
