using BIDC_CreditContracts.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Controllers
{
    public class MortgagePropertiesController : Controller
    {
        // GET: MortgageProperties
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string PlateNumberName, string IssuedByName, string PlateNumberYear, string IssuedByYear, string PlateChassis,
                                    string IssuedByChassis, string PlateEngine, string IssuedByEngine, string PlateVignette, string IssuedByVignette)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["MortgageProperty"] != null)
            {
                contract.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
            }
            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(PlateNumberName) && !String.IsNullOrWhiteSpace(IssuedByName))
            {
                if (contract.MortgageProperty.Count > 0)
                {
                    int count = contract.MortgageProperty.Where(c => c.PlateNumberName.Equals(PlateNumberName) && c.IssuedByName.Equals(IssuedByName)).Count();

                    if(count <= 0)
                    {
                        contract.MortgageProperty.Add(new MortgagePropertyView
                        {
                            PlateNumberName = PlateNumberName,
                            IssuedByName = IssuedByName,
                            PlateNumberYear = PlateNumberYear,
                            IssuedByYear = IssuedByYear,
                            PlateChassis = PlateChassis,
                            IssuedByChassis = IssuedByChassis,
                            PlateEngine = PlateEngine,
                            IssuedByEngine = IssuedByEngine,
                            PlateVignette = PlateVignette,
                            IssuedByVignette = IssuedByVignette,
                            isSaved = false
                        });
                    }
                    else
                    {
                        ViewBag.Error = "MortgageProperty already have in list. Please input another MortgageProperty";
                    }
                }
                else
                {
                    contract.MortgageProperty.Add(new MortgagePropertyView
                    {
                        PlateNumberName = PlateNumberName,
                        IssuedByName = IssuedByName,
                        PlateNumberYear = PlateNumberYear,
                        IssuedByYear = IssuedByYear,
                        PlateChassis = PlateChassis,
                        IssuedByChassis = IssuedByChassis,
                        PlateEngine = PlateEngine,
                        IssuedByEngine = IssuedByEngine,
                        PlateVignette = PlateVignette,
                        IssuedByVignette = IssuedByVignette,
                        isSaved = false
                    });
                }
            }
            else
                ViewBag.Error = "Please input information.";

            Session["MortgageProperty"] = contract.MortgageProperty;

            return PartialView("_CreateMortgagePropertyEng", contract.MortgageProperty);
        }

        public ActionResult AddKhmer(string PlateNumberName, string IssuedByName, string PlateNumberYear, string IssuedByYear, string PlateChassis,
                                    string IssuedByChassis, string PlateEngine, string IssuedByEngine, string PlateVignette, string IssuedByVignette)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["MortgagePropertyKhmer"] != null)
            {
                contract.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
            }
            
            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(PlateNumberName) && !String.IsNullOrWhiteSpace(IssuedByName))
            {
                if (contract.MortgageProperty.Count > 0)
                {
                    int count = contract.MortgageProperty.Where(c => c.PlateNumberName.Equals(PlateNumberName) && c.IssuedByName.Equals(IssuedByName)).Count();

                    if (count <= 0)
                    {
                        contract.MortgageProperty.Add(new MortgagePropertyViewKhmer
                        {
                            PlateNumberName = PlateNumberName,
                            IssuedByName = IssuedByName,
                            PlateNumberYear = PlateNumberYear,
                            IssuedByYear = IssuedByYear,
                            PlateChassis = PlateChassis,
                            IssuedByChassis = IssuedByChassis,
                            PlateEngine = PlateEngine,
                            IssuedByEngine = IssuedByEngine,
                            PlateVignette = PlateVignette,
                            IssuedByVignette = IssuedByVignette,
                            isSaved = false
                        });
                    }
                    else
                    {
                        ViewBag.Error = "MortgageProperty already have in list. Please input another MortgageProperty";
                    }
                }
                else
                {
                    contract.MortgageProperty.Add(new MortgagePropertyViewKhmer
                    {
                        PlateNumberName = PlateNumberName,
                        IssuedByName = IssuedByName,
                        PlateNumberYear = PlateNumberYear,
                        IssuedByYear = IssuedByYear,
                        PlateChassis = PlateChassis,
                        IssuedByChassis = IssuedByChassis,
                        PlateEngine = PlateEngine,
                        IssuedByEngine = IssuedByEngine,
                        PlateVignette = PlateVignette,
                        IssuedByVignette = IssuedByVignette,
                        isSaved = false
                    });
                }
            }
            else
                ViewBag.Error = "Please input information.";

            Session["MortgagePropertyKhmer"] = contract.MortgageProperty;

            return PartialView("_CreateMortgagePropertyKhmer", contract.MortgageProperty);
        }

        public ActionResult Delete(string plateNumberName, string issuedByName, bool isSaved)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["MortgageProperty"] != null)
            {
                contract.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
            }

            MortgagePropertyView _propertyView = contract.MortgageProperty.Where(c => c.PlateNumberName.Equals(plateNumberName) && c.IssuedByName.Equals(issuedByName))
                                                                        .SingleOrDefault();
            contract.MortgageProperty.Remove(_propertyView);

            Session["MortgageProperty"] = contract.MortgageProperty;
            return PartialView("_CreateMortgagePropertyEng", contract.MortgageProperty);
        }

        public ActionResult DeleteKhmer(string plateNumberName, string issuedByName, bool isSaved)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["MortgagePropertyKhmer"] != null)
            {
                contract.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
            }

            MortgagePropertyViewKhmer _propertyView = contract.MortgageProperty.Where(c => c.PlateNumberName.Equals(plateNumberName) && c.IssuedByName.Equals(issuedByName))
                                                                        .SingleOrDefault();
            contract.MortgageProperty.Remove(_propertyView);

            Session["MortgagePropertyKhmer"] = contract.MortgageProperty;
            return PartialView("_CreateMortgagePropertyKhmer", contract.MortgageProperty);
        }

        public ActionResult AddNew(string PlateNumberName, string IssuedByName, string PlateNumberYear, string IssuedByYear, string PlateChassis,
                                    string IssuedByChassis, string PlateEngine, string IssuedByEngine, string PlateVignette, string IssuedByVignette, string Collateral)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewMortgage"] != null)
            {
                contract.NewMortgageProperty = (List<MortgagePropertyView>)Session["NewMortgage"];
            }
            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(PlateNumberName) && !String.IsNullOrWhiteSpace(IssuedByName))
            {
                if (contract.NewMortgageProperty.Count > 0)
                {
                    int count = contract.NewMortgageProperty.Where(c => c.PlateNumberName.Equals(PlateNumberName) && c.IssuedByName.Equals(IssuedByName)).Count();

                    if (count <= 0)
                    {
                        contract.NewMortgageProperty.Add(new MortgagePropertyView
                        {
                            PlateNumberName = PlateNumberName,
                            IssuedByName = IssuedByName,
                            PlateNumberYear = PlateNumberYear,
                            IssuedByYear = IssuedByYear,
                            PlateChassis = PlateChassis,
                            IssuedByChassis = IssuedByChassis,
                            PlateEngine = PlateEngine,
                            IssuedByEngine = IssuedByEngine,
                            PlateVignette = PlateVignette,
                            IssuedByVignette = IssuedByVignette,
                            CollateralFor = Collateral,
                            isSaved = false
                        });
                    }
                    else
                    {
                        ViewBag.Error = "MortgageProperty already have in list. Please input another MortgageProperty";
                    }
                }
                else
                {
                    contract.NewMortgageProperty.Add(new MortgagePropertyView
                    {
                        PlateNumberName = PlateNumberName,
                        IssuedByName = IssuedByName,
                        PlateNumberYear = PlateNumberYear,
                        IssuedByYear = IssuedByYear,
                        PlateChassis = PlateChassis,
                        IssuedByChassis = IssuedByChassis,
                        PlateEngine = PlateEngine,
                        IssuedByEngine = IssuedByEngine,
                        PlateVignette = PlateVignette,
                        IssuedByVignette = IssuedByVignette,
                        CollateralFor = Collateral,
                        isSaved = false
                    });
                }
            }
            else
                ViewBag.Error = "Please input information.";

            Session["NewMortgage"] = contract.NewMortgageProperty;

            return PartialView("_NewMortgagePropertyView", contract.NewMortgageProperty);
        }

        public ActionResult DeleteNew(string plateNumberName, string issuedByName, bool isSaved)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewMortgage"] != null)
            {
                contract.NewMortgageProperty = (List<MortgagePropertyView>)Session["NewMortgage"];
            }

            MortgagePropertyView _propertyView = contract.NewMortgageProperty.Where(c => c.PlateNumberName.Equals(plateNumberName) && c.IssuedByName.Equals(issuedByName))
                                                                        .SingleOrDefault();
            contract.NewMortgageProperty.Remove(_propertyView);

            Session["NewMortgage"] = contract.NewMortgageProperty;
            return PartialView("_NewMortgagePropertyView", contract.NewMortgageProperty);
        }

        //public ActionResult AddOld(string PlateNumberName, string IssuedByName, string PlateNumberYear, string IssuedByYear, string PlateChassis,
        //                            string IssuedByChassis, string PlateEngine, string IssuedByEngine, string PlateVignette, string IssuedByVignette)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldMortgage"] != null)
        //    {
        //        contract.OldMortgageProperty = (List<MortgagePropertyView>)Session["OldMortgage"];
        //    }
        //    //chua kiem tra co trung ko roi moi add vao list
        //    if (!String.IsNullOrWhiteSpace(PlateNumberName) && !String.IsNullOrWhiteSpace(IssuedByName))
        //    {
        //        if (contract.OldMortgageProperty.Count > 0)
        //        {
        //            int count = contract.OldMortgageProperty.Where(c => c.PlateNumberName.Equals(PlateNumberName) && c.IssuedByName.Equals(IssuedByName)).Count();

        //            if (count <= 0)
        //            {
        //                contract.OldMortgageProperty.Add(new MortgagePropertyView
        //                {
        //                    PlateNumberName = PlateNumberName,
        //                    IssuedByName = IssuedByName,
        //                    PlateNumberYear = PlateNumberYear,
        //                    IssuedByYear = IssuedByYear,
        //                    PlateChassis = PlateChassis,
        //                    IssuedByChassis = IssuedByChassis,
        //                    PlateEngine = PlateEngine,
        //                    IssuedByEngine = IssuedByEngine,
        //                    PlateVignette = PlateVignette,
        //                    IssuedByVignette = IssuedByVignette,
        //                    isSaved = false
        //                });
        //            }
        //            else
        //            {
        //                ViewBag.Error = "MortgageProperty already have in list. Please input another MortgageProperty";
        //            }
        //        }
        //        else
        //        {
        //            contract.OldMortgageProperty.Add(new MortgagePropertyView
        //            {
        //                PlateNumberName = PlateNumberName,
        //                IssuedByName = IssuedByName,
        //                PlateNumberYear = PlateNumberYear,
        //                IssuedByYear = IssuedByYear,
        //                PlateChassis = PlateChassis,
        //                IssuedByChassis = IssuedByChassis,
        //                PlateEngine = PlateEngine,
        //                IssuedByEngine = IssuedByEngine,
        //                PlateVignette = PlateVignette,
        //                IssuedByVignette = IssuedByVignette,
        //                isSaved = false
        //            });
        //        }
        //    }
        //    else
        //        ViewBag.Error = "Please input information.";

        //    Session["OldMortgage"] = contract.OldMortgageProperty;

        //    return PartialView("_OldMortgagePropertyView", contract.OldMortgageProperty);
        //}

        //public ActionResult DeleteOld(string plateNumberName, string issuedByName, bool isSaved)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldMortgage"] != null)
        //    {
        //        contract.OldMortgageProperty = (List<MortgagePropertyView>)Session["OldMortgage"];
        //    }

        //    MortgagePropertyView _propertyView = contract.OldMortgageProperty.Where(c => c.PlateNumberName.Equals(plateNumberName) && c.IssuedByName.Equals(issuedByName))
        //                                                                .SingleOrDefault();
        //    contract.OldMortgageProperty.Remove(_propertyView);

        //    Session["OldMortgage"] = contract.OldMortgageProperty;
        //    return PartialView("_OldMortgagePropertyView", contract.OldMortgageProperty);
        //}
    }
}