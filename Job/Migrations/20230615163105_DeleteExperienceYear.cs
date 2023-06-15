using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Job.Migrations
{
    /// <inheritdoc />
    public partial class DeleteExperienceYear : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PostJobs_ExperienceYears_ExperienceYearId",
                table: "PostJobs");

            migrationBuilder.DropTable(
                name: "ExperienceYears");

            migrationBuilder.DropIndex(
                name: "IX_PostJobs_ExperienceYearId",
                table: "PostJobs");

            migrationBuilder.RenameColumn(
                name: "ExperienceYearId",
                table: "PostJobs",
                newName: "Experience");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Experience",
                table: "PostJobs",
                newName: "ExperienceYearId");

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

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_ExperienceYearId",
                table: "PostJobs",
                column: "ExperienceYearId");

            migrationBuilder.AddForeignKey(
                name: "FK_PostJobs_ExperienceYears_ExperienceYearId",
                table: "PostJobs",
                column: "ExperienceYearId",
                principalTable: "ExperienceYears",
                principalColumn: "id");
        }
    }
}
