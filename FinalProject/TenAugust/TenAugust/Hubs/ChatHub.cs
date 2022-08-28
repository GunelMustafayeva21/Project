using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.DAL;
using TenAugust.Models;

namespace TenAugust.Hubs
{
    public class ChatHub:Hub
    {
        private readonly AppDbContext db;
        public ChatHub(AppDbContext _db)
        {
            db = _db;
        }

        public async Task SendMessage(string user, string message, string color)
        {
            await db.messages.AddAsync(new Message()
            {
                Sender = user,
                Text = message,
                Color = color
            });
            await db.SaveChangesAsync();
            await Clients.All.SendAsync("ReceiveMessage", user, message, color);
        }
    }
}
