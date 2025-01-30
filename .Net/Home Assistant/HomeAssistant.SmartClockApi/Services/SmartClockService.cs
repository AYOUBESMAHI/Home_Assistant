using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.Common.Models;
using HomeAssistant.SmartClockApi.DTOs;
using HomeAssistant.SmartClockApi.Models.Domain;
using HomeAssistant.SmartClockApi.Repositories;

namespace HomeAssistant.SmartClockApi.Services
{
    public class SmartClockService : ISmartClockService
    {
        private readonly ISmartClockRepository smartClockRepository;
        private readonly IMapper mapper;

        public SmartClockService(ISmartClockRepository smartClockRepository, IMapper mapper)
        {
            this.smartClockRepository = smartClockRepository;
            this.mapper = mapper;
        }


        public async Task<ResponseDto> CreateSmartClock(SmartClockDto smartClockDto)
        {
            ResponseDto responseDto = new();
            SmartClock smartClock = mapper.Map<SmartClock>(smartClockDto);

            try
            {
                var checkPasswordExist = smartClockRepository.CheckPasswordExist(smartClockDto.DevicePassword);


                if (!checkPasswordExist)
                {
                    await smartClockRepository.CreateSmartClock(smartClock);
                    responseDto.Result = mapper.Map<SmartClockDto>(smartClock);
                    responseDto.Success = true;

                }
                else
                {
                    responseDto.Success = false;
                    responseDto.Message = "Password Already Exist!";
                }

            }
            catch (Exception e)
            {
                responseDto.Message = e.Message;
                responseDto.Success = false;
                throw;
            }

            return responseDto;

        }

        public async Task<ResponseDto> DeleteSmartClock(Guid DeviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartClock smartClock = smartClockRepository.GetSmartClockById(DeviceId);
                await smartClockRepository.DeleteSmartClock(smartClock);
                responseDto.Result = mapper.Map<SmartClockDto>(smartClock);
                responseDto.Success = true;

            }
            catch (Exception e)
            {
                responseDto.Message = e.Message;
                responseDto.Success = false;
                throw;
            }

            return responseDto;
        }

        public ResponseDto GetAllSmartClocks()
        {
            ResponseDto responseDto = new();

            try
            {
                List<SmartClock> smartClocks = smartClockRepository.GetAllSmartClocks();
                responseDto.Result = mapper.Map<List<SmartClockDto>>(smartClocks);
                responseDto.Success = true;
            }
            catch (Exception e)
            {
                responseDto.Message = e.Message;
                responseDto.Success = false;
                throw;
            }

            return responseDto;
        }

        public ResponseDto GetSmartClockByPassword(string devicePassword)
        {
            ResponseDto responseDto = new();
            try
            {
                var smartClock = smartClockRepository.GetSmartClockByPassword(devicePassword);

                if (smartClock != null)
                {
                    responseDto.Result = mapper.Map<SmartClockDto>(smartClock);
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Clock Device Not Found !";
                    responseDto.Success = false;
                }

            }
            catch (Exception r)
            {
                responseDto.Success = false;
                responseDto.Message = r.Message;
                throw;
            }
            return responseDto;
        }

        public async Task<ResponseDto> UpdateSmartClock(UpdateSmartClockDto smartClockDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartClock smartClock = smartClockRepository.GetSmartClockById(smartClockDto.DeviceId);
                smartClock.alarm = smartClockDto.Alarm;
                smartClock.Volume = smartClockDto.Volume;
                smartClock.IsOn = smartClockDto.IsOn;

                await smartClockRepository.UpdateSmartClock(smartClock);
                responseDto.Result = mapper.Map<SmartClockDto>(smartClock);
                responseDto.Success = true;
            }
            catch (Exception e)
            {
                responseDto.Message = e.Message;
                responseDto.Success = false;
                throw;
            }

            return responseDto;
        }
    }
}
