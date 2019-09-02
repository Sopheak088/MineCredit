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
using System.Globalization;

namespace BIDC_CreditContracts.Controllers
{
    public class IndividualContractsController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: IndividualContracts
        public ActionResult Index()
        {
            var individualContracts = db.IndividualContracts.Include(i => i.Branch);
            return View(individualContracts.ToList());
        }

        // GET: IndividualContracts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContract individualContract = db.IndividualContracts.Find(id);
            if (individualContract == null)
            {
                return HttpNotFound();
            }
            return View(individualContract);
        }

        public ActionResult CommingSoon()
        {
            return View();
        }

        // GET: IndividualContracts/Create
        public ActionResult Create()
        {
            CreateContractStep2 contractStep2 = (CreateContractStep2)Session["contractInfo"];
            CreateIndividualContractEng model = new CreateIndividualContractEng();
            model.CusIssuedDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            model.InterestDate = DateTime.Parse("01/01/2017", CultureInfo.CreateSpecificCulture("fr-FR"));
            model.ContractDate = DateTime.Now;
            model.Language = contractStep2.Language;
            model.BranchID = contractStep2.Branch;
            model.BranchStandFor = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
            Session["CarLoan"] = null;
            Session["HousingLoan"] = null;
            Session["FixLoan"] = null;
            int numberOfContract = db.IndividualContracts.Count() + 1;
            if (numberOfContract < 10)
                model.NumberOfContract = "0" + numberOfContract.ToString();
            else
                model.NumberOfContract = numberOfContract.ToString();
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name
                });
            }
            List<IndividualContractType> listContract = db.IndividualContractTypes.ToList();
            foreach (IndividualContractType item in listContract)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.StandFor
                });
            }

            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }

            return View(model);
        }

        // POST: IndividualContracts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(IndividualContract individualContract)
        {
            if (ModelState.IsValid)
            {
                db.IndividualContracts.Add(individualContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.BranchID = new SelectList(db.Branches, "BranchID", "BranchName", individualContract.BranchID);
            return View(individualContract);
        }

        public ActionResult CreateKhmer()
        {
            return View();
        }

        // GET: IndividualContracts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContract individualContract = db.IndividualContracts.Find(id);
            if (individualContract == null)
            {
                return HttpNotFound();
            }
            ViewBag.BranchID = new SelectList(db.Branches, "BranchID", "BranchName", individualContract.BranchID);
            return View(individualContract);
        }

        // POST: IndividualContracts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,ContractNo,ContractDate,BankRepresented,BankPosition,CustomerName,CustomerID,CusIssuedDate,CustAddress,CustPhone,LoanAmount,Purpose,LoanTerm,InterestRate,InterestDate,ProcessingFee,WithdrawTerm,OriginalLoan,PaymentInterest,Language,FileName,IndividualTypeID,BranchID")] IndividualContract individualContract)
        {
            if (ModelState.IsValid)
            {
                db.Entry(individualContract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.BranchID = new SelectList(db.Branches, "BranchID", "BranchName", individualContract.BranchID);
            return View(individualContract);
        }

        // GET: IndividualContracts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            IndividualContract individualContract = db.IndividualContracts.Find(id);
            if (individualContract == null)
            {
                return HttpNotFound();
            }
            return View(individualContract);
        }

        // POST: IndividualContracts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            IndividualContract individualContract = db.IndividualContracts.Find(id);
            db.IndividualContracts.Remove(individualContract);
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
