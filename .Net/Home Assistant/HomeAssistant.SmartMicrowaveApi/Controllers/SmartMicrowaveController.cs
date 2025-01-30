using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartMicrowaveApi.DTO_s;
using HomeAssistant.SmartMicrowaveApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartMicrowaveApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartMicrowaveController : ControllerBase
    {
        private readonly ISmartMicrowaveService smartMicrowaveService;

        public SmartMicrowaveController(ISmartMicrowaveService smartMicrowaveService)
        {
            this.smartMicrowaveService = smartMicrowaveService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartMicrowave(SmartMicrowaveDto smartMicrowaveDto)
        {
            ResponseDto responseDto = await smartMicrowaveService.CreateSmartMicrowave(smartMicrowaveDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartMicrowave(UpdateSmartMicrowaveDto smartMicrowaveDto)
        {
            ResponseDto responseDto = await smartMicrowaveService.UpdateSmartMicrowave(smartMicrowaveDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartMicrowave(Guid deviceId)
        {
            ResponseDto responseDto = await smartMicrowaveService.DeleteSmartMicrowave(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartMicrowaves()
        {
            ResponseDto responseDto = smartMicrowaveService.GetAllSmartMicrowave();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartMicrowavesByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartMicrowaveService.GetSmartMicrowaveByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
