using AutoMapper;
using PlatformService.Models;
using PlatformService.Dtos;

namespace PlatformService.Profiles
{
    public class PlatformsProfile :Profile
    {
        public PlatformsProfile()
        {
            CreateMap<Platform,PlatformReadDto>();
            CreateMap<PlatformCreateDto,Platform>();

        }
    }
}