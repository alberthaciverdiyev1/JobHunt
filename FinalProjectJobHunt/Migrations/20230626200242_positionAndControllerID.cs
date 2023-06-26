using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class positionAndControllerID : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "CategoryId",
                table: "Messages",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PositionId",
                table: "Messages",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CategoryId",
                table: "Messages");

            migrationBuilder.DropColumn(
                name: "PositionId",
                table: "Messages");
        }
    }
}
