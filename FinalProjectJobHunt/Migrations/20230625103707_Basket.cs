using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class Basket : Migration
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

            migrationBuilder.CreateTable(
                name: "BasketItems",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    AppUserId = table.Column<int>(type: "int", nullable: true),
                    UserPostJobId = table.Column<int>(type: "int", nullable: true),
                    PostJobId = table.Column<int>(type: "int", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_BasketItems", x => x.id);
                    table.ForeignKey(
                        name: "FK_BasketItems_AspNetUsers_AppUserId",
                        column: x => x.AppUserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_BasketItems_PostJobs_PostJobId",
                        column: x => x.PostJobId,
                        principalTable: "PostJobs",
                        principalColumn: "id");
                    table.ForeignKey(
                        name: "FK_BasketItems_UserPostJobs_UserPostJobId",
                        column: x => x.UserPostJobId,
                        principalTable: "UserPostJobs",
                        principalColumn: "id");
                });

            migrationBuilder.CreateIndex(
                name: "IX_BasketItems_AppUserId",
                table: "BasketItems",
                column: "AppUserId");

            migrationBuilder.CreateIndex(
                name: "IX_BasketItems_PostJobId",
                table: "BasketItems",
                column: "PostJobId");

            migrationBuilder.CreateIndex(
                name: "IX_BasketItems_UserPostJobId",
                table: "BasketItems",
                column: "UserPostJobId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "BasketItems");

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
