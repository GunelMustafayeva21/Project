using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TenAugust.Models
{
    public class Order:BaseEntity
    {
        [Required, EmailAddress]
        public string Email { get; set; }
        [Required]
        public string Address { get; set; }

        
        public List<OrderItem> OrderItems { get; set; }
    }
}
