using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class workExperience : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_Experiences_Experienceid",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "Experiences");

            migrationBuilder.RenameColumn(
                name: "Experienceid",
                table: "AspNetUsers",
                newName: "WorkExperienceid");

            migrationBuilder.RenameIndex(
                name: "IX_AspNetUsers_Experienceid",
                table: "AspNetUsers",
                newName: "IX_AspNetUsers_WorkExperienceid");

            migrationBuilder.CreateTable(
                name: "WorkExperiences",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Experience = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_WorkExperiences", x => x.id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_WorkExperiences_WorkExperienceid",
                table: "AspNetUsers",
                column: "WorkExperienceid",
                principalTable: "WorkExperiences",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_WorkExperiences_WorkExperienceid",
                table: "AspNetUsers");

            migrationBuilder.DropTable(
                name: "WorkExperiences");

            migrationBuilder.RenameColumn(
                name: "WorkExperienceid",
                table: "AspNetUsers",
                newName: "Experienceid");

            migrationBuilder.RenameIndex(
                name: "IX_AspNetUsers_WorkExperienceid",
                table: "AspNetUsers",
                newName: "IX_AspNetUsers_Experienceid");

            migrationBuilder.CreateTable(
                name: "Experiences",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkExperience = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Experiences", x => x.id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_Experiences_Experienceid",
                table: "AspNetUsers",
                column: "Experienceid",
                principalTable: "Experiences",
                principalColumn: "id");
        }
    }
}
