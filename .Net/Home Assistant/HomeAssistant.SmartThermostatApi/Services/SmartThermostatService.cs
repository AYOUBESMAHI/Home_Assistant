using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartThermostatApi.DTOs;
using HomeAssistant.SmartThermostatApi.Models.Domain;
using HomeAssistant.SmartThermostatApi.Repositories;

namespace HomeAssistant.SmartThermostatApi.Services
{
    public class SmartThermostatService:ISmartThermostatService
    {
        private readonly IMapper mapper;
        private readonly ISmartThermostatRepository smartThermostatRepository;

        public SmartThermostatService(IMapper mapper, ISmartThermostatRepository smartThermostatRepository)
        {
            this.mapper = mapper;
            this.smartThermostatRepository = smartThermostatRepository;
        }


        public async Task<ResponseDto> CreateSmartThermostat(SmartThermostatDto smartThermostatDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartThermostatRepository.CheckPasswordExist(smartThermostatDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartThermostat smartThermostat = mapper.Map<SmartThermostat>(smartThermostatDto);
                    responseDto.Result = mapper.Map<SmartThermostatDto>(
                                                await smartThermostatRepository.CreateSmartThermostat(smartThermostat));
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

        public async Task<ResponseDto> DeleteSmartThermostat(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartThermostat = smartThermostatRepository.GetSmartThermostatpById(deviceId);

                if (smartThermostat != null)
                {
                    responseDto.Result = mapper.Map<SmartThermostatDto>(
                                            await smartThermostatRepository.DeleteSmartThermostat(smartThermostat));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Thermostat Not Found !";
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

        public ResponseDto GetAllSmartThermostat()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartThermostatDto>>(smartThermostatRepository.GetAllSmartThermostats());
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

        public ResponseDto GetSmartThermostatByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartThermostatRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartThermostatDto>(
                                                 smartThermostatRepository.GetSmartThermostatByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartThermostat(UpdateSmartThermostatDto smartThermostatDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartThermostat smartThermostat = smartThermostatRepository.GetSmartThermostatpById(smartThermostatDto.DeviceId)!;
                smartThermostat.Temperature = smartThermostatDto.Temperature;
                smartThermostat.IsOn = smartThermostatDto.IsOn;

                responseDto.Result = mapper.Map<SmartThermostatDto>(
                                        await smartThermostatRepository.UpdateSmartThermostat(smartThermostat));
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
