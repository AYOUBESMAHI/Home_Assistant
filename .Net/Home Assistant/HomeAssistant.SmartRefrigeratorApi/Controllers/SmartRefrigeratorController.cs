using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartRefrigeratorApi.DTOs;
using HomeAssistant.SmartRefrigeratorApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartRefrigeratorApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartRefrigeratorController : ControllerBase
    {
        private readonly ISmartRefrigeratorService smartRefrigeratorService;

        public SmartRefrigeratorController(ISmartRefrigeratorService smartRefrigeratorService)
        {
            this.smartRefrigeratorService = smartRefrigeratorService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartRefrigerator(SmartRefrigeratorDto smartRefrigeratorDto)
        {
            ResponseDto responseDto = await smartRefrigeratorService.CreateSmartRefrigerator(smartRefrigeratorDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartRefrigerator(UpdateSmartRefrigeratorDto smartRefrigeratorDto)
        {
            ResponseDto responseDto = await smartRefrigeratorService.UpdateSmartRefrigerator(smartRefrigeratorDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartRefrigerator(Guid deviceId)
        {
            ResponseDto responseDto = await smartRefrigeratorService.DeleteSmartRefrigerator(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartRefrigerators()
        {
            ResponseDto responseDto = smartRefrigeratorService.GetAllSmartRefrigerator();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartRefrigeratorByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartRefrigeratorService.GetSmartRefrigeratorByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
