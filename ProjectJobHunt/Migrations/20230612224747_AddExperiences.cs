using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class AddExperiences : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Internship",
                table: "Experiences");

            migrationBuilder.DropColumn(
                name: "Junior",
                table: "Experiences");

            migrationBuilder.DropColumn(
                name: "Middle",
                table: "Experiences");

            migrationBuilder.RenameColumn(
                name: "Senior",
                table: "Experiences",
                newName: "WorkExperience");

            migrationBuilder.CreateTable(
                name: "ExperienceYears",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Year = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ExperienceYears", x => x.id);
                });

            migrationBuilder.CreateTable(
                name: "JobTypes",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    WorkType = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_JobTypes", x => x.id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ExperienceYears");

            migrationBuilder.DropTable(
                name: "JobTypes");

            migrationBuilder.RenameColumn(
                name: "WorkExperience",
                table: "Experiences",
                newName: "Senior");

            migrationBuilder.AddColumn<string>(
                name: "Internship",
                table: "Experiences",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Junior",
                table: "Experiences",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<string>(
                name: "Middle",
                table: "Experiences",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
