using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartClockApi.DTOs;
using HomeAssistant.SmartClockApi.Services;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartClockApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartClockController : ControllerBase
    {
        readonly ISmartClockService smartClockService;
        public SmartClockController(ISmartClockService smartClockService)
        {
            this.smartClockService = smartClockService;
        }



        [HttpPost]
        public async Task<IActionResult> CreateNewSmartClock(SmartClockDto smartClockDto)
        {
            ResponseDto responseDto = new ResponseDto();
            responseDto = await smartClockService.CreateSmartClock(smartClockDto);

            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartClock(UpdateSmartClockDto smartClockDto)
        {
            ResponseDto responseDto = new ResponseDto();
            responseDto = await smartClockService.UpdateSmartClock(smartClockDto);

            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartClock(Guid deviceId)
        {
            ResponseDto responseDto = new ResponseDto();
            responseDto = await smartClockService.DeleteSmartClock(deviceId);

            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartClocks()
        {
            ResponseDto responseDto = new ResponseDto();
            responseDto = smartClockService.GetAllSmartClocks();

            return Ok(responseDto);
        }

        [HttpGet("ByPassword")]
        public IActionResult GetSmartClock(string devicePassword)
        {
            ResponseDto responseDto = new ResponseDto();
            responseDto = smartClockService.GetSmartClockByPassword(devicePassword);

            return Ok(responseDto);
        }


    }
}
