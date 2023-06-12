using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class PostJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_WorkExperiences_WorkExperienceid",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_WorkExperienceid",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "WorkExperienceid",
                table: "AspNetUsers");

            migrationBuilder.CreateTable(
                name: "PostJobs",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    JobTypeId = table.Column<int>(type: "int", nullable: false),
                    ExperienceYearId = table.Column<int>(type: "int", nullable: false),
                    WorkExperienceId = table.Column<int>(type: "int", nullable: false),
                    Salary = table.Column<decimal>(type: "decimal(18,2)", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PostJobs", x => x.id);
                    table.ForeignKey(
                        name: "FK_PostJobs_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PostJobs_ExperienceYears_ExperienceYearId",
                        column: x => x.ExperienceYearId,
                        principalTable: "ExperienceYears",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PostJobs_JobTypes_JobTypeId",
                        column: x => x.JobTypeId,
                        principalTable: "JobTypes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_PostJobs_WorkExperiences_WorkExperienceId",
                        column: x => x.WorkExperienceId,
                        principalTable: "WorkExperiences",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_CategoryId",
                table: "PostJobs",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_ExperienceYearId",
                table: "PostJobs",
                column: "ExperienceYearId");

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_JobTypeId",
                table: "PostJobs",
                column: "JobTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_WorkExperienceId",
                table: "PostJobs",
                column: "WorkExperienceId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "PostJobs");

            migrationBuilder.AddColumn<int>(
                name: "WorkExperienceid",
                table: "AspNetUsers",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_WorkExperienceid",
                table: "AspNetUsers",
                column: "WorkExperienceid");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_WorkExperiences_WorkExperienceid",
                table: "AspNetUsers",
                column: "WorkExperienceid",
                principalTable: "WorkExperiences",
                principalColumn: "id");
        }
    }
}
