using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace TenAugust.Models
{
    public class Employee:BaseEntity
    {
        [Required]
        public string Name { get; set; }
        [Required]
        public string Position { get; set; }
        [Required]
        public string Twitter { get; set; }
        [Required]
        public string Facebook { get; set; }
        [Required]
        public string Instagram { get; set; }
        [Required]
        public string Linkedin { get; set; }
        [Required]
        public string Image { get; set; }
        [NotMapped]
        [DisplayName("Photo Upload")]
        public IFormFile Img { get; set; }
    }
}
