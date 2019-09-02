using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class HousingLoanController : Controller
    {
        // GET: HousingLoan
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string HosingLoanCollateralType, string HousingLoanDescription, string HousingLoanTotalSize, float HousingLoanValue)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["HousingLoan"] != null)
                contract.listHousingLoan = (List<HousingLoanEnglish>)Session["HousingLoan"];
            //bool flag = false;
            if (!String.IsNullOrWhiteSpace(HousingLoanDescription) && !String.IsNullOrWhiteSpace(HousingLoanTotalSize) && HousingLoanValue > 0)
            {
                if (contract.listHousingLoan.Count > 0)
                {
                    //foreach (HousingLoanEnglish item in contract.listHousingLoan)
                    //{
                    //    if (item.Description.Equals(HousingLoanDescription) && item.TotalSize.Equals(HousingLoanTotalSize) && item.Value == HousingLoanValue)
                    //        flag = true;
                    //    else
                    //        flag = false;
                    //}
                    int count = contract.listHousingLoan.Where(c => c.Type.Equals(HosingLoanCollateralType) && c.Description.Equals(HousingLoanDescription)
                                                              && c.TotalSize.Equals(HousingLoanTotalSize) && c.Value == HousingLoanValue).Count();
                    if(count <= 0)
                        contract.listHousingLoan.Add(new HousingLoanEnglish
                        {
                            Type = HosingLoanCollateralType,
                            Description = HousingLoanDescription,
                            TotalSize = HousingLoanTotalSize,
                            Value = HousingLoanValue
                        });
                    else
                        ViewBag.Error = "Guarantee housing loan already have in list. Please input other guarantee housing loan ";
                }
                else
                    contract.listHousingLoan.Add(new HousingLoanEnglish
                    {
                        Type = HosingLoanCollateralType,
                        Description = HousingLoanDescription,
                        TotalSize = HousingLoanTotalSize,
                        Value = HousingLoanValue
                    });
            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["HousingLoan"] = contract.listHousingLoan;
            return PartialView("_CreateHousingLoanEng", contract.listHousingLoan);
        }

        public ActionResult Delete(string HousingDescription, string HousingSize, float HousingValue, bool isSaved)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["HousingLoan"] != null)
                contract.listHousingLoan = (List<HousingLoanEnglish>)Session["HousingLoan"];
            HousingLoanEnglish housingLoan = contract.listHousingLoan.Where(c => c.Description.Equals(HousingDescription) 
                                                                && c.TotalSize.Equals(HousingSize) && c.Value == HousingValue).SingleOrDefault();
            contract.listHousingLoan.Remove(housingLoan);
            Session["HousingLoan"] = contract.listHousingLoan;
            return PartialView("_CreateHousingLoanEng", contract.listHousingLoan);
        }
    }
}