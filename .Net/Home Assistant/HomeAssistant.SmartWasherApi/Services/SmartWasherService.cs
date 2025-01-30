using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartWasherApi.DTOs;
using HomeAssistant.SmartWasherApi.Models.Domain;
using HomeAssistant.SmartWasherApi.Repositories;

namespace HomeAssistant.SmartWasherApi.Services
{
    public class SmartWasherService:ISmartWasherService
    {
        private readonly IMapper mapper;
        private readonly ISmartWasherRepository smartWasherRepository;

        public SmartWasherService(IMapper mapper, ISmartWasherRepository smartWasherRepository)
        {
            this.mapper = mapper;
            this.smartWasherRepository = smartWasherRepository;
        }


        public async Task<ResponseDto> CreateSmartWasher(SmartWasherDto smartWasherDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartWasherRepository.CheckPasswordExist(smartWasherDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartWasher smartWasher = mapper.Map<SmartWasher>(smartWasherDto);
                    responseDto.Result = mapper.Map<SmartWasherDto>(
                                                await smartWasherRepository.CreateSmartWasher(smartWasher));
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

        public async Task<ResponseDto> DeleteSmartWasher(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartWasher = smartWasherRepository.GetSmartWasherpById(deviceId);

                if (smartWasher != null)
                {
                    responseDto.Result = mapper.Map<SmartWasherDto>(
                                            await smartWasherRepository.DeleteSmartWasher(smartWasher));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Washer Not Found !";
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

        public ResponseDto GetAllSmartWasher()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartWasherDto>>(smartWasherRepository.GetAllSmartWashers());
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

        public ResponseDto GetSmartWasherByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartWasherRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartWasherDto>(
                                                 smartWasherRepository.GetSmartWasherByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartWasher(UpdateSmartWasherDto smartWasherDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartWasher smartWasher = smartWasherRepository.GetSmartWasherpById(smartWasherDto.DeviceId)!;
                smartWasher.Temperature = smartWasherDto.Temperature;
                smartWasher.SoilLevel = smartWasherDto.SoilLevel;
                smartWasher.SpeedLevel = smartWasherDto.SpeedLevel;
                smartWasher.WashingMode = smartWasherDto.WashingMode;
                smartWasher.IsOn = smartWasherDto.IsOn;

                responseDto.Result = mapper.Map<SmartWasherDto>(
                                        await smartWasherRepository.UpdateSmartWasher(smartWasher));
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
