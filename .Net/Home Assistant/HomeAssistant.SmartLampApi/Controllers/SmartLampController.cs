using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartLampApi.DTOs;
using HomeAssistant.SmartLampApi.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartLampApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartLampController : ControllerBase
    {
        private readonly ISmartLampService smartLampService;

        public SmartLampController(ISmartLampService smartLampService)
        {
            this.smartLampService = smartLampService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartLamp(SmartLampDto smartLampDto)
        {
            ResponseDto responseDto = await smartLampService.CreateSmartLamp(smartLampDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartLamp(UpdateSmartLampDto smartLampDto)
        {
            ResponseDto responseDto = await smartLampService.UpdateSmartLamp(smartLampDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartLamp(Guid deviceId)
        {
            ResponseDto responseDto = await smartLampService.DeleteSmartLamp(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartLamps()
        {
            ResponseDto responseDto = smartLampService.GetAllSmartLamp();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartLampByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartLampService.GetSmartLampByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
