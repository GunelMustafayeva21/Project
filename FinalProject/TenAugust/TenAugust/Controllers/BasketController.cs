using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;
using TenAugust.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Http;

namespace TenAugust.Controllers
{
    public class BasketController : Controller
    {
        private readonly AppDbContext db;
        public BasketController(AppDbContext _db)
        {
            db = _db;
        }
        public IActionResult AddToBasket(int? id, string size)
        {
            if (id == null) return NotFound();
            Product prod = db.products.FirstOrDefault(x => x.Id == id);
            if (prod == null) return NotFound();

            List<BasketItemVM> basket;

            if (Request.Cookies["basket"] == null)
            {
                basket = new List<BasketItemVM>();
            }
            else
            {
                basket = JsonConvert.DeserializeObject<List<BasketItemVM>>(Request.Cookies["basket"]);
            }

            BasketItemVM existingBasketitem = basket.FirstOrDefault(x => x.ProductId == prod.Id);

            if (existingBasketitem == null)
            {
                BasketItemVM basketItem = new BasketItemVM();
                basketItem.ProductId = prod.Id;
                basketItem.Name = prod.Name;
                basketItem.Price = prod.Price;
                basketItem.Image = prod.Image;
                basketItem.Size = size;
                basketItem.Count = 1;

                basket.Add(basketItem);
            }
            else
            {
                existingBasketitem.Count++;
            }

            Response.Cookies.Append("basket", JsonConvert.SerializeObject(basket), new CookieOptions() { MaxAge = TimeSpan.FromDays(14) });

            return Redirect(Request.Headers["Referer"].ToString());
        }
        public IActionResult RemoveFromBasket(int? id)
        {
            if (id == null) return NotFound();

            List<BasketItemVM> basket;

            if (Request.Cookies["basket"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else
            {
                basket = JsonConvert.DeserializeObject<List<BasketItemVM>>(Request.Cookies["basket"]);
            }

            BasketItemVM existingBasketitem = basket.FirstOrDefault(x => x.ProductId == id);
            if (existingBasketitem == null)
            {
                return RedirectToAction("Index", "Home");
            }
            else if (existingBasketitem.Count > 1)
            {
                existingBasketitem.Count--;
            }
            else
            {
                basket.Remove(existingBasketitem);
            }

            Response.Cookies.Append("basket", JsonConvert.SerializeObject(basket), new CookieOptions() { MaxAge = TimeSpan.FromDays(14) });

            return RedirectToAction("Index");
        }
        public IActionResult Index()
        {
            if (Request.Cookies["basket"] == null)
            {
                return RedirectToAction("Index", "Home");
            }

            List<BasketItemVM> basket = JsonConvert.DeserializeObject<List<BasketItemVM>>(Request.Cookies["basket"]);
            double total = 0;

            foreach (BasketItemVM item in basket)
            {
                total += (item.Price * item.Count);
            }

            ViewBag.Total = total;
            return View(basket);
        }

        public async Task<IActionResult> Confirm(string email, string address)
        {
            Order order = new Order()
            {
                Email = email,
                Address = address
            };
            await db.orders.AddAsync(order);
            await db.SaveChangesAsync();

            List<BasketItemVM> basket = JsonConvert.DeserializeObject<List<BasketItemVM>>(Request.Cookies["basket"]);
            foreach (BasketItemVM item in basket)
            {
                OrderItem orderItem = new OrderItem()
                {
                    ProductId = item.ProductId,
                    OrderId = order.Id,
                    Count = item.Count
                };
                await db.orderItems.AddAsync(orderItem);
            }
            await db.SaveChangesAsync();

            Response.Cookies.Delete("basket");

            return RedirectToAction("Index", "Home");
        }
    }
}
