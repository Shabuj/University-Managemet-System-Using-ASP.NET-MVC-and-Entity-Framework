using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace UniversitymanagementUsingEntityFramework.Models
{
    public class Department
    {
        [Key]
        public int Departmentid { get; set; }
        [Required(ErrorMessage ="Please enter department code")]
        [Column(TypeName = "Varchar")]
        [StringLength(7,MinimumLength =2,ErrorMessage ="Department Code Must be 2-7 Characters")]
        public string DepartmementCode { get; set; }
        [Required(ErrorMessage =" Please enter Department Name ")]
        [Column(TypeName = "Varchar")]
        [StringLength(50)]
        public string DepartmentName { get; set; }
    }
}