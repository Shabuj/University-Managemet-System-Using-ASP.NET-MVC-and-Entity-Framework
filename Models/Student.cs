using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace UniversitymanagementUsingEntityFramework.Models
{
    public class Student
    {
        [Key]
        public int StudentId { get; set; }
        [Required(ErrorMessage ="please enter your name")]
        [StringLength(50)]

        public string StudentName { get; set; }
        [DataType(DataType.MultilineText)]
        public string Address { get; set; }
        [Required(ErrorMessage ="Please enter email ")]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [Required(ErrorMessage ="please enter your age")]
        [Range(18,99,ErrorMessage ="Age must be 18-99")]
        public int Age { get; set; }
        public int DepartmentId { get; set; }
        [ForeignKey("DepartmentId")]
        public virtual Department Department { get; set; }
    }
}