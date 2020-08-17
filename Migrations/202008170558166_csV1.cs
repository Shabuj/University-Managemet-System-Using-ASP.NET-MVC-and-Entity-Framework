namespace UniversitymanagementUsingEntityFramework.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class csV1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Courses",
                c => new
                    {
                        CourseId = c.Int(nullable: false, identity: true),
                        CourseCode = c.String(nullable: false, maxLength: 50, unicode: false),
                        CoursName = c.String(nullable: false, maxLength: 50, unicode: false),
                        CourseCredit = c.Single(nullable: false),
                        CourseDescription = c.String(nullable: false, maxLength: 50, unicode: false),
                        DepartmentId = c.Int(nullable: false),
                        SemesterId = c.Int(nullable: false),
                        Student_StudentId = c.Int(),
                    })
                .PrimaryKey(t => t.CourseId)
                .ForeignKey("dbo.Departments", t => t.DepartmentId, cascadeDelete: true)
                .ForeignKey("dbo.Semesters", t => t.SemesterId, cascadeDelete: true)
                .ForeignKey("dbo.Students", t => t.Student_StudentId)
                .Index(t => t.DepartmentId)
                .Index(t => t.SemesterId)
                .Index(t => t.Student_StudentId);
            
            CreateTable(
                "dbo.Semesters",
                c => new
                    {
                        SemesterId = c.Int(nullable: false, identity: true),
                        SemesterName = c.String(maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.SemesterId);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Courses", "Student_StudentId", "dbo.Students");
            DropForeignKey("dbo.Courses", "SemesterId", "dbo.Semesters");
            DropForeignKey("dbo.Courses", "DepartmentId", "dbo.Departments");
            DropIndex("dbo.Courses", new[] { "Student_StudentId" });
            DropIndex("dbo.Courses", new[] { "SemesterId" });
            DropIndex("dbo.Courses", new[] { "DepartmentId" });
            DropTable("dbo.Semesters");
            DropTable("dbo.Courses");
        }
    }
}
