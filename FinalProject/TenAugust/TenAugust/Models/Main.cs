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
    public class Main:BaseEntity
    {
        [Required]
        public string Image { get; set; }
        [Required]
        public string Heading { get; set; }
        [NotMapped]
        [DisplayName("Photo Upload")]
        public IFormFile Img { get; set; }
    }
}
