using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartGarageApi.DTOs;
using HomeAssistant.SmartGarageApi.Models.Domain;
using HomeAssistant.SmartGarageApi.Repositories;

namespace HomeAssistant.SmartGarageApi.Services
{
    public class SmartGarageService : ISmartGarageService
    {
        private readonly ISmartGarageRepository smartGarageRepository;
        private readonly IMapper mapper;
        public SmartGarageService(ISmartGarageRepository smartGarageRepository, IMapper mapper)
        {
            this.smartGarageRepository = smartGarageRepository;
            this.mapper = mapper;
        }



        public async Task<ResponseDto> CreateSmartGarage(SmartGarageDto smartGarageDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartGarage smartGarage = mapper.Map<SmartGarage>(smartGarageDto);
                var smartGarageExist = smartGarageRepository.CheckSmartGaarageExist(smartGarageDto.DevicePassword);

                if (!smartGarageExist)
                {
                    await smartGarageRepository.CreateSmartGarage(smartGarage);
                    responseDto.Result = mapper.Map<SmartGarageDto>(smartGarage);
                    responseDto.Success = true;

                }
                else
                {
                    responseDto.Result = null;
                    responseDto.Success = false;
                    responseDto.Message = "This Password Already Exist ";
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

        public async Task<ResponseDto> DeleteSmartGarage(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {

                SmartGarage? smartGarage = smartGarageRepository.GetSmartGarageById(deviceId);
                if (smartGarage != null)
                {
                    await smartGarageRepository.DeleteSmartGarage(smartGarage);
                    responseDto.Result = mapper.Map<SmartGarageDto>(smartGarage);
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Result = null;
                    responseDto.Success = false;
                    responseDto.Message = $"Smart Garage with deviceId: {deviceId} not found!";
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

        public ResponseDto GetAllSmartGarages()
        {
            ResponseDto responseDto = new();

            try
            {
                List<SmartGarage> smartGarages = smartGarageRepository.GetAllSmartGarages();
                responseDto.Result = mapper.Map<List<SmartGarageDto>>(smartGarages);
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

        public ResponseDto GetSmartGarageByPassword(string devicePassword)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartGarage? smartGarage = smartGarageRepository.GetSmartGarageByPassword(devicePassword);
                if (smartGarage != null)
                {
                    responseDto.Result = mapper.Map<SmartGarageDto>(smartGarage);
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Success = false;
                    responseDto.Message = $"Smart Garage with devicePassword: {devicePassword} not found!";
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

        public async Task<ResponseDto> UpdateSmartGarage(UpdateSmartGarageDto smartGarageDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartGarage smartGarage = smartGarageRepository.GetSmartGarageById(smartGarageDto.DeviceId)!;
                smartGarage.IsOn = smartGarageDto.IsOn;
                smartGarage.IsDown=smartGarageDto.IsDown;
                smartGarage.IsUp=smartGarageDto.IsUp;

                await smartGarageRepository.UpdateSmartGarage(smartGarage);
                responseDto.Result = mapper.Map<SmartGarageDto>(smartGarage);
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
