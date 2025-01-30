using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HomeAssistant.SmartGarageApi.Migrations
{
    /// <inheritdoc />
    public partial class SmartGarage_InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.CreateTable(
            //    name: "SmartDevices",
            //    columns: table => new
            //    {
            //        DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
            //        DevicePassword = table.Column<int>(type: "int", nullable: false),
            //        Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
            //        IsOn = table.Column<bool>(type: "bit", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_SmartDevices", x => x.DeviceId);
            //    });

            //migrationBuilder.CreateTable(
            //    name: "RoomsIndex",
            //    columns: table => new
            //    {
            //        Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
            //        Index = table.Column<int>(type: "int", nullable: false),
            //        DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
            //    },
            //    constraints: table =>
            //    {
            //        table.PrimaryKey("PK_RoomsIndex", x => x.Id);
            //        table.ForeignKey(
            //            name: "FK_RoomsIndex_SmartDevices_DeviceId",
            //            column: x => x.DeviceId,
            //            principalTable: "SmartDevices",
            //            principalColumn: "DeviceId",
            //            onDelete: ReferentialAction.Cascade);
            //    });

            migrationBuilder.CreateTable(
                name: "SmartGarages",
                columns: table => new
                {
                    DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsUp = table.Column<bool>(type: "bit", nullable: false),
                    IsDown = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SmartGarages", x => x.DeviceId);
                    table.ForeignKey(
                        name: "FK_SmartGarages_SmartDevices_DeviceId",
                        column: x => x.DeviceId,
                        principalTable: "SmartDevices",
                        principalColumn: "DeviceId",
                        onUpdate:ReferentialAction.Cascade,
                        onDelete: ReferentialAction.Cascade);
                });

            //migrationBuilder.CreateIndex(
            //    name: "IX_RoomsIndex_DeviceId",
            //    table: "RoomsIndex",
            //    column: "DeviceId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.DropTable(
            //    name: "RoomsIndex");

            migrationBuilder.DropTable(
                name: "SmartGarages");

            //migrationBuilder.DropTable(
            //    name: "SmartDevices");
        }
    }
}
