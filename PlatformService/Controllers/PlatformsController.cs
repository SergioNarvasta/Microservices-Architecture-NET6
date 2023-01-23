using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using PlatformService.Data;
using PlatformService.Models;
using PlatformService.Dtos;

namespace PlatformService.AddControllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PlatformsController : Controller
    {
        private readonly IPlatformRepo _repository;
        private readonly IMapper _mapper;

        public PlatformsController(IPlatformRepo repository,IMapper mapper)
        {
            _repository = repository;
            _mapper = mapper;
    
        }
        [HttpGet]
        public ActionResult <IEnumerable<PlatformReadDto>>GetPlatforms()
        {
            Console.WriteLine("Gettins Platforms");
            var platformItem = _repository.GetAllPlatform();
            return Ok(_mapper.Map<IEnumerable<PlatformReadDto>>(platformItem));

        }
    }
    
}