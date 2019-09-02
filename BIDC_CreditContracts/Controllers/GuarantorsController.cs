using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class GuarantorsController : Controller
    {
        // GET: Guarantor
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string GuarantorName, string GuarantorPassportNo, DateTime GuarantorPassportDate)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if(Session["Guarantor"]!=null){
                contract.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
            }

            
            if(!string.IsNullOrWhiteSpace(GuarantorName) && !string.IsNullOrWhiteSpace(GuarantorPassportNo))
            {
                if(contract.Guarantor.Count>0)
                {
                    int count = contract.Guarantor.Where(c => c.GuarantorName.Equals(GuarantorName) && c.Passport.Equals(GuarantorPassportNo)).Count();
                    if(count <= 0)
                    {
                        contract.Guarantor.Add(new GuarantorViewEng
                        {
                            GuarantorName = GuarantorName,
                            Passport = GuarantorPassportNo,
                            PassportDate = GuarantorPassportDate,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Guarantor already have in list. Please input another Guarantor";
                }
                else
                {
                    contract.Guarantor.Add(new GuarantorViewEng
                    {
                        GuarantorName = GuarantorName,
                        Passport = GuarantorPassportNo,
                        PassportDate = GuarantorPassportDate,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }
            Session["Guarantor"] = contract.Guarantor;
            return PartialView("_CreateGuarantorEng", contract.Guarantor);
        }

        public ActionResult Delete(string GuarantorName, string GuarantorPassportNo, bool isSaved)
        {
            CreateCompanyContractEng contract = new CreateCompanyContractEng();
            if (Session["Guarantor"] != null)
            {
                contract.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
            }
            GuarantorViewEng _guarantorViewEng = contract.Guarantor.Where(c => c.GuarantorName.Equals(GuarantorName)
                                                                                && c.Passport.Equals(GuarantorPassportNo)).SingleOrDefault();
            contract.Guarantor.Remove(_guarantorViewEng);

            Session["Guarantor"] = contract.Guarantor;
            return PartialView("_CreateGuarantorEng", contract.Guarantor);
        }

        public ActionResult AddKhmer(string GuarantorName, string GuarantorPassportNo, DateTime GuarantorPassportDate)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["GuarantorKhmer"] != null)
            {
                contract.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
            }

            
            if (!string.IsNullOrWhiteSpace(GuarantorName) && !string.IsNullOrWhiteSpace(GuarantorPassportNo))
            {
                if (contract.Guarantor.Count > 0)
                {
                    int count = contract.Guarantor.Where(c => c.GuarantorName.Equals(GuarantorName) && c.Passport.Equals(GuarantorPassportNo)).Count();
                    if (count <= 0)
                    {
                        contract.Guarantor.Add(new GuarantorViewKhmer
                        {
                            GuarantorName = GuarantorName,
                            Passport = GuarantorPassportNo,
                            PassportDate = GuarantorPassportDate,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Guarantor already have in list. Please input another Guarantor";
                }
                else
                {
                    contract.Guarantor.Add(new GuarantorViewKhmer
                    {
                        GuarantorName = GuarantorName,
                        Passport = GuarantorPassportNo,
                        PassportDate = GuarantorPassportDate,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }
            Session["GuarantorKhmer"] = contract.Guarantor;
            return PartialView("_CreateGuarantorKhmer", contract.Guarantor);
        }

        public ActionResult DeleteKhmer(string GuarantorName, string GuarantorPassportNo, bool isSaved)
        {
            CreateCompanyContractKhmer contract = new CreateCompanyContractKhmer();
            if (Session["GuarantorKhmer"] != null)
            {
                contract.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
            }
            GuarantorViewKhmer _guarantorViewEng = contract.Guarantor.Where(c => c.GuarantorName.Equals(GuarantorName)
                                                                                && c.Passport.Equals(GuarantorPassportNo)).SingleOrDefault();
            contract.Guarantor.Remove(_guarantorViewEng);

            Session["GuarantorKhmer"] = contract.Guarantor;
            return PartialView("_CreateGuarantorKhmer", contract.Guarantor);
        }

        public ActionResult AddNew(string GuarantorName, string GuarantorPassportNo, DateTime GuarantorPassportDate)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewGuarantor"] != null)
            {
                contract.NewGuarantor = (List<GuarantorViewEng>)Session["NewGuarantor"];
            }


            if (!string.IsNullOrWhiteSpace(GuarantorName) && !string.IsNullOrWhiteSpace(GuarantorPassportNo))
            {
                if (contract.NewGuarantor.Count > 0)
                {
                    int count = contract.NewGuarantor.Where(c => c.GuarantorName.Equals(GuarantorName) && c.Passport.Equals(GuarantorPassportNo)).Count();
                    if (count <= 0)
                    {
                        contract.NewGuarantor.Add(new GuarantorViewEng
                        {
                            GuarantorName = GuarantorName,
                            Passport = GuarantorPassportNo,
                            PassportDate = GuarantorPassportDate,
                            isSaved = false
                        });
                    }
                    else
                        ViewBag.Error = "Guarantor already have in list. Please input another Guarantor";
                }
                else
                {
                    contract.NewGuarantor.Add(new GuarantorViewEng
                    {
                        GuarantorName = GuarantorName,
                        Passport = GuarantorPassportNo,
                        PassportDate = GuarantorPassportDate,
                        isSaved = false
                    });
                }
            }
            else
            {
                ViewBag.Error = "Please input information is required.";
            }
            Session["NewGuarantor"] = contract.NewGuarantor;
            return PartialView("_NewGuarantorView", contract.NewGuarantor);
        }

        public ActionResult DeleteNew(string GuarantorName, string GuarantorPassportNo, bool isSaved)
        {
            CreateDecide contract = new CreateDecide();
            if (Session["NewGuarantor"] != null)
            {
                contract.NewGuarantor = (List<GuarantorViewEng>)Session["NewGuarantor"];
            }
            GuarantorViewEng _guarantorViewEng = contract.NewGuarantor.Where(c => c.GuarantorName.Equals(GuarantorName)
                                                                                && c.Passport.Equals(GuarantorPassportNo)).SingleOrDefault();
            contract.NewGuarantor.Remove(_guarantorViewEng);

            Session["NewGuarantor"] = contract.NewGuarantor;
            return PartialView("_NewGuarantorView", contract.NewGuarantor);
        }

        //public ActionResult AddOld(string GuarantorName, string GuarantorPassportNo, DateTime GuarantorPassportDate)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldGuarantor"] != null)
        //    {
        //        contract.OldGuarantor = (List<GuarantorViewEng>)Session["OldGuarantor"];
        //    }


        //    if (!string.IsNullOrWhiteSpace(GuarantorName) && !string.IsNullOrWhiteSpace(GuarantorPassportNo))
        //    {
        //        if (contract.OldGuarantor.Count > 0)
        //        {
        //            int count = contract.OldGuarantor.Where(c => c.GuarantorName.Equals(GuarantorName) && c.Passport.Equals(GuarantorPassportNo)).Count();
        //            if (count <= 0)
        //            {
        //                contract.OldGuarantor.Add(new GuarantorViewEng
        //                {
        //                    GuarantorName = GuarantorName,
        //                    Passport = GuarantorPassportNo,
        //                    PassportDate = GuarantorPassportDate,
        //                    isSaved = false
        //                });
        //            }
        //            else
        //                ViewBag.Error = "Guarantor already have in list. Please input another Guarantor";
        //        }
        //        else
        //        {
        //            contract.OldGuarantor.Add(new GuarantorViewEng
        //            {
        //                GuarantorName = GuarantorName,
        //                Passport = GuarantorPassportNo,
        //                PassportDate = GuarantorPassportDate,
        //                isSaved = false
        //            });
        //        }
        //    }
        //    else
        //    {
        //        ViewBag.Error = "Please input information is required.";
        //    }
        //    Session["OldGuarantor"] = contract.OldGuarantor;
        //    return PartialView("_OldGuarantorView", contract.OldGuarantor);
        //}

        //public ActionResult DeleteOld(string GuarantorName, string GuarantorPassportNo, bool isSaved)
        //{
        //    CreateDecide contract = new CreateDecide();
        //    if (Session["OldGuarantor"] != null)
        //    {
        //        contract.OldGuarantor = (List<GuarantorViewEng>)Session["OldGuarantor"];
        //    }
        //    GuarantorViewEng _guarantorViewEng = contract.OldGuarantor.Where(c => c.GuarantorName.Equals(GuarantorName)
        //                                                                        && c.Passport.Equals(GuarantorPassportNo)).SingleOrDefault();
        //    contract.OldGuarantor.Remove(_guarantorViewEng);

        //    Session["OldGuarantor"] = contract.OldGuarantor;
        //    return PartialView("_OldGuarantorView", contract.OldGuarantor);
        //}
    }
}