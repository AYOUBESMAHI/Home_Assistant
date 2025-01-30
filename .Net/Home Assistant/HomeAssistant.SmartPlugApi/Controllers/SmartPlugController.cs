using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartPlugApi.DTOs;
using HomeAssistant.SmartPlugApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartPlugApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartPlugController : ControllerBase
    {
        private readonly ISmartPlugService smartPlugService;

        public SmartPlugController(ISmartPlugService smartPlugService)
        {
            this.smartPlugService = smartPlugService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartPlug(SmartPlugDto smartPlugDto)
        {
            ResponseDto responseDto = await smartPlugService.CreateSmartPlug(smartPlugDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartPlug(UpdateSmartPlugDto smartPlugDto)
        {
            ResponseDto responseDto = await smartPlugService.UpdateSmartPlug(smartPlugDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartPlug(Guid deviceId)
        {
            ResponseDto responseDto = await smartPlugService.DeleteSmartPlug(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartPlugs()
        {
            ResponseDto responseDto = smartPlugService.GetAllSmartPlug();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartPlugByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartPlugService.GetSmartPlugByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
