using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.Models;

namespace TenAugust.ViewModels
{
    public class HomeViewModel
    {
        public List<Slide> Slides { get; set; }
        public AboutUs About { get; set; }
        public Main Main { get; set; }
        public List<Product> Products { get; set; }
        public List<ProductCategory> ProductCategories { get; set; }
        public List<Employee> Employees { get; set; }
    }
}
