using HomeAssistant.Common.DTOs;
using HomeAssistant.SmartSpeakerApi.DTOs;
using HomeAssistant.SmartSpeakerApi.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace HomeAssistant.SmartSpeakerApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SmartSpeakerController : ControllerBase
    {
        private readonly ISmartSpeakerService smartSpeakerService;

        public SmartSpeakerController(ISmartSpeakerService smartSpeakerService)
        {
            this.smartSpeakerService = smartSpeakerService;
        }

        [HttpPost]
        public async Task<IActionResult> CreateNewSmartSpeaker(SmartSpeakerDto smartSpeakerDto)
        {
            ResponseDto responseDto = await smartSpeakerService.CreateSmartSpeaker(smartSpeakerDto);
            return Ok(responseDto);
        }

        [HttpPatch]
        public async Task<IActionResult> UpdateSmartSpeaker(UpdateSmartSpeakerDto smartSpeakerDto)
        {
            ResponseDto responseDto = await smartSpeakerService.UpdateSmartSpeaker(smartSpeakerDto);
            return Ok(responseDto);
        }

        [HttpDelete]
        public async Task<IActionResult> RemoveSmartSpeaker(Guid deviceId)
        {
            ResponseDto responseDto = await smartSpeakerService.DeleteSmartSpeaker(deviceId);
            return Ok(responseDto);
        }


        [HttpGet]
        public IActionResult GetAllSmartSpeakers()
        {
            ResponseDto responseDto = smartSpeakerService.GetAllSmartSpeaker();
            return Ok(responseDto);
        }


        [HttpGet("ByPassword")]
        public IActionResult GetSmartSpeakerByPassword(string devicePassword)
        {
            ResponseDto responseDto = smartSpeakerService.GetSmartSpeakerByPassword(devicePassword);
            return Ok(responseDto);
        }
    }
}
