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
    public class Product:BaseEntity
    {
       [Required]
        public string Image { get; set; }
        [Required]
        public string Name { get; set; }
        [Required]
        public double Price { get; set; }
        
        public string Size1 { get; set; }
        public string Size2 { get; set; }
        public string Size3 { get; set; }
        public string Size4 { get; set; }
        public string Size5 { get; set; }
        public string Size6 { get; set; }
        public int ProductCategoryId { get; set; }
        public ProductCategory ProductCategory { get; set; }
        
        [NotMapped]
        [DisplayName("Photo Upload")]
        public IFormFile Img { get; set; }
    }
}
