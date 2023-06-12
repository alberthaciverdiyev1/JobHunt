using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace ProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class deleteprofession : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_RegisterVM_Professions_ProfessionId",
                table: "RegisterVM");

            migrationBuilder.DropTable(
                name: "Professions");

            migrationBuilder.RenameColumn(
                name: "ProfessionId",
                table: "RegisterVM",
                newName: "PositionId");

            migrationBuilder.RenameIndex(
                name: "IX_RegisterVM_ProfessionId",
                table: "RegisterVM",
                newName: "IX_RegisterVM_PositionId");

            migrationBuilder.AddForeignKey(
                name: "FK_RegisterVM_Positions_PositionId",
                table: "RegisterVM",
                column: "PositionId",
                principalTable: "Positions",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_RegisterVM_Positions_PositionId",
                table: "RegisterVM");

            migrationBuilder.RenameColumn(
                name: "PositionId",
                table: "RegisterVM",
                newName: "ProfessionId");

            migrationBuilder.RenameIndex(
                name: "IX_RegisterVM_PositionId",
                table: "RegisterVM",
                newName: "IX_RegisterVM_ProfessionId");

            migrationBuilder.CreateTable(
                name: "Professions",
                columns: table => new
                {
                    id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ProfessionName = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Professions", x => x.id);
                });

            migrationBuilder.AddForeignKey(
                name: "FK_RegisterVM_Professions_ProfessionId",
                table: "RegisterVM",
                column: "ProfessionId",
                principalTable: "Professions",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
