using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class ChangePostJobIdToPositionId : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PostjobId",
                table: "UserPostJobs",
                newName: "PositionId");

            migrationBuilder.RenameColumn(
                name: "PostjobId",
                table: "PostJobs",
                newName: "PositionId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "PositionId",
                table: "UserPostJobs",
                newName: "PostjobId");

            migrationBuilder.RenameColumn(
                name: "PositionId",
                table: "PostJobs",
                newName: "PostjobId");
        }
    }
}
