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
    [Authorize(Roles ="Admin, SuperAdmin")]
    public class AboutUsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public AboutUsController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;

        }

        public async Task<IActionResult> Index()
        {
            return View(await _context.about.ToListAsync());
        }

      
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var aboutUs = await _context.about
                .FirstOrDefaultAsync(m => m.Id == id);
            if (aboutUs == null)
            {
                return NotFound();
            }

            return View(aboutUs);
        }

       
        public IActionResult Create()
        {
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( AboutUs aboutUs)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            //File Upload Create Start
            if (!aboutUs.Img.IsImage() || !aboutUs.Img.IsSmallerThan(400))
            {
                ModelState.AddModelError("Img", "File is not valid");
                return View();
            }
            string path = _env.WebRootPath + @"\images";
            aboutUs.Image = await aboutUs.Img.Upload(path);
            //File Upload Create End

            if (ModelState.IsValid)
            {
                _context.Add(aboutUs);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(aboutUs);
        }

      
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var aboutUs = await _context.about.FindAsync(id);
            if (aboutUs == null)
            {
                return NotFound();
            }
            return View(aboutUs);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id,  AboutUs aboutUs)
        {
            if (id != aboutUs.Id)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View();
            }

            //File Upload Edit Start

            if (aboutUs.Img != null)
            {
                if (!aboutUs.Img.IsImage() || !aboutUs.Img.IsSmallerThan(400))
                {
                    ModelState.AddModelError("Img", "File is not valid");
                    return View();
                }
                string path = _env.WebRootPath + @"\images";
                if (System.IO.File.Exists(Path.Combine(path, aboutUs.Image)))
                {
                    System.IO.File.Delete(Path.Combine(path, aboutUs.Image));
                }
                aboutUs.Image = await aboutUs.Img.Upload(path);
            }
            //File Upload Edit End


            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(aboutUs);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AboutUsExists(aboutUs.Id))
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
            return View(aboutUs);
        }

       
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var aboutUs = await _context.about
                .FirstOrDefaultAsync(m => m.Id == id);
            if (aboutUs == null)
            {
                return NotFound();
            }

            return View(aboutUs);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var aboutUs = await _context.about.FindAsync(id);

            //File Upload Delete Start
            string path = _env.WebRootPath + @"\images";
            string filename = aboutUs.Image;
            string final = Path.Combine(path, filename);
            if (System.IO.File.Exists(final))
            {
                System.IO.File.Delete(final);
            }
            //File Upload Delete End




            _context.about.Remove(aboutUs);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AboutUsExists(int id)
        {
            return _context.about.Any(e => e.Id == id);
        }
    }
}
