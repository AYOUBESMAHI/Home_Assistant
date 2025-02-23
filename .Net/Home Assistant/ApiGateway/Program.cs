using Ocelot.DependencyInjection;
using Ocelot.Middleware;

var builder = WebApplication.CreateBuilder(args);

builder.Configuration.SetBasePath(builder.Environment.ContentRootPath)
        .AddJsonFile("ocelot.json", optional: false, reloadOnChange: true)
        .AddEnvironmentVariables();

builder.Services.AddOcelot();

var app = builder.Build();
app.MapGet("/", () => "Hello, World!");

await app.UseOcelot();


//app.Run();

app.Run("http://localhost:8000");