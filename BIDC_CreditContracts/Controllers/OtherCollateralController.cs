using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;
using BIDC_CreditContracts.DAL;

namespace BIDC_CreditContracts.Controllers
{
    public class OtherCollateralController : Controller
    {
        private CreditContractContext db = new CreditContractContext();
        // GET: OtherCollateral
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string AssetInformation, string IssuedBy, string Collateral)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewOtherCollateral"] != null)
                contract.NewOtherCollateral = (List<OtherCollateralView>)Session["NewOtherCollateral"];

            if (!string.IsNullOrWhiteSpace(AssetInformation) && !string.IsNullOrWhiteSpace(IssuedBy))
            {
                if (contract.NewOtherCollateral.Count > 0)
                {
                    int count = contract.NewOtherCollateral.Where(c => c.AssetInformation.Equals(AssetInformation) && 
                                                                        c.IssuedBy.Equals(IssuedBy)).Count();
                    if (count <= 0)
                    {
                        contract.NewOtherCollateral.Add(new OtherCollateralView
                        {
                            AssetInformation = AssetInformation,
                            IssuedBy = IssuedBy,
                            isSaved = false,
                            CollateralFor = Collateral
                        });
                    }
                    else
                        ViewBag.Error = "Other Collateral already have in list. Please input another collateral";
                }
                else
                    contract.NewOtherCollateral.Add(new OtherCollateralView
                    {
                        AssetInformation = AssetInformation,
                        IssuedBy = IssuedBy,
                        isSaved = false,
                        CollateralFor = Collateral
                    });
                
            }
            else
                ViewBag.Error = "Please input information is required.";

            Session["NewOtherCollateral"] = contract.NewOtherCollateral;
            return PartialView("_NewOtherCollateralView", contract.NewOtherCollateral);
        }

        public ActionResult Delete(string AssetInformation, string IssuedBy, bool isSaved)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewOtherCollateral"] != null)
                contract.NewOtherCollateral = (List<OtherCollateralView>)Session["NewOtherCollateral"];
            OtherCollateralView _otherCollateralView = contract.NewOtherCollateral.Where(c => c.AssetInformation.Equals(AssetInformation) && 
                                                                                            c.IssuedBy.Equals(IssuedBy)).FirstOrDefault();
            contract.NewOtherCollateral.Remove(_otherCollateralView);
            Session["NewOtherCollateral"] = contract.NewOtherCollateral;
            return PartialView("_NewOtherCollateralView", contract.NewOtherCollateral);
        }
    }
}