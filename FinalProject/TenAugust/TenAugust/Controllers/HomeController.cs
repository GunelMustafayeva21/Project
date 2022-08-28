using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;
using TenAugust.Models;
using TenAugust.ViewModels;

namespace TenAugust.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext db;
        public HomeController(AppDbContext _db)
        {
            db = _db;
        }
        public async Task<IActionResult> Index()
        {
            HomeViewModel hvm = new HomeViewModel()
            {
                Main = await db.main.FirstAsync(),
                About = await db.about.FirstAsync(),
                Slides = await db.slides.ToListAsync(),
                ProductCategories = await db.productCategories.ToListAsync(),
                Products = await db.products.Include(x => x.ProductCategory).OrderByDescending(x => x.Id).Take(4).ToListAsync(),
                Employees = await db.employees.ToListAsync()
            };

            ViewBag.ProductCount = db.products.Count();
            return View(hvm);

        }

       

        
        public async Task<IActionResult> Contact(Contact contact)
        {
            if (ModelState.IsValid)
            {
                contact.Date = DateTime.Now;
                await db.contacts.AddAsync(contact);
                await db.SaveChangesAsync();
                TempData["message"] = "Data was sent";
                return View();
            }
            else
            {
                TempData["message"] = "Data was not sent. Please fill all inputs correctly";
                return View();
            }


        }
        public async Task<IActionResult> LoadMoreProducts(int skip)
        {
            HomeViewModel hvm = new HomeViewModel()
            {
                
                Products = await db.products.Include(x => x.ProductCategory).OrderByDescending(x => x.Id).Skip(skip).Take(4).ToListAsync()
            };
            return PartialView("_ProductPartial", hvm);
        }

        public IActionResult Search()
        {
            return View();
        }

        public async Task<IActionResult> SearchProduct(string query)
        {
            HomeViewModel hvm = new HomeViewModel()
            {

                Products = await db.products.Include(x => x.ProductCategory).OrderByDescending(x => x.Id).Where(x=> x.Name.ToLower().Contains(query.ToLower())).ToListAsync()
            };
            return PartialView("_ProductPartial", hvm);
        }

    }
}
