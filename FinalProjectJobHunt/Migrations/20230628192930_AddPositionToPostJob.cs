using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class AddPositionToPostJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "PostJobId",
                table: "Positions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserPostJobId",
                table: "Positions",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Positions_PostJobId",
                table: "Positions",
                column: "PostJobId");

            migrationBuilder.CreateIndex(
                name: "IX_Positions_UserPostJobId",
                table: "Positions",
                column: "UserPostJobId");

            migrationBuilder.AddForeignKey(
                name: "FK_Positions_PostJobs_PostJobId",
                table: "Positions",
                column: "PostJobId",
                principalTable: "PostJobs",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_Positions_UserPostJobs_UserPostJobId",
                table: "Positions",
                column: "UserPostJobId",
                principalTable: "UserPostJobs",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Positions_PostJobs_PostJobId",
                table: "Positions");

            migrationBuilder.DropForeignKey(
                name: "FK_Positions_UserPostJobs_UserPostJobId",
                table: "Positions");

            migrationBuilder.DropIndex(
                name: "IX_Positions_PostJobId",
                table: "Positions");

            migrationBuilder.DropIndex(
                name: "IX_Positions_UserPostJobId",
                table: "Positions");

            migrationBuilder.DropColumn(
                name: "PostJobId",
                table: "Positions");

            migrationBuilder.DropColumn(
                name: "UserPostJobId",
                table: "Positions");
        }
    }
}
