using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartWasherApi.DTOs;
using HomeAssistant.SmartWasherApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartWasherApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartWasherController : ControllerBase
    {
        private readonly ISmartWasherService smartWasherService;

        public SmartWasherController(ISmartWasherService smartWasherService)
        {
            this.smartWasherService = smartWasherService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartWasher(SmartWasherDto smartWasherDto)
        {
            ResponseDto responseDto = await smartWasherService.CreateSmartWasher(smartWasherDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartWasher(UpdateSmartWasherDto smartWasherDto)
        {
            ResponseDto responseDto = await smartWasherService.UpdateSmartWasher(smartWasherDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartWasher(Guid deviceId)
        {
            ResponseDto responseDto = await smartWasherService.DeleteSmartWasher(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartWashers()
        {
            ResponseDto responseDto = smartWasherService.GetAllSmartWasher();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartWasherByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartWasherService.GetSmartWasherByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
