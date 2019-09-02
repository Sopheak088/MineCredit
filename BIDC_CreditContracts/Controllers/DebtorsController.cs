using BIDC_CreditContracts.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Controllers
{
    public class DebtorsController : Controller
    {
        // GET: Debtors
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string DebtorName, string DebtorSex, DateTime DebtorBirthDate, string DebtorNationality, string DebtorAddress,
                                string DebtorVillage, string DebtorSangkat, string DebtorKhan, string DebtorCapital)
        {
            CreateHypothecContractEng contract = new CreateHypothecContractEng();
            if (Session["Debtor"] != null)
                contract.listDebtor = (List<DebtorEng>)Session["Debtor"];

            if (!String.IsNullOrWhiteSpace(DebtorName) && !String.IsNullOrWhiteSpace(DebtorAddress))
            {
                if (contract.listDebtor.Count > 0)
                {
                    int count = contract.listDebtor.Where(c => c.DebtorName.Equals(DebtorName) && c.DebtorAddress.Equals(DebtorAddress)).Count();

                    if (count <= 0)
                    {
                        contract.listDebtor.Add(new DebtorEng
                        {
                            DebtorName = DebtorName,
                            DebtorSex = DebtorSex,
                            DebtorBirthDate = DebtorBirthDate,
                            DebtorNationality = DebtorNationality,
                            DebtorAddress = DebtorAddress,
                            DebtorVillage = DebtorVillage,
                            DebtorSangkat = DebtorSangkat,
                            DebtorKhan = DebtorKhan,
                            DebtorCapital = DebtorCapital,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Debtor already have in list. Please input another Debtor";
                }
                else
                {
                    contract.listDebtor.Add(new DebtorEng
                    {
                        DebtorName = DebtorName,
                        DebtorSex = DebtorSex,
                        DebtorBirthDate = DebtorBirthDate,
                        DebtorNationality = DebtorNationality,
                        DebtorAddress = DebtorAddress,
                        DebtorVillage = DebtorVillage,
                        DebtorSangkat = DebtorSangkat,
                        DebtorKhan = DebtorKhan,
                        DebtorCapital = DebtorCapital,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["Debtor"] = contract.listDebtor;
            return PartialView("_CreateDebtorEng", contract.listDebtor);
        }

        public ActionResult Delete(string debtorName, string debtorAddress, bool isSaved)
        {
            CreateHypothecContractEng contract = new CreateHypothecContractEng();
            if (Session["Debtor"] != null)
                contract.listDebtor = (List<DebtorEng>)Session["Debtor"];
            DebtorEng _debtor = contract.listDebtor.Where(c => c.DebtorName.Equals(debtorName) && c.DebtorAddress.Equals(debtorAddress)).SingleOrDefault();
            contract.listDebtor.Remove(_debtor);
            Session["Debtor"] = contract.listDebtor;
            return PartialView("_CreateDebtorEng", contract.listDebtor);
        }

        public ActionResult AddKhmer(string DebtorName, string DebtorSex, DateTime DebtorBirthDate, string DebtorNationality, string DebtorAddress,
                                string DebtorVillage, string DebtorSangkat, string DebtorKhan, string DebtorCapital)
        {
            CreateHypothecContractKhmer contract = new CreateHypothecContractKhmer();
            if (Session["DebtorKhmer"] != null)
                contract.listDebtor = (List<DebtorKhmer>)Session["DebtorKhmer"];

            if (!String.IsNullOrWhiteSpace(DebtorName) && !String.IsNullOrWhiteSpace(DebtorAddress))
            {
                if (contract.listDebtor.Count > 0)
                {

                    int count = contract.listDebtor.Where(c => c.DebtorName.Equals(DebtorName) && c.DebtorAddress.Equals(DebtorAddress)).Count();

                    if (count <= 0)
                    {
                        contract.listDebtor.Add(new DebtorKhmer
                        {
                            DebtorName = DebtorName,
                            DebtorSex = DebtorSex,
                            DebtorBirthDate = DebtorBirthDate,
                            DebtorNationality = DebtorNationality,
                            DebtorAddress = DebtorAddress,
                            DebtorVillage = DebtorVillage,
                            DebtorSangkat = DebtorSangkat,
                            DebtorKhan = DebtorKhan,
                            DebtorCapital = DebtorCapital,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Debtor already have in list. Please input another Debtor";
                }
                else
                {
                    contract.listDebtor.Add(new DebtorKhmer
                    {
                        DebtorName = DebtorName,
                        DebtorSex = DebtorSex,
                        DebtorBirthDate = DebtorBirthDate,
                        DebtorNationality = DebtorNationality,
                        DebtorAddress = DebtorAddress,
                        DebtorVillage = DebtorVillage,
                        DebtorSangkat = DebtorSangkat,
                        DebtorKhan = DebtorKhan,
                        DebtorCapital = DebtorCapital,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["DebtorKhmer"] = contract.listDebtor;
            return PartialView("_CreateDebtorKhmer", contract.listDebtor);
        }

        public ActionResult DeleteKhmer(string debtorName, string debtorAddress, bool isSaved)
        {
            CreateHypothecContractKhmer contract = new CreateHypothecContractKhmer();
            if (Session["DebtorKhmer"] != null)
                contract.listDebtor = (List<DebtorKhmer>)Session["DebtorKhmer"];
            DebtorKhmer _debtor = contract.listDebtor.Where(c => c.DebtorName.Equals(debtorName) && c.DebtorAddress.Equals(debtorAddress)).SingleOrDefault();
            contract.listDebtor.Remove(_debtor);
            Session["DebtorKhmer"] = contract.listDebtor;
            return PartialView("_CreateDebtorKhmer", contract.listDebtor);
        }
    }
}