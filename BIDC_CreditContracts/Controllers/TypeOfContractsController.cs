using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.DAL;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class TypeOfContractsController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: TypeOfContracts
        public ActionResult Index()
        {
            return View(db.TypeOfContracts.ToList());
        }

        // GET: TypeOfContracts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfContract typeOfContract = db.TypeOfContracts.Find(id);
            if (typeOfContract == null)
            {
                return HttpNotFound();
            }
            return View(typeOfContract);
        }

        // GET: TypeOfContracts/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: TypeOfContracts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TypeOfContract typeOfContract)
        {
            if (ModelState.IsValid)
            {
                db.TypeOfContracts.Add(typeOfContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(typeOfContract);
        }

        // GET: TypeOfContracts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfContract typeOfContract = db.TypeOfContracts.Find(id);
            if (typeOfContract == null)
            {
                return HttpNotFound();
            }
            return View(typeOfContract);
        }

        // POST: TypeOfContracts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TypeOfContract typeOfContract)
        {
            if (ModelState.IsValid)
            {
                db.Entry(typeOfContract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(typeOfContract);
        }

        // GET: TypeOfContracts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TypeOfContract typeOfContract = db.TypeOfContracts.Find(id);
            if (typeOfContract == null)
            {
                return HttpNotFound();
            }
            return View(typeOfContract);
        }

        // POST: TypeOfContracts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TypeOfContract typeOfContract = db.TypeOfContracts.Find(id);
            db.TypeOfContracts.Remove(typeOfContract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
