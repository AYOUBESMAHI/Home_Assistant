using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HomeAssistant.SmartClockApi.Migrations
{
    /// <inheritdoc />
    public partial class SmartClock_Update1 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "roomsIndex");

            //migrationBuilder.DropColumn(
            //    name: "ImagePath",
            //    table: "SmartDevices");

            migrationBuilder.AlterColumn<string>(
                name: "DevicePassword",
                table: "SmartDevices",
                type: "nvarchar(max)",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddColumn<int>(
                name: "RoomIndex",
                table: "SmartDevices",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RoomIndex",
                table: "SmartDevices");

            migrationBuilder.AlterColumn<int>(
                name: "DevicePassword",
                table: "SmartDevices",
                type: "int",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)");

            //migrationBuilder.AddColumn<string>(
            //    name: "ImagePath",
            //    table: "SmartDevices",
            //    type: "nvarchar(max)",
            //    nullable: false,
            //    defaultValue: "");

            migrationBuilder.CreateTable(
                name: "roomsIndex",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Index = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_roomsIndex", x => x.Id);
                    table.ForeignKey(
                        name: "FK_roomsIndex_SmartDevices_DeviceId",
                        column: x => x.DeviceId,
                        principalTable: "SmartDevices",
                        principalColumn: "DeviceId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_roomsIndex_DeviceId",
                table: "roomsIndex",
                column: "DeviceId");
        }
    }
}
