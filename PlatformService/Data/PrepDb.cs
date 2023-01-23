using PlatformService.Models;
using Microsoft.AspNetCore.Builder;

namespace PlatformService.Data
{

    public class PrepDb
    {
        public static void PrepPopulation(IApplicationBuilder app)
        {
            using (var serviceScope = app.ApplicationServices.CreateScope())
            {
                SeedData(serviceScope.ServiceProvider.GetService<AppDbContext>());
            }
        }
        public static void SeedData( AppDbContext context)
        {
            if(!context.Platform.Any())
            {
                Console.WriteLine("Seeding Data ...");
                context.Platform.AddRange(
                    new Platform(){Name="Dot Net",Publisher="Microsoft",Cost="Free"}
                );
                context.SaveChanges();

            }else{
                Console.WriteLine("We already have data");
            }
        }

    }
}