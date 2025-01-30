using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartMicrowaveApi.DTO_s;
using HomeAssistant.SmartMicrowaveApi.Models.Domain;
using HomeAssistant.SmartMicrowaveApi.Repositories;

namespace HomeAssistant.SmartMicrowaveApi.Services
{
    public class SmartMicrowaveService : ISmartMicrowaveService
    {
        private readonly IMapper mapper;
        private readonly ISmartMicrowaveRepository smartMicrowaveRepository;

        public SmartMicrowaveService(IMapper mapper, ISmartMicrowaveRepository smartMicrowaveRepository)
        {
            this.mapper = mapper;
            this.smartMicrowaveRepository = smartMicrowaveRepository;
        }


        public async Task<ResponseDto> CreateSmartMicrowave(SmartMicrowaveDto smartMicrowaveDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartMicrowaveRepository.CheckPasswordExist(smartMicrowaveDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartMicrowave smartMicrowave = mapper.Map<SmartMicrowave>(smartMicrowaveDto);
                    responseDto.Result = mapper.Map<SmartMicrowaveDto>(
                                                await smartMicrowaveRepository.CreateSmartMicrowave(smartMicrowave));
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

        public async Task<ResponseDto> DeleteSmartMicrowave(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartMicrowave = smartMicrowaveRepository.GetSmartMicrowavepById(deviceId);

                if (smartMicrowave != null)
                {
                    responseDto.Result = mapper.Map<SmartMicrowaveDto>(
                                            await smartMicrowaveRepository.DeleteSmartMicrowave(smartMicrowave));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Microwave Not Found !";
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

        public ResponseDto GetAllSmartMicrowave()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartMicrowaveDto>>(smartMicrowaveRepository.GetAllSmartMicrowaves());
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

        public ResponseDto GetSmartMicrowaveByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartMicrowaveRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartMicrowaveDto>(
                                                 smartMicrowaveRepository.GetSmartMicrowaveByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartMicrowave(UpdateSmartMicrowaveDto smartMicrowaveDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartMicrowave smartMicrowave = smartMicrowaveRepository.GetSmartMicrowavepById(smartMicrowaveDto.DeviceId)!;
                smartMicrowave.cookingMode = smartMicrowaveDto.cookingMode;
                smartMicrowave.Time = smartMicrowaveDto.Time;
                smartMicrowave.Temp = smartMicrowaveDto.Temp;
                smartMicrowave.IsOn = smartMicrowaveDto.IsOn;

                responseDto.Result = mapper.Map<SmartMicrowaveDto>(
                                        await smartMicrowaveRepository.UpdateSmartMicrowave(smartMicrowave));
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
