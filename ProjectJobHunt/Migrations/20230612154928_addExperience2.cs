using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class addExperience2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Experienceid",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_Experienceid",
                table: "AspNetUsers",
                column: "Experienceid");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Experiences_Experienceid",
                table: "AspNetUsers",
                column: "Experienceid",
                principalTable: "Experiences",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Experiences_Experienceid",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_Experienceid",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "Experienceid",
                table: "AspNetUsers");
        }
    }
}
