using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;
using TenAugust.Models;

namespace TenAugust.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, SuperAdmin")]
    public class MessagesController : Controller
    {
        private readonly AppDbContext db;
        public MessagesController(AppDbContext _db)
        {
            db = _db;
        }
        public IActionResult Index()
        {
            return View(db.contacts.ToList());
        }
        public IActionResult Delete(int id)
        {
            Contact contact = db.contacts.FirstOrDefault(x => x.Id == id);
            if (contact == null) return NotFound();
            return View(contact);
        }
        public IActionResult DeleteConfirmed(int id)
        {
            Contact contact = db.contacts.FirstOrDefault(x => x.Id == id);
            if (contact == null) return NotFound();

            db.contacts.Remove(contact);
            db.SaveChanges();
            return RedirectToAction("Index", "Messages", new {area="Admin" });
        }
    }
}
