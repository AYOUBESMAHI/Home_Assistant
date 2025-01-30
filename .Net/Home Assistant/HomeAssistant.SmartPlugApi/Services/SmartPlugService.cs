using AutoMapper;
using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartPlugApi.DTOs;
using HomeAssistant.SmartPlugApi.Models.Domain;
using HomeAssistant.SmartPlugApi.Repositories;

namespace HomeAssistant.SmartPlugApi.Services
{
    public class SmartPlugService:ISmartPlugService
    {
        private readonly IMapper mapper;
        private readonly ISmartPlugRepository smartPlugRepository;

        public SmartPlugService(IMapper mapper, ISmartPlugRepository smartPlugRepository)
        {
            this.mapper = mapper;
            this.smartPlugRepository = smartPlugRepository;
        }


        public async Task<ResponseDto> CreateSmartPlug(SmartPlugDto smartPlugDto)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartPlugRepository.CheckPasswordExist(smartPlugDto.DevicePassword);

                if (!checkPasswordExist)
                {
                    SmartPlug smartPlug = mapper.Map<SmartPlug>(smartPlugDto);
                    responseDto.Result = mapper.Map<SmartPlugDto>(
                                                await smartPlugRepository.CreateSmartPlug(smartPlug));
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

        public async Task<ResponseDto> DeleteSmartPlug(Guid deviceId)
        {
            ResponseDto responseDto = new();

            try
            {
                var smartPlug = smartPlugRepository.GetSmartPlugpById(deviceId);

                if (smartPlug != null)
                {
                    responseDto.Result = mapper.Map<SmartPlugDto>(
                                            await smartPlugRepository.DeleteSmartPlug(smartPlug));
                    responseDto.Success = true;
                }
                else
                {
                    responseDto.Message = "Smart Plug Not Found !";
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

        public ResponseDto GetAllSmartPlug()
        {
            ResponseDto responseDto = new();

            try
            {
                responseDto.Result = mapper.Map<List<SmartPlugDto>>(smartPlugRepository.GetAllSmartPlugs());
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

        public ResponseDto GetSmartPlugByPassword(string password)
        {
            ResponseDto responseDto = new();

            try
            {
                var checkPasswordExist = smartPlugRepository.CheckPasswordExist(password);

                if (checkPasswordExist)
                {
                    responseDto.Result = mapper.Map<SmartPlugDto>(
                                                 smartPlugRepository.GetSmartPlugByPassword(password));
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

        public async Task<ResponseDto> UpdateSmartPlug(UpdateSmartPlugDto smartPlugDto)
        {
            ResponseDto responseDto = new();

            try
            {
                SmartPlug smartPlug = smartPlugRepository.GetSmartPlugpById(smartPlugDto.DeviceId)!;
                smartPlug.UsageKw = smartPlugDto.UsageKw;
                smartPlug.IsOn = smartPlugDto.IsOn;

                responseDto.Result = mapper.Map<SmartPlugDto>(
                                        await smartPlugRepository.UpdateSmartPlug(smartPlug));
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
