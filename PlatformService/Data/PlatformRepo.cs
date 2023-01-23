using PlatformService.Models;

namespace PlatformService.Data
{
    public class PlatformRepo : IPlatformRepo
    {
        private readonly AppDbContext _context;

        public PlatformRepo(AppDbContext context)
        {
            _context = context;

        public IEnumerable<Platform> GetAllPlatform() 
        {
                return _context.Platform.ToList();
        }

        public Platform GetPlatformById(int Id)
        {
           return _context.Platform.FirstOrDefault(x => x.Id == Id);
        }

        public void CreatePlatform(Platform plat)
        {
              if(plat==null){
                throw new ArgumentNullException(nameof(plat));
              }   
              _context.Platform.Add(plat);
        }

        public bool SaveChanges()
        {
          return(_context.SaveChanges() >= 0);
        }
    }
}