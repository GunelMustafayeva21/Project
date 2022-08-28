using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TenAugust.Models
{
    public class ProductCategory:BaseEntity
    {
        [Required]
        public string Name { get; set; }
        public List<Product> Products { get; set; }
    }
}
