using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace UniversitymanagementUsingEntityFramework.Models
{
    public class UniversityDbContext: DbContext
    {
        public  DbSet<Department> Departments { set; get; }
        public DbSet<Student> Students { set; get; }
        public DbSet<Course> Courses { set; get; }
        public DbSet<Semester> Semesters { get; set; }
    }
}