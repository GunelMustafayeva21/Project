using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;

namespace TenAugust.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = "Admin, SuperAdmin")]
    public class OrdersController : Controller
    {
        private readonly AppDbContext db;
        public OrdersController(AppDbContext _db)
        {
            db = _db;
        }
        public async Task<IActionResult> Index()
        {

            return View(await db.orderItems.Include(x=>x.Order).Include(x=>x.Product).OrderByDescending(x=>x.Id).ToListAsync());
        }
    }
}
