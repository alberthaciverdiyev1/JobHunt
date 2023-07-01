using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace FinalProjectJobHunt.Migrations
{
    /// <inheritdoc />
    public partial class _321 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Positions_PostJobs_PostJobId",
                table: "Positions");

            migrationBuilder.DropForeignKey(
                name: "FK_Positions_UserPostJobs_UserPostJobId",
                table: "Positions");

            migrationBuilder.DropForeignKey(
                name: "FK_PostJobs_Categories_CategoryId",
                table: "PostJobs");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPostJobs_Categories_CategoryId",
                table: "UserPostJobs");

            migrationBuilder.DropIndex(
                name: "IX_Positions_PostJobId",
                table: "Positions");

            migrationBuilder.DropIndex(
                name: "IX_Positions_UserPostJobId",
                table: "Positions");

            migrationBuilder.DropColumn(
                name: "PostJobId",
                table: "Positions");

            migrationBuilder.DropColumn(
                name: "UserPostJobId",
                table: "Positions");

            migrationBuilder.AlterColumn<int>(
                name: "PositionId",
                table: "UserPostJobs",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "UserPostJobs",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "PositionId",
                table: "PostJobs",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "PostJobs",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.CreateIndex(
                name: "IX_UserPostJobs_PositionId",
                table: "UserPostJobs",
                column: "PositionId");

            migrationBuilder.CreateIndex(
                name: "IX_PostJobs_PositionId",
                table: "PostJobs",
                column: "PositionId");

            migrationBuilder.AddForeignKey(
                name: "FK_PostJobs_Categories_CategoryId",
                table: "PostJobs",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_PostJobs_Positions_PositionId",
                table: "PostJobs",
                column: "PositionId",
                principalTable: "Positions",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPostJobs_Categories_CategoryId",
                table: "UserPostJobs",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_UserPostJobs_Positions_PositionId",
                table: "UserPostJobs",
                column: "PositionId",
                principalTable: "Positions",
                principalColumn: "id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PostJobs_Categories_CategoryId",
                table: "PostJobs");

            migrationBuilder.DropForeignKey(
                name: "FK_PostJobs_Positions_PositionId",
                table: "PostJobs");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPostJobs_Categories_CategoryId",
                table: "UserPostJobs");

            migrationBuilder.DropForeignKey(
                name: "FK_UserPostJobs_Positions_PositionId",
                table: "UserPostJobs");

            migrationBuilder.DropIndex(
                name: "IX_UserPostJobs_PositionId",
                table: "UserPostJobs");

            migrationBuilder.DropIndex(
                name: "IX_PostJobs_PositionId",
                table: "PostJobs");

            migrationBuilder.AlterColumn<int>(
                name: "PositionId",
                table: "UserPostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "UserPostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "PositionId",
                table: "PostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "CategoryId",
                table: "PostJobs",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddColumn<int>(
                name: "PostJobId",
                table: "Positions",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "UserPostJobId",
                table: "Positions",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Positions_PostJobId",
                table: "Positions",
                column: "PostJobId");

            migrationBuilder.CreateIndex(
                name: "IX_Positions_UserPostJobId",
                table: "Positions",
                column: "UserPostJobId");

            migrationBuilder.AddForeignKey(
                name: "FK_Positions_PostJobs_PostJobId",
                table: "Positions",
                column: "PostJobId",
                principalTable: "PostJobs",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_Positions_UserPostJobs_UserPostJobId",
                table: "Positions",
                column: "UserPostJobId",
                principalTable: "UserPostJobs",
                principalColumn: "id");

            migrationBuilder.AddForeignKey(
                name: "FK_PostJobs_Categories_CategoryId",
                table: "PostJobs",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_UserPostJobs_Categories_CategoryId",
                table: "UserPostJobs",
                column: "CategoryId",
                principalTable: "Categories",
                principalColumn: "id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
