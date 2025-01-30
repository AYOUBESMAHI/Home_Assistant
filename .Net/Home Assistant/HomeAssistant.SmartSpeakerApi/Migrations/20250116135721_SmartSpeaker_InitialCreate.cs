using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace HomeAssistant.SmartSpeakerApi.Migrations
{
    /// <inheritdoc />
    public partial class SmartSpeaker_InitialCreate : Migration
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
                name: "SmartSpeaker",
                columns: table => new
                {
                    DeviceId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Volume = table.Column<double>(type: "float", nullable: false),
                    IsPlaying = table.Column<bool>(type: "bit", nullable: false),
                    IndexCurrentSong = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_SmartSpeaker", x => x.DeviceId);
                    table.ForeignKey(
                        name: "FK_SmartSpeaker_SmartDevices_DeviceId",
                        column: x => x.DeviceId,
                        principalTable: "SmartDevices",
                        principalColumn: "DeviceId",
                        onUpdate:ReferentialAction.Cascade,
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "PlaylistItem",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    SmarSpeakerId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PlaylistItem", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PlaylistItem_SmartSpeaker_SmarSpeakerId",
                        column: x => x.SmarSpeakerId,
                        principalTable: "SmartSpeaker",
                        principalColumn: "DeviceId",
                        onUpdate:ReferentialAction.Cascade,
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PlaylistItem_SmarSpeakerId",
                table: "PlaylistItem",
                column: "SmarSpeakerId");

            //migrationBuilder.CreateIndex(
            //    name: "IX_RoomsIndex_DeviceId",
            //    table: "RoomsIndex",
            //    column: "DeviceId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PlaylistItem");

            //migrationBuilder.DropTable(
            //    name: "RoomsIndex");

            migrationBuilder.DropTable(
                name: "SmartSpeaker");

            //migrationBuilder.DropTable(
            //    name: "SmartDevices");
        }
    }
}
