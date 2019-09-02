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
    public class IndividualContractTypesController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: IndividualContractTypes
        public ActionResult Index()
        {
            return View(db.IndividualContractTypes.ToList());
        }

        // GET: IndividualContractTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContractType individualContractType = db.IndividualContractTypes.Find(id);
            if (individualContractType == null)
            {
                return HttpNotFound();
            }
            return View(individualContractType);
        }

        // GET: IndividualContractTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: IndividualContractTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,TypeName")] IndividualContractType individualContractType)
        {
            if (ModelState.IsValid)
            {
                db.IndividualContractTypes.Add(individualContractType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(individualContractType);
        }

        // GET: IndividualContractTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContractType individualContractType = db.IndividualContractTypes.Find(id);
            if (individualContractType == null)
            {
                return HttpNotFound();
            }
            return View(individualContractType);
        }

        // POST: IndividualContractTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,TypeName")] IndividualContractType individualContractType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(individualContractType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(individualContractType);
        }

        // GET: IndividualContractTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContractType individualContractType = db.IndividualContractTypes.Find(id);
            if (individualContractType == null)
            {
                return HttpNotFound();
            }
            return View(individualContractType);
        }

        // POST: IndividualContractTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            IndividualContractType individualContractType = db.IndividualContractTypes.Find(id);
            db.IndividualContractTypes.Remove(individualContractType);
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
