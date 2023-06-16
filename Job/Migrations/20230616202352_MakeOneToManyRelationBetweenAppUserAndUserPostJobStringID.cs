using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Job.Migrations
{
    /// <inheritdoc />
    public partial class MakeOneToManyRelationBetweenAppUserAndUserPostJobStringID : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "AppUserId",
                table: "UserPostJobs",
                type: "nvarchar(450)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_AppUserId",
                table: "UserPostJobs",
                column: "AppUserId");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPostJobs_AspNetUsers_AppUserId",
                table: "UserPostJobs",
                column: "AppUserId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserPostJobs_AspNetUsers_AppUserId",
                table: "UserPostJobs");

            migrationBuilder.DropIndex(
                name: "IX_UserPostJobs_AppUserId",
                table: "UserPostJobs");

            migrationBuilder.DropColumn(
                name: "AppUserId",
                table: "UserPostJobs");
        }
    }
}
