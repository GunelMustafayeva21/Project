using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using TenAugust.DAL;
using TenAugust.Helpers;
using TenAugust.Models;

namespace TenAugust.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, SuperAdmin")]
    public class ProductsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public ProductsController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;

        }
        //string path = @"C:\Users\Hp\source\repos\TenAugust\TenAugust\wwwroot\images";

        public async Task<IActionResult> Index(int page=1)
        {
            ViewBag.PageCount = Math.Ceiling((decimal)(_context.products.Count()/(decimal)4));
            ViewBag.CurrentPage = page;
            int skip = (page - 1) * 4;
            var appDbContext = _context.products.Include(p => p.ProductCategory);
            return View(await appDbContext.Skip(skip).Take(4).ToListAsync());
        }

        
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.products
                .Include(p => p.ProductCategory)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

      
        public IActionResult Create()
        {
            ViewData["ProductCategoryId"] = new SelectList(_context.productCategories, "Id", "Name");
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( Product product)
        {

            if (!ModelState.IsValid)
            {
                return View();
            }

            //File Upload Create Start
            if (!product.Img.IsImage() || !product.Img.IsSmallerThan(400))
            {
                ModelState.AddModelError("Img", "File is not valid");
                return View();
            }
            string path = _env.WebRootPath + @"\images";
            product.Image = await product.Img.Upload(path);
            //File Upload Create End


            if (ModelState.IsValid)
            {
                _context.Add(product);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductCategoryId"] = new SelectList(_context.productCategories, "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

        
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["ProductCategoryId"] = new SelectList(_context.productCategories, "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,  Product product)
        {

            
            if (id != product.Id)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View();
            }


            //File Upload Edit Start

            if (product.Img != null)
            {
                if (!product.Img.IsImage() || !product.Img.IsSmallerThan(400))
                {
                    ModelState.AddModelError("Img", "File is not valid");
                    return View();
                }
                string path = _env.WebRootPath + @"\images";
                if (System.IO.File.Exists(Path.Combine(path, product.Image)))
                {
                    System.IO.File.Delete(Path.Combine(path, product.Image));
                }
                product.Image = await product.Img.Upload(path);
            }
            //File Upload Edit End


            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["ProductCategoryId"] = new SelectList(_context.productCategories, "Id", "Name", product.ProductCategoryId);
            return View(product);
        }

       
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.products
                .Include(p => p.ProductCategory)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.products.FindAsync(id);

            //File Upload Delete Start
            string path = _env.WebRootPath + @"\images";
            string filename =product.Image;
            string final = Path.Combine(path, filename);
            if (System.IO.File.Exists(final))
            {
                System.IO.File.Delete(final);
            }
            //File Upload Delete End


            _context.products.Remove(product);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.products.Any(e => e.Id == id);
        }
    }
}
