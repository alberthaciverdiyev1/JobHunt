using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Job.Migrations
{
    /// <inheritdoc />
    public partial class AddUserAddJob : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Tries");

            migrationBuilder.CreateTable(
                name: "UserPostJobs",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CategoryId = table.Column<int>(type: "int", nullable: false),
                    JobTypeId = table.Column<int>(type: "int", nullable: false),
                    Experience = table.Column<int>(type: "int", nullable: true),
                    WorkExperienceId = table.Column<int>(type: "int", nullable: true),
                    Salary = table.Column<decimal>(type: "decimal(18,2)", nullable: true),
                    CityId = table.Column<int>(type: "int", nullable: true),
                    EducationId = table.Column<int>(type: "int", nullable: true),
                    LanguageId = table.Column<int>(type: "int", nullable: true),
                    PhoneNumber = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Email = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Age = table.Column<int>(type: "int", nullable: false),
                    Created = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UserPostJobs", x => x.id);
                    table.ForeignKey(
                        name: "FK_UserPostJobs_Categories_CategoryId",
                        column: x => x.CategoryId,
                        principalTable: "Categories",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserPostJobs_Cities_CityId",
                        column: x => x.CityId,
                        principalTable: "Cities",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_UserPostJobs_Educations_EducationId",
                        column: x => x.EducationId,
                        principalTable: "Educations",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_UserPostJobs_JobTypes_JobTypeId",
                        column: x => x.JobTypeId,
                        principalTable: "JobTypes",
                        principalColumn: "id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UserPostJobs_Languages_LanguageId",
                        column: x => x.LanguageId,
                        principalTable: "Languages",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_UserPostJobs_WorkExperiences_WorkExperienceId",
                        column: x => x.WorkExperienceId,
                        principalTable: "WorkExperiences",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_CategoryId",
                table: "UserPostJobs",
                column: "CategoryId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_CityId",
                table: "UserPostJobs",
                column: "CityId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_EducationId",
                table: "UserPostJobs",
                column: "EducationId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_JobTypeId",
                table: "UserPostJobs",
                column: "JobTypeId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_LanguageId",
                table: "UserPostJobs",
                column: "LanguageId");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_WorkExperienceId",
                table: "UserPostJobs",
                column: "WorkExperienceId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UserPostJobs");

            migrationBuilder.CreateTable(
                name: "Tries",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Categoryid = table.Column<int>(type: "int", nullable: true),
                    MyProperty = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Tries", x => x.id);
                    table.ForeignKey(
                        name: "FK_Tries_Categories_Categoryid",
                        column: x => x.Categoryid,
                        principalTable: "Categories",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Tries_Categoryid",
                table: "Tries",
                column: "Categoryid");
        }
    }
}
