using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartLampApi.DTOs;
using HomeAssistant.SmartLampApi.Models.Domain;

namespace HomeAssistant.SmartLampApi.Repositories
{
    public class SmartLampService : ISmartLampService
    {
        private readonly IMapper mapper;
        private readonly ISmartLampRepository smartLampRepository;

        public SmartLampService(IMapper mapper, ISmartLampRepository smartLampRepository)
        {
            this.mapper = mapper;
            this.smartLampRepository = smartLampRepository;
        }


        public async Task<ResponseDto> CreateSmartLamp(SmartLampDto smartLampDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartLampRepository.CheckPasswordExist(smartLampDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartLamp smartLamp = mapper.Map<SmartLamp>(smartLampDto);
                    responseDto.Result = mapper.Map<SmartLampDto>(
                                                await smartLampRepository.CreateSmartLamp(smartLamp));
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

        public async Task<ResponseDto> DeleteSmartLamp(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartLamp = smartLampRepository.GetSmartLampById(deviceId);

                if (smartLamp != null)
                {
                    responseDto.Result = mapper.Map<SmartLampDto>(
                                            await smartLampRepository.DeleteSmartLamp(smartLamp));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Lamp Not Found !";
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

        public ResponseDto GetAllSmartLamp()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartLampDto>>(smartLampRepository.GetAllSmartLamps());
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

        public ResponseDto GetSmartLampByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartLampRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartLampDto>(
                                                 smartLampRepository.GetSmartLampByPassword(password));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Please Check Password Device Not Found!";
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

        public async Task<ResponseDto> UpdateSmartLamp(UpdateSmartLampDto smartLampDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartLamp smartLamp = smartLampRepository.GetSmartLampById(smartLampDto.DeviceId)!;
                smartLamp.Color = smartLampDto.Color;
                smartLamp.IsOn=smartLampDto.IsOn;

                responseDto.Result = mapper.Map<SmartLampDto>(
                                        await smartLampRepository.UpdateSmartLamp(smartLamp));
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
