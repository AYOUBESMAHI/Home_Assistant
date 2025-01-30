using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartGarageApi.DTOs;
using HomeAssistant.SmartGarageApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartGarageApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartGarageController : ControllerBase
    {
        private readonly ISmartGarageService smartGarageService;

        public SmartGarageController(ISmartGarageService smartGarageService) {
            this.smartGarageService = smartGarageService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartGarage(SmartGarageDto smartGarageDto)
        {
            ResponseDto responseDto =  await smartGarageService.CreateSmartGarage(smartGarageDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartGarage(UpdateSmartGarageDto smartGarageDto)
        {
            ResponseDto responseDto = await smartGarageService.UpdateSmartGarage(smartGarageDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartGarage(Guid deviceId)
        {
            ResponseDto responseDto = await smartGarageService.DeleteSmartGarage(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public  IActionResult GetAllSmartGarages()
        {
            ResponseDto responseDto =  smartGarageService.GetAllSmartGarages();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartGarageByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartGarageService.GetSmartGarageByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
