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
    public class MainsController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public MainsController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;

        }


        public async Task<IActionResult> Index()
        {
            return View(await _context.main.ToListAsync());
        }

        
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var main = await _context.main
                .FirstOrDefaultAsync(m => m.Id == id);
            if (main == null)
            {
                return NotFound();
            }

            return View(main);
        }

        
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( Main main)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            //File Upload Create Start
            if (!main.Img.IsImage() || !main.Img.IsSmallerThan(400))
            {
                ModelState.AddModelError("Img", "File is not valid");
                return View();
            }
            string path = _env.WebRootPath + @"\images";
            main.Image = await main.Img.Upload(path);
            //File Upload Create End

            if (ModelState.IsValid)
            {
                _context.Add(main);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(main);
        }

      
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var main = await _context.main.FindAsync(id);
            if (main == null)
            {
                return NotFound();
            }
            return View(main);
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Image,Heading,Id")] Main main)
        {
            if (id != main.Id)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View();
            }


            //File Upload Edit Start

            if (main.Img != null)
            {
                if (!main.Img.IsImage() || !main.Img.IsSmallerThan(400))
                {
                    ModelState.AddModelError("Img", "File is not valid");
                    return View();
                }
                string path = _env.WebRootPath + @"\images";
                if (System.IO.File.Exists(Path.Combine(path, main.Image)))
                {
                    System.IO.File.Delete(Path.Combine(path, main.Image));
                }
                main.Image = await main.Img.Upload(path);
            }
            //File Upload Edit End


            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(main);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MainExists(main.Id))
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
            return View(main);
        }

      
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var main = await _context.main
                .FirstOrDefaultAsync(m => m.Id == id);
            if (main == null)
            {
                return NotFound();
            }

            return View(main);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var main = await _context.main.FindAsync(id);

            //File Upload Delete Start
            string path = _env.WebRootPath + @"\images";
            string filename = main.Image;
            string final = Path.Combine(path, filename);
            if (System.IO.File.Exists(final))
            {
                System.IO.File.Delete(final);
            }
            //File Upload Delete End


            _context.main.Remove(main);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MainExists(int id)
        {
            return _context.main.Any(e => e.Id == id);
        }
    }
}
