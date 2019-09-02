using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class HypothecatorsController : Controller
    {
        // GET: Hypothecators
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string HypothecatorName, string HypothecatorSex, DateTime HypothecatorBirthDate, string HypothecatorNationality,
                                string HypothecatorAddress, string HypothecatorVillage, string HypothecatorSangkat, string HypothecatorKhan, string HypothecatorCapital)
        {
            CreateHypothecContractEng contract = new CreateHypothecContractEng();
            if (Session["Hypothecator"] != null)
                contract.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];

            if (!String.IsNullOrWhiteSpace(HypothecatorName) && !String.IsNullOrWhiteSpace(HypothecatorNationality))
            {
                if (contract.listHypothecator.Count > 0)
                {

                    int count = contract.listHypothecator.Where(c => c.HypothecatorName.Equals(HypothecatorName) && c.HypothecatorAddress.Equals(HypothecatorAddress)).Count();

                    if (count <= 0)
                    {
                        contract.listHypothecator.Add(new HypothecatorEng
                        {
                            HypothecatorName = HypothecatorName,
                            HypothecatorSex = HypothecatorSex,
                            HypothecatorBirthDate = HypothecatorBirthDate,
                            HypothecatorNationality = HypothecatorNationality,
                            HypothecatorAddress = HypothecatorAddress,
                            HypothecatorVillage = HypothecatorVillage,
                            HypothecatorSangkat = HypothecatorSangkat,
                            HypothecatorKhan = HypothecatorKhan,
                            HypothecatorCapital = HypothecatorCapital,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Hypothecator already have in list. Please input another Hypothecator";
                }
                else
                {
                    contract.listHypothecator.Add(new HypothecatorEng
                    {
                        HypothecatorName = HypothecatorName,
                        HypothecatorSex = HypothecatorSex,
                        HypothecatorBirthDate = HypothecatorBirthDate,
                        HypothecatorNationality = HypothecatorNationality,
                        HypothecatorAddress = HypothecatorAddress,
                        HypothecatorVillage = HypothecatorVillage,
                        HypothecatorSangkat = HypothecatorSangkat,
                        HypothecatorKhan = HypothecatorKhan,
                        HypothecatorCapital = HypothecatorCapital,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["Hypothecator"] = contract.listHypothecator;
            return PartialView("_CreateHypothecatorEng", contract.listHypothecator);
        }

        public ActionResult Delete(string hypothecatorName, string hypothecatorNationality, bool isSaved)
        {
            CreateHypothecContractEng contract = new CreateHypothecContractEng();
            if (Session["Hypothecator"] != null)
                contract.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
            List<HypothecatorEng> _hypothector = contract.listHypothecator.Where(c => c.HypothecatorName.Equals(hypothecatorName) && c.HypothecatorNationality.Equals(hypothecatorNationality))
                                                                        .ToList();
            if (_hypothector.Count > 0)
            {
                foreach(HypothecatorEng item in _hypothector)
                    contract.listHypothecator.Remove(item);
            }
            
            Session["Hypothecator"] = contract.listHypothecator;
            return PartialView("_CreateHypothecatorEng", contract.listHypothecator);
        }

        public ActionResult AddKhmer(string HypothecatorName, string HypothecatorSex, DateTime HypothecatorBirthDate, string HypothecatorNationality,
                                string HypothecatorAddress, string HypothecatorVillage, string HypothecatorSangkat, string HypothecatorKhan, string HypothecatorCapital)
        {
            CreateHypothecContractKhmer contract = new CreateHypothecContractKhmer();
            if (Session["HypothecatorKhmer"] != null)
                contract.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];

            if (!String.IsNullOrWhiteSpace(HypothecatorName) && !String.IsNullOrWhiteSpace(HypothecatorNationality))
            {
                if (contract.listHypothecator.Count > 0)
                {

                    int count = contract.listHypothecator.Where(c => c.HypothecatorName.Equals(HypothecatorName) && c.HypothecatorAddress.Equals(HypothecatorAddress)).Count();

                    if (count <= 0)
                    {
                        contract.listHypothecator.Add(new HypothecatorKhmer
                        {
                            HypothecatorName = HypothecatorName,
                            HypothecatorSex = HypothecatorSex,
                            HypothecatorBirthDate = HypothecatorBirthDate,
                            HypothecatorNationality = HypothecatorNationality,
                            HypothecatorAddress = HypothecatorAddress,
                            HypothecatorVillage = HypothecatorVillage,
                            HypothecatorSangkat = HypothecatorSangkat,
                            HypothecatorKhan = HypothecatorKhan,
                            HypothecatorCapital = HypothecatorCapital,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Hypothecator already have in list. Please input another Hypothecator";
                }
                else
                {
                    contract.listHypothecator.Add(new HypothecatorKhmer
                    {
                        HypothecatorName = HypothecatorName,
                        HypothecatorSex = HypothecatorSex,
                        HypothecatorBirthDate = HypothecatorBirthDate,
                        HypothecatorNationality = HypothecatorNationality,
                        HypothecatorAddress = HypothecatorAddress,
                        HypothecatorVillage = HypothecatorVillage,
                        HypothecatorSangkat = HypothecatorSangkat,
                        HypothecatorKhan = HypothecatorKhan,
                        HypothecatorCapital = HypothecatorCapital,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["HypothecatorKhmer"] = contract.listHypothecator;
            return PartialView("_CreateHypothecatorKhmer", contract.listHypothecator);
        }

        public ActionResult DeleteKhmer(string hypothecatorName, string hypothecatorNationality, bool isSaved)
        {
            CreateHypothecContractKhmer contract = new CreateHypothecContractKhmer();
            if (Session["HypothecatorKhmer"] != null)
                contract.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
            List<HypothecatorKhmer> _hypothector = contract.listHypothecator.Where(c => c.HypothecatorName.Equals(hypothecatorName) && c.HypothecatorNationality.Equals(hypothecatorNationality))
                                                                        .ToList();
            if (_hypothector.Count > 0)
            {
                foreach(HypothecatorKhmer item in _hypothector)
                    contract.listHypothecator.Remove(item);
            }
            
            Session["HypothecatorKhmer"] = contract.listHypothecator;
            return PartialView("_CreateHypothecatorKhmer", contract.listHypothecator);
        }
    }
}