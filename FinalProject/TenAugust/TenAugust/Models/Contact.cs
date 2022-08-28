using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace TenAugust.Models
{
    public class Contact:BaseEntity
    {
        [Required, MaxLength(100)]
        public string CustomerName { get; set; }
        [Required, MaxLength(100)]
        public string CustomerSurname { get; set; }
        [Required]
        public string CustomerPhone { get; set; }
        [Required, EmailAddress]
        public string CustomerEmail { get; set; }
        [Required]
        public string CustomerAddress { get; set; }
        [Required]
        public string CustomerMessage { get; set; }
        public DateTime Date { get; set; }
    }
}
