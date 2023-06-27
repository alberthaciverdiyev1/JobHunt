using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class AddPostJobToMessages : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PostJobId",
                table: "Messages",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserPostJobId",
                table: "Messages",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Messages_PostJobId",
                table: "Messages",
                column: "PostJobId");

            migrationBuilder.CreateIndex(
                name: "IX_Messages_UserPostJobId",
                table: "Messages",
                column: "UserPostJobId");

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_PostJobs_PostJobId",
                table: "Messages",
                column: "PostJobId",
                principalTable: "PostJobs",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_Messages_UserPostJobs_UserPostJobId",
                table: "Messages",
                column: "UserPostJobId",
                principalTable: "UserPostJobs",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Messages_PostJobs_PostJobId",
                table: "Messages");

            migrationBuilder.DropForeignKey(
                name: "FK_Messages_UserPostJobs_UserPostJobId",
                table: "Messages");

            migrationBuilder.DropIndex(
                name: "IX_Messages_PostJobId",
                table: "Messages");

            migrationBuilder.DropIndex(
                name: "IX_Messages_UserPostJobId",
                table: "Messages");

            migrationBuilder.DropColumn(
                name: "PostJobId",
                table: "Messages");

            migrationBuilder.DropColumn(
                name: "UserPostJobId",
                table: "Messages");
        }
    }
}
