using HomeAssistant.SmartRefrigeratorApi.Data;
using HomeAssistant.SmartRefrigeratorApi.Repositories;
using HomeAssistant.SmartRefrigeratorApi.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddAutoMapper(typeof(Program));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


builder.Services.AddDbContext<ApplicationDbContext>(o =>
{
    o.UseSqlServer(builder.Configuration.GetConnectionString("connection"));
});

builder.Services.AddScoped<ISmartRefrigeratorRepository, SmartRefrigeratorServvice>();
builder.Services.AddScoped<ISmartRefrigeratorService, SmartRefrigeratorService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
