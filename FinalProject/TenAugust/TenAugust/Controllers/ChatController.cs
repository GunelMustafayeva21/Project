using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;

namespace TenAugust.Controllers
{
    public class ChatController : Controller
    {
        private readonly AppDbContext db;
        public ChatController(AppDbContext _db)
        {
            db = _db;
        }
        public async Task<IActionResult> Index()
        {
            return View(await db.messages.ToListAsync());
        }

    }
}
