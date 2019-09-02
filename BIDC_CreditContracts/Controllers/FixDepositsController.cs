using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;
using BIDC_CreditContracts.DAL;

namespace BIDC_CreditContracts.Controllers
{
    public class FixDepositsController : Controller
    {
        // GET: FixDeposits
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Add(string Owner, string IDNumber, DateTime OpeningDate, string TypeOfDeposit)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["FixDeposit"] != null)
                contract.FixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];
            if (!string.IsNullOrWhiteSpace(Owner) && !string.IsNullOrWhiteSpace(IDNumber))
            {
                if(contract.FixDeposit.Count>0){
                    int count = contract.FixDeposit.Where(c => c.Owner.Equals(Owner) && c.IDNumber.Equals(IDNumber)).Count();
                    if (count <= 0)
                        contract.FixDeposit.Add(new FixDepositViewEng
                        {
                            Owner = Owner,
                            IDNumber = IDNumber,
                            OpeningDate = OpeningDate,
                            TypeOfDeposit = TypeOfDeposit,
                            isSaved = false
                        });
                    else
                        ViewBag.Error = "FixDeposit already have in list. Please input another fixDeposit";
                }
                else
                    contract.FixDeposit.Add(new FixDepositViewEng
                    {
                        Owner = Owner,
                        IDNumber = IDNumber,
                        OpeningDate = OpeningDate,
                        TypeOfDeposit = TypeOfDeposit,
                        isSaved = false
                    });
                
            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["FixDeposit"] = contract.FixDeposit;
            return PartialView("_CreateFixDepositEng", contract.FixDeposit);
        }

        public ActionResult AddKhmer(string Owner, string IDNumber, DateTime OpeningDate, string TypeOfDeposit)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["FixDepositKhmer"] != null)
                contract.FixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];
            if (!string.IsNullOrWhiteSpace(Owner) && !string.IsNullOrWhiteSpace(IDNumber))
            {
                if (contract.FixDeposit.Count > 0)
                {
                    int count = contract.FixDeposit.Where(c => c.Owner.Equals(Owner) && c.IDNumber.Equals(IDNumber)).Count();
                    if (count <= 0)
                        contract.FixDeposit.Add(new FixDepositViewKhmer
                        {
                            Owner = Owner,
                            IDNumber = IDNumber,
                            OpeningDate = OpeningDate,
                            TypeOfDeposit = TypeOfDeposit,
                            isSaved = false
                        });
                    else
                        ViewBag.Error = "FixDeposit already have in list. Please input another fixDeposit";
                }
                else
                    contract.FixDeposit.Add(new FixDepositViewKhmer
                    {
                        Owner = Owner,
                        IDNumber = IDNumber,
                        OpeningDate = OpeningDate,
                        TypeOfDeposit = TypeOfDeposit,
                        isSaved = false
                    });

            }
            else
                ViewBag.Error = "Please input information is required.";

            Session["FixDepositKhmer"] = contract.FixDeposit;
            return PartialView("_CreateFixDepositKhmer", contract.FixDeposit);
        }

        public ActionResult Delete(string owner, string idNumber, bool isSaved)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["FixDeposit"] != null)
                contract.FixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];
            FixDepositViewEng _fixDeposit = contract.FixDeposit.Where(c => c.Owner.Equals(owner) && c.IDNumber.Equals(idNumber)).FirstOrDefault();
            contract.FixDeposit.Remove(_fixDeposit);
            Session["FixDeposit"] = contract.FixDeposit;
            return PartialView("_CreateFixDepositEng", contract.FixDeposit);
        }

        public ActionResult DeleteKhmer(string owner, string idNumber, bool isSaved)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["FixDepositKhmer"] != null)
                contract.FixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];
            FixDepositViewKhmer _fixDeposit = contract.FixDeposit.Where(c => c.Owner.Equals(owner) && c.IDNumber.Equals(idNumber)).FirstOrDefault();
            contract.FixDeposit.Remove(_fixDeposit);
            Session["FixDepositKhmer"] = contract.FixDeposit;
            return PartialView("_CreateFixDepositKhmer", contract.FixDeposit);
        }
    }
}