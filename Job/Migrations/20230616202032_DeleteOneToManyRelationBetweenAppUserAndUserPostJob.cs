using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Job.Migrations
{
    /// <inheritdoc />
    public partial class DeleteOneToManyRelationBetweenAppUserAndUserPostJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UserPostJobs_AspNetUsers_AppUserId1",
                table: "UserPostJobs");

            migrationBuilder.DropIndex(
                name: "IX_UserPostJobs_AppUserId1",
                table: "UserPostJobs");

            migrationBuilder.DropColumn(
                name: "AppUserId",
                table: "UserPostJobs");

            migrationBuilder.DropColumn(
                name: "AppUserId1",
                table: "UserPostJobs");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "AppUserId",
                table: "UserPostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "AppUserId1",
                table: "UserPostJobs",
                type: "nvarchar(450)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_AppUserId1",
                table: "UserPostJobs",
                column: "AppUserId1");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPostJobs_AspNetUsers_AppUserId1",
                table: "UserPostJobs",
                column: "AppUserId1",
                principalTable: "AspNetUsers",
                principalColumn: "Id");
        }
    }
}
