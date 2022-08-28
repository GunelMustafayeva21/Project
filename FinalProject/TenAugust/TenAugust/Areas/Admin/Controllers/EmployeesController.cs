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
    public class EmployeesController : Controller
    {
        private readonly AppDbContext _context;
        private readonly IWebHostEnvironment _env;

        public EmployeesController(AppDbContext context, IWebHostEnvironment env)
        {
            _context = context;
            _env = env;

        }

        
        public async Task<IActionResult> Index()
        {
            return View(await _context.employees.ToListAsync());
        }

        
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.employees
                .FirstOrDefaultAsync(m => m.Id == id);
            if (employee == null)
            {
                return NotFound();
            }

            return View(employee);
        }

       
        public IActionResult Create()
        {
            return View();
        }

        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create( Employee employee)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            //File Upload Create Start
            if (!employee.Img.IsImage() || !employee.Img.IsSmallerThan(400))
            {
                ModelState.AddModelError("Img", "File is not valid");
                return View();
            }
            string path = _env.WebRootPath + @"\images";
            employee.Image = await employee.Img.Upload(path);
            //File Upload Create End

            if (ModelState.IsValid)
            {
                _context.Add(employee);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(employee);
        }

        
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.employees.FindAsync(id);
            if (employee == null)
            {
                return NotFound();
            }
            return View(employee);
        }

       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, Employee employee)
        {
            if (id != employee.Id)
            {
                return NotFound();
            }

            if (!ModelState.IsValid)
            {
                return View();
            }


            //File Upload Edit Start

            if (employee.Img != null)
            {
                if (!employee.Img.IsImage() || !employee.Img.IsSmallerThan(400))
                {
                    ModelState.AddModelError("Img", "File is not valid");
                    return View();
                }
                string path = _env.WebRootPath + @"\images";
                if (System.IO.File.Exists(Path.Combine(path, employee.Image)))
                {
                    System.IO.File.Delete(Path.Combine(path, employee.Image));
                }
                employee.Image = await employee.Img.Upload(path);
            }
            //File Upload Edit End

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(employee);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!EmployeeExists(employee.Id))
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
            return View(employee);
        }

        
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var employee = await _context.employees
                .FirstOrDefaultAsync(m => m.Id == id);
            if (employee == null)
            {
                return NotFound();
            }

            return View(employee);
        }

       
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var employee = await _context.employees.FindAsync(id);

            //File Upload Delete Start
            string path = _env.WebRootPath + @"\images";
            string filename = employee.Image;
            string final = Path.Combine(path, filename);
            if (System.IO.File.Exists(final))
            {
                System.IO.File.Delete(final);
            }
            //File Upload Delete End


            _context.employees.Remove(employee);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool EmployeeExists(int id)
        {
            return _context.employees.Any(e => e.Id == id);
        }
    }
}
