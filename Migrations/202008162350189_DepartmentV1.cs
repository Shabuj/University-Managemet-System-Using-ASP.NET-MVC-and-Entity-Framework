namespace UniversitymanagementUsingEntityFramework.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class DepartmentV1 : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Departments",
                c => new
                    {
                        Departmentid = c.Int(nullable: false, identity: true),
                        DepartmementCode = c.String(nullable: false, maxLength: 7, unicode: false),
                        DepartmentName = c.String(nullable: false, maxLength: 50, unicode: false),
                    })
                .PrimaryKey(t => t.Departmentid);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Departments");
        }
    }
}
