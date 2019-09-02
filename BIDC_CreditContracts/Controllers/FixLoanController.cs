using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class FixLoanController : Controller
    {
        // GET: FixLoan
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string FixLoanCollateralType, string FixLoanOwnership, string FixLoanTitleDeedNumber, string FixLoanTotalSizeIn,
                                    string FixLoanPricePerSqm, float FixLoanTotalPriceIn)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["FixLoan"] != null)
                contract.listFixLoan = (List<FixLoanEnglish>)Session["FixLoan"];
            if (!string.IsNullOrWhiteSpace(FixLoanOwnership) && !string.IsNullOrWhiteSpace(FixLoanTitleDeedNumber) && !string.IsNullOrWhiteSpace(FixLoanTotalSizeIn)
                    && !string.IsNullOrWhiteSpace(FixLoanPricePerSqm) && FixLoanTotalPriceIn > 0)
            {
                int count = contract.listFixLoan.Where(c => c.KindOfCollateral.Equals(FixLoanCollateralType) && c.Ownership.Equals(FixLoanOwnership)
                                    && c.TitleDeedNumbers.Equals(FixLoanTitleDeedNumber) && c.TotalSizeIn.Equals(FixLoanTotalSizeIn)
                                    && c.PricePerSqmIn.Equals(FixLoanPricePerSqm) && c.TotalPriceIn == FixLoanTotalPriceIn).Count();
                if (count > 0)
                    ViewBag.Error = "Guarantee fix loan already have in list. Please input Guarantee fix loan ";
                else
                    contract.listFixLoan.Add(new FixLoanEnglish
                    {
                        KindOfCollateral = FixLoanCollateralType,
                        Ownership = FixLoanOwnership,
                        TitleDeedNumbers = FixLoanTitleDeedNumber,
                        TotalSizeIn = FixLoanTotalSizeIn,
                        PricePerSqmIn = FixLoanPricePerSqm,
                        TotalPriceIn = FixLoanTotalPriceIn
                    });
            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["FixLoan"] = contract.listFixLoan;
            return PartialView("_CreateFixLoanEng", contract.listFixLoan);
        }

        public ActionResult Delete(string Ownership, string TitleDeedNumbers, string TotalSizeIn, string PricePerSqmIn, bool isSaved)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["FixLoan"] != null)
                contract.listFixLoan = (List<FixLoanEnglish>)Session["FixLoan"];
            FixLoanEnglish fixLoan = contract.listFixLoan.Where(c => c.Ownership.Equals(Ownership) && c.TitleDeedNumbers.Equals(TitleDeedNumbers)
                                            && c.TotalSizeIn.Equals(TotalSizeIn) && c.PricePerSqmIn.Equals(PricePerSqmIn)).SingleOrDefault();
            contract.listFixLoan.Remove(fixLoan);
            Session["FixLoan"] = contract.listFixLoan;
            return PartialView("_CreateFixLoanEng", contract.listFixLoan);
        }
    }
}