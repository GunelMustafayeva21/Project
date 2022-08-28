using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TenAugust.Models;
using TenAugust.ViewModels;

namespace TenAugust.Controllers
{
    public class AccountController : Controller
    {
        private readonly UserManager<AppUser> userManager;
        private readonly SignInManager<AppUser> signInManager;
        private readonly RoleManager<IdentityRole> roleManager;
        public AccountController(UserManager<AppUser> _userManager, SignInManager<AppUser> _signInManager, RoleManager<IdentityRole> _roleManager)
        {
            userManager = _userManager;
            signInManager = _signInManager;
            roleManager = _roleManager;
        }


        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            AppUser newUser = new AppUser()
            {
                Name = viewModel.Name,
                Surame = viewModel.SurName,
                Age = viewModel.Age,
                Email = viewModel.Email,
                UserName = viewModel.Email.Split("@")[0]
            };

            IdentityResult result = await userManager.CreateAsync(newUser, viewModel.Password);

            if (!result.Succeeded)
            {
                foreach (IdentityError item in result.Errors)
                {
                    ModelState.AddModelError("", item.Description);
                }
                return View(viewModel);
            }

            await signInManager.SignInAsync(newUser, false);
            return RedirectToAction("Index", "Home");
        }

        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginViewModel viewModel)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            AppUser loggingUser = await userManager.FindByEmailAsync(viewModel.Email);

            if (loggingUser == null)
            {
                ModelState.AddModelError("", "Email or password is wrong.");
                return View(viewModel);
            }

            if (!loggingUser.Status)
            {
                ModelState.AddModelError("", "You are blocked");
                return View(viewModel);
            }

            Microsoft.AspNetCore.Identity.SignInResult result = await signInManager.PasswordSignInAsync(loggingUser, viewModel.Password, viewModel.StayLoggedIn, true);

            if (!result.Succeeded)
            {
                if (result.IsLockedOut)
                {
                    ModelState.AddModelError("", "You are locked out. Please, try again after 30 minutes.");
                }
                else
                {
                    ModelState.AddModelError("", "Email or password is wrong.");
                }
                return View(viewModel);
            }

            //if ((await userManager.GetRolesAsync(loggingUser)).Count > 0 && (await userManager.GetRolesAsync(loggingUser))[0] == "Admin")
            //{
            //    return RedirectToAction("Index", "Home", new { area = "Admin" });
            //}

            return RedirectToAction("Index", "Home");
        }


        public async Task<IActionResult> Logout()
        {
            await signInManager.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }

        //public async Task<IActionResult> CreateRoles()
        //{
        //    await roleManager.CreateAsync(new IdentityRole() { Name = "Member" });
        //    await roleManager.CreateAsync(new IdentityRole() { Name = "Admin" });
        //    await roleManager.CreateAsync(new IdentityRole() { Name = "SuperAdmin" });
        //    return Content("ok");
        //}

        //public async Task<IActionResult> AddRoleToUser()
        //{
        //    AppUser user = await userManager.FindByNameAsync("gunel");

        //    await userManager.AddToRoleAsync(user, "Admin");

        //    return Content("ok");
        //}

        //public async Task<IActionResult> AddRoleToUser()
        //{
        //    AppUser user = await userManager.FindByNameAsync("Mamed");

        //    await userManager.AddToRoleAsync(user, "SuperAdmin");

        //    return Content("ok");
        //}

    }
}
