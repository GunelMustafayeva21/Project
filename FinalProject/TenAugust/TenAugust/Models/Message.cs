using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TenAugust.Models
{
    public class Message
    {
        public int Id { get; set; }
        public string Sender { get; set; }
        public string Text { get; set; }
        public string Color { get; set; }
    }
}
