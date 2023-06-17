using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class RemoveAppUserIdFromPostJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AppUserId",
                table: "PostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_AppUserId",
                table: "PostJobs",
                column: "AppUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_PostJobs_AspNetUsers_AppUserId",
                table: "PostJobs",
                column: "AppUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PostJobs_AspNetUsers_AppUserId",
                table: "PostJobs");

            migrationBuilder.DropIndex(
                name: "IX_PostJobs_AppUserId",
                table: "PostJobs");

            migrationBuilder.DropColumn(
                name: "AppUserId",
                table: "PostJobs");
        }
    }
}
