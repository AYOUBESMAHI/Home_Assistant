using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartTvApi.DTOs;
using HomeAssistant.SmartTvApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartTvApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartTvController : ControllerBase
    {
        private readonly ISmartTvService smartTvService;

        public SmartTvController(ISmartTvService smartTvService)
        {
            this.smartTvService = smartTvService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartTv(SmartTvDto smartTvDto)
        {
            ResponseDto responseDto = await smartTvService.CreateSmartTv(smartTvDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartTv(UpdateSmartTvDto smartTvDto)
        {
            ResponseDto responseDto = await smartTvService.UpdateSmartTv(smartTvDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartTv(Guid deviceId)
        {
            ResponseDto responseDto = await smartTvService.DeleteSmartTv(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartTvs()
        {
            ResponseDto responseDto = smartTvService.GetAllSmartTv();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartTvByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartTvService.GetSmartTvByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
