using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HomeAssistant.SmartRefrigeratorApi.Migrations
{
    /// <inheritdoc />
    public partial class SmartRefrigerator_InitialCreate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            //migrationBuilder.CreateTable(
            //    name: "SmartDevices",
            //    columns: table => new
            //    {
            //        DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
            //        DevicePassword = table.Column<string>(type: "nvarchar(max)", nullable: false),
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
                name: "SmartRefrigerator",
                columns: table => new
                {
                    DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsDoorOpen = table.Column<bool>(type: "bit", nullable: false),
                    FridgeTemp = table.Column<int>(type: "int", nullable: false),
                    FreezerTemp = table.Column<int>(type: "int", nullable: false),
                    coolingModes = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SmartRefrigerator", x => x.DeviceId);
                    table.ForeignKey(
                        name: "FK_SmartRefrigerator_SmartDevices_DeviceId",
                        column: x => x.DeviceId,
                        principalTable: "SmartDevices",
                        principalColumn: "DeviceId",
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
                name: "SmartRefrigerator");

            //migrationBuilder.DropTable(
            //    name: "SmartDevices");
        }
    }
}
