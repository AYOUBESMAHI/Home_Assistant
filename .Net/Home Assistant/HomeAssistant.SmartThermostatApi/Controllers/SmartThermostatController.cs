using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartThermostatApi.DTOs;
using HomeAssistant.SmartThermostatApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartThermostatApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartThermostatController : ControllerBase
    {
        private readonly ISmartThermostatService smartThermostatService;

        public SmartThermostatController(ISmartThermostatService smartThermostatService)
        {
            this.smartThermostatService = smartThermostatService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartThermostat(SmartThermostatDto smartThermostatDto)
        {
            ResponseDto responseDto = await smartThermostatService.CreateSmartThermostat(smartThermostatDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartThermostat(UpdateSmartThermostatDto smartThermostatDto)
        {
            ResponseDto responseDto = await smartThermostatService.UpdateSmartThermostat(smartThermostatDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartThermostat(Guid deviceId)
        {
            ResponseDto responseDto = await smartThermostatService.DeleteSmartThermostat(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartThermostats()
        {
            ResponseDto responseDto = smartThermostatService.GetAllSmartThermostat();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartThermostatByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartThermostatService.GetSmartThermostatByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
