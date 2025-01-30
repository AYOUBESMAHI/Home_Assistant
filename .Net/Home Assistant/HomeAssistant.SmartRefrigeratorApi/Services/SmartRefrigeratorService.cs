using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartRefrigeratorApi.DTOs;
using HomeAssistant.SmartRefrigeratorApi.Models.Domain;
using HomeAssistant.SmartRefrigeratorApi.Repositories;

namespace HomeAssistant.SmartRefrigeratorApi.Services
{
    public class SmartRefrigeratorService:ISmartRefrigeratorService
    {
        private readonly IMapper mapper;
        private readonly ISmartRefrigeratorRepository smartRefrigeratorRepository;

        public SmartRefrigeratorService(IMapper mapper, ISmartRefrigeratorRepository smartRefrigeratorRepository)
        {
            this.mapper = mapper;
            this.smartRefrigeratorRepository = smartRefrigeratorRepository;
        }


        public async Task<ResponseDto> CreateSmartRefrigerator(SmartRefrigeratorDto smartRefrigeratorDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartRefrigeratorRepository.CheckPasswordExist(smartRefrigeratorDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartRefrigerator smartRefrigerator = mapper.Map<SmartRefrigerator>(smartRefrigeratorDto);
                    responseDto.Result = mapper.Map<SmartRefrigeratorDto>(
                                                await smartRefrigeratorRepository.CreateSmartRefrigerator(smartRefrigerator));
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

        public async Task<ResponseDto> DeleteSmartRefrigerator(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartRefrigerator = smartRefrigeratorRepository.GetSmartRefrigeratorpById(deviceId);

                if (smartRefrigerator != null)
                {
                    responseDto.Result = mapper.Map<SmartRefrigeratorDto>(
                                            await smartRefrigeratorRepository.DeleteSmartRefrigerator(smartRefrigerator));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Refrigerator Not Found !";
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

        public ResponseDto GetAllSmartRefrigerator()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartRefrigeratorDto>>(smartRefrigeratorRepository.GetAllSmartRefrigerators());
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

        public ResponseDto GetSmartRefrigeratorByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartRefrigeratorRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartRefrigeratorDto>(
                                                 smartRefrigeratorRepository.GetSmartRefrigeratorByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartRefrigerator(UpdateSmartRefrigeratorDto smartRefrigeratorDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartRefrigerator smartRefrigerator = smartRefrigeratorRepository.GetSmartRefrigeratorpById(smartRefrigeratorDto.DeviceId)!;
                smartRefrigerator.IsOn = smartRefrigeratorDto.IsOn;
                smartRefrigerator.FreezerTemp = smartRefrigeratorDto.FreezerTemp;
                smartRefrigerator.FridgeTemp = smartRefrigeratorDto.FridgeTemp;
                smartRefrigerator.IsDoorOpen = smartRefrigeratorDto.IsDoorOpen;
                smartRefrigerator.coolingModes = smartRefrigeratorDto.coolingModes;

                responseDto.Result = mapper.Map<SmartRefrigeratorDto>(
                                        await smartRefrigeratorRepository.UpdateSmartRefrigerator(smartRefrigerator));
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
