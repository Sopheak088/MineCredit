using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;
using BIDC_CreditContracts.DAL;
using System.Globalization;

namespace BIDC_CreditContracts.Controllers
{
    public class PropertiesController : Controller
    {
        private CreditContractContext db = new CreditContractContext();
        // GET: Properties
        public ActionResult Index()
        {
            return View();
        }

        //Add Property English
        public ActionResult Add(string TypeOfProperty, string Ownership, string Pacelnumber, string TitleNumber, string Location, string TotalSize)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["Property"] != null)
            {
                contract.HypothecatedProperty = (List<PropertyView>)Session["Property"];
            }
          
            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(Pacelnumber) && !String.IsNullOrWhiteSpace(TitleNumber))
            {
                if (contract.HypothecatedProperty.Count > 0)
                {
                    
                    int count = contract.HypothecatedProperty.Where(c => c.Pacelnumber.Equals(Pacelnumber) && c.TitleNumber.Equals(TitleNumber)).Count();

                    if(count <= 0)
                    {
                        contract.HypothecatedProperty.Add(new PropertyView
                        {
                            TypeOfProperty = TypeOfProperty,
                            Ownership = Ownership,
                            Pacelnumber = Pacelnumber,
                            TitleNumber = TitleNumber,
                            Location = Location,
                            TotalSize = TotalSize,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Property already have in list. Please input another property";
                }
                else
                {
                    contract.HypothecatedProperty.Add(new PropertyView
                    {
                        TypeOfProperty = TypeOfProperty,
                        Ownership = Ownership,
                        Pacelnumber = Pacelnumber,
                        TitleNumber = TitleNumber,
                        Location = Location,
                        TotalSize = TotalSize,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }
            
            Session["Property"] = contract.HypothecatedProperty;

            return PartialView("_CreatePropertyEng", contract.HypothecatedProperty);
        }

        //Add Property Khmer
        public ActionResult AddKhmer(string TypeOfProperty, string Ownership, string Pacelnumber, string TitleNumber, string Location, string TotalSize)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();

            if (Session["PropertyKhmer"] != null)
            {
                contract.HypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            }
            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(Pacelnumber) && !String.IsNullOrWhiteSpace(TitleNumber))
            {
                if (contract.HypothecatedProperty.Count > 0)
                {
                    int count = contract.HypothecatedProperty.Where(c => c.Pacelnumber.Equals(Pacelnumber) && c.TitleNumber.Equals(TitleNumber)).Count(); 
                    if (count <= 0)
                    {
                        contract.HypothecatedProperty.Add(new PropertyViewKhmer
                        {
                            TypeOfProperty = TypeOfProperty,
                            Ownership = Ownership,
                            Pacelnumber = Pacelnumber,
                            TitleNumber = TitleNumber,
                            Location = Location,
                            TotalSize = TotalSize,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Property already have in list. Please input another property";
                }
                else
                {
                    contract.HypothecatedProperty.Add(new PropertyViewKhmer
                    {
                        TypeOfProperty = TypeOfProperty,
                        Ownership = Ownership,
                        Pacelnumber = Pacelnumber,
                        TitleNumber = TitleNumber,
                        Location = Location,
                        TotalSize = TotalSize,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["PropertyKhmer"] = contract.HypothecatedProperty;

            return PartialView("_CreatePropertyKhmer", contract.HypothecatedProperty);
        }

        //Delete Property English
        public ActionResult Delete(string pacelNumber, string titleNumber, bool isSaved)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["Property"] != null)
            {
                contract.HypothecatedProperty = (List<PropertyView>)Session["Property"];
            }

            PropertyView _propertyView = contract.HypothecatedProperty.Where(c => c.Pacelnumber.Equals(pacelNumber) && c.TitleNumber.Equals(titleNumber))
                                                                        .FirstOrDefault();
            contract.HypothecatedProperty.Remove(_propertyView);

            Session["Property"] = contract.HypothecatedProperty;
            return PartialView("_CreatePropertyEng", contract.HypothecatedProperty);
        }

        //Delete Property Khmer
        public ActionResult DeleteKhmer(string pacelNumber, string titleNumber, bool isSaved)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["PropertyKhmer"] != null)
            {
                contract.HypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            }

            PropertyViewKhmer _propertyView = contract.HypothecatedProperty.Where(c => c.Pacelnumber.Equals(pacelNumber) && c.TitleNumber.Equals(titleNumber))
                                                                        .FirstOrDefault();
            contract.HypothecatedProperty.Remove(_propertyView);

            Session["PropertyKhmer"] = contract.HypothecatedProperty;
            return PartialView("_CreatePropertyKhmer", contract.HypothecatedProperty);
        }

        public ActionResult AddNew(string TypeOfProperty, string Ownership, string Pacelnumber, string TitleNumber, string Location, string TotalSize, string Collateral)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewProperty"] != null)
            {
                contract.NewProperty = (List<PropertyView>)Session["NewProperty"];
            }

            //chua kiem tra co trung ko roi moi add vao list
            if (!String.IsNullOrWhiteSpace(Pacelnumber) && !String.IsNullOrWhiteSpace(TitleNumber))
            {
                if (contract.NewProperty.Count > 0)
                {

                    int count = contract.NewProperty.Where(c => c.Pacelnumber.Equals(Pacelnumber) && c.TitleNumber.Equals(TitleNumber)).Count();

                    if (count <= 0)
                    {
                        contract.NewProperty.Add(new PropertyView
                        {
                            TypeOfProperty = TypeOfProperty,
                            Ownership = Ownership,
                            Pacelnumber = Pacelnumber,
                            TitleNumber = TitleNumber,
                            Location = Location,
                            TotalSize = TotalSize,
                            CollateralFor = Collateral,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Property already have in list. Please input another property";
                }
                else
                {
                    contract.NewProperty.Add(new PropertyView
                    {
                        TypeOfProperty = TypeOfProperty,
                        Ownership = Ownership,
                        Pacelnumber = Pacelnumber,
                        TitleNumber = TitleNumber,
                        Location = Location,
                        TotalSize = TotalSize,
                        CollateralFor = Collateral,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }

            Session["NewProperty"] = contract.NewProperty;

            return PartialView("_NewPropertyView", contract.NewProperty);
        }

        public ActionResult DeleteNew(string pacelNumber, string titleNumber, bool isSaved)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewProperty"] != null)
            {
                contract.NewProperty = (List<PropertyView>)Session["NewProperty"];
            }

            PropertyView _propertyView = contract.NewProperty.Where(c => c.Pacelnumber.Equals(pacelNumber) && c.TitleNumber.Equals(titleNumber))
                                                                        .FirstOrDefault();
            contract.NewProperty.Remove(_propertyView);

            Session["NewProperty"] = contract.NewProperty;
            return PartialView("_NewPropertyView", contract.NewProperty);
        }

        //public ActionResult AddOld(string TypeOfProperty, string Ownership, string Pacelnumber, string TitleNumber, string Location, string TotalSize)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldProperty"] != null)
        //    {
        //        contract.OldProperty = (List<PropertyView>)Session["OldProperty"];
        //    }

        //    //chua kiem tra co trung ko roi moi add vao list
        //    if (!String.IsNullOrWhiteSpace(Pacelnumber) && !String.IsNullOrWhiteSpace(TitleNumber))
        //    {
        //        if (contract.OldProperty.Count > 0)
        //        {

        //            int count = contract.OldProperty.Where(c => c.Pacelnumber.Equals(Pacelnumber) && c.TitleNumber.Equals(TitleNumber)).Count();

        //            if (count <= 0)
        //            {
        //                contract.OldProperty.Add(new PropertyView
        //                {
        //                    TypeOfProperty = TypeOfProperty,
        //                    Ownership = Ownership,
        //                    Pacelnumber = Pacelnumber,
        //                    TitleNumber = TitleNumber,
        //                    Location = Location,
        //                    TotalSize = TotalSize,
        //                    isSaved = false
        //                });
        //            }
        //            else
        //                ViewBag.Error = "Property already have in list. Please input another property";
        //        }
        //        else
        //        {
        //            contract.OldProperty.Add(new PropertyView
        //            {
        //                TypeOfProperty = TypeOfProperty,
        //                Ownership = Ownership,
        //                Pacelnumber = Pacelnumber,
        //                TitleNumber = TitleNumber,
        //                Location = Location,
        //                TotalSize = TotalSize,
        //                isSaved = false
        //            });
        //        }
        //    }
        //    else
        //    {
        //        ViewBag.Error = "Please input information is required.";
        //    }

        //    Session["OldProperty"] = contract.OldProperty;

        //    return PartialView("_OldPropertyView", contract.OldProperty);
        //}

        //public ActionResult DeleteOld(string pacelNumber, string titleNumber, bool isSaved)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldProperty"] != null)
        //    {
        //        contract.OldProperty = (List<PropertyView>)Session["OldProperty"];
        //    }

        //    PropertyView _propertyView = contract.OldProperty.Where(c => c.Pacelnumber.Equals(pacelNumber) && c.TitleNumber.Equals(titleNumber))
        //                                                                .SingleOrDefault();
        //    contract.OldProperty.Remove(_propertyView);

        //    Session["OldProperty"] = contract.OldProperty;
        //    return PartialView("_OldPropertyView", contract.OldProperty);
        //}
    }
}