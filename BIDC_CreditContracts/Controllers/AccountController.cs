using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;
using System.Web.Security;
using System.Web.Profile;

namespace BIDC_CreditContracts.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        //
        // GET: /Account/LogOn
        public ActionResult LogOn()
        {
            return View();
        }

        //
        // POST: /Account/LogOn

        [HttpPost]
        public ActionResult LogOn(LogOnModel model, string returnUrl)
        {
            if (ModelState.IsValid)
            {

                if (!Membership.ValidateUser(model.UserName, model.Password))
                {
                    ModelState.AddModelError("", "The user name or password provided is incorrect.");
                    return View(model);
                }
                else
                {
                    FormsAuthentication.SetAuthCookie(model.UserName, false);
                    ProfileBase profile = ProfileBase.Create(model.UserName);
                    string BranchID = profile.GetPropertyValue("BranchID").ToString();
                    string DepartmentID = profile.GetPropertyValue("DepartmentID").ToString();
                    Session.Add("UserName", model.UserName);
                    Session.Add("BranchID", BranchID);
                    Session.Add("DepartmentID", DepartmentID);

                    if (Url.IsLocalUrl(returnUrl) && returnUrl.Length > 1 && returnUrl.StartsWith("/")
                        && !returnUrl.StartsWith("//") && !returnUrl.StartsWith("/\\"))
                    {
                        return Redirect(returnUrl);
                    }
                    else
                    {
                        return RedirectToAction("Index", "Home");
                    }

                }

            }
            return View(model);
        }

        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            Session.Clear();

            return RedirectToAction("LogOn", "Account");
        }

    }
}