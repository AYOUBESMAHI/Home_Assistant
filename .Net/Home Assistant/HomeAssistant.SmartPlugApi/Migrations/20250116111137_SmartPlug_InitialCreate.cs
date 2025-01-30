using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HomeAssistant.SmartPlugApi.Migrations
{
    /// <inheritdoc />
    public partial class SmartPlug_InitialCreate : Migration
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
                name: "SmartPlug",
                columns: table => new
                {
                    DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UsageKw = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SmartPlug", x => x.DeviceId);
                    table.ForeignKey(
                        name: "FK_SmartPlug_SmartDevices_DeviceId",
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
                name: "SmartPlug");

            //migrationBuilder.DropTable(
            //    name: "SmartDevices");
        }
    }
}
