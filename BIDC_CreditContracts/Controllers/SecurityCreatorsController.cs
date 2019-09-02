using BIDC_CreditContracts.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Controllers
{
    public class SecurityCreatorsController : Controller
    {
        // GET: SecurityCreators
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string Name, string IDNo, DateTime IssuedDate, string IssuedBy, string Address, string Telephone, string Email)
        {
            SecurityContractEng contract = new SecurityContractEng();
            if (Session["Security"] != null)
                contract.listSecurityCreator = (List<SecurityCreatorEng>)Session["Security"];
            if (!string.IsNullOrWhiteSpace(Name) && !string.IsNullOrWhiteSpace(IDNo) && !string.IsNullOrWhiteSpace(IssuedDate.ToString()))
            {
                if(contract.listSecurityCreator.Count>0)
                {
                    int count = contract.listSecurityCreator.Where(c => c.Name.Equals(Name) && c.IDNo.Equals(IDNo)).Count();
                    if (count <= 0)
                        contract.listSecurityCreator.Add(new SecurityCreatorEng
                        {
                            Name = Name,
                            IDNo = IDNo,
                            IssuedDate = IssuedDate,
                            IssuedBy = IssuedBy,
                            Address = Address,
                            Telephone = Telephone,
                            Email = Email
                        });
                    else
                        ViewBag.Error = "Security Creator already have in list. Please input another Security Creator";
                }
                else
                {
                    contract.listSecurityCreator.Add(new SecurityCreatorEng
                    {
                        Name = Name,
                        IDNo = IDNo,
                        IssuedDate = IssuedDate,
                        IssuedBy = IssuedBy,
                        Address = Address,
                        Telephone = Telephone,
                        Email = Email
                    });
                }
                    
            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["Security"] = contract.listSecurityCreator;
            return PartialView("_CreateSecurityCreatorEng", contract.listSecurityCreator);
        }

        public ActionResult Delete(string name, string idNo, bool isSaved)
        {
            SecurityContractEng contract = new SecurityContractEng();
            if (Session["Security"] != null)
                contract.listSecurityCreator = (List<SecurityCreatorEng>)Session["Security"];
            SecurityCreatorEng security = contract.listSecurityCreator.Where(c => c.Name.Equals(name) && c.IDNo.Equals(idNo)).SingleOrDefault();
            contract.listSecurityCreator.Remove(security);
            Session["Security"] = contract.listSecurityCreator;
            return PartialView("_CreateSecurityCreatorEng", contract.listSecurityCreator);
        }

        public ActionResult AddKhmer(string Name, string IDNo, DateTime IssuedDate, string IssuedBy, string Address, string Telephone, string Email)
        {
            SecurityContractKhmer contract = new SecurityContractKhmer();
            if (Session["SecurityKhmer"] != null)
                contract.listSecurityCreator = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
            if (!string.IsNullOrWhiteSpace(Name) && !string.IsNullOrWhiteSpace(IDNo) && !string.IsNullOrWhiteSpace(IssuedDate.ToString()))
            {
                if (contract.listSecurityCreator.Count > 0)
                {
                    int count = contract.listSecurityCreator.Where(c => c.Name.Equals(Name) && c.IDNo.Equals(IDNo)).Count();
                    if (count <= 0)
                        contract.listSecurityCreator.Add(new SecurityCreatorKhmer
                        {
                            Name = Name,
                            IDNo = IDNo,
                            IssuedDate = IssuedDate,
                            IssuedBy = IssuedBy,
                            Address = Address,
                            Telephone = Telephone,
                            Email = Email
                        });
                    else
                        ViewBag.Error = "Security Creator already have in list. Please input another Security Creator";
                }
                else
                {
                    contract.listSecurityCreator.Add(new SecurityCreatorKhmer
                    {
                        Name = Name,
                        IDNo = IDNo,
                        IssuedDate = IssuedDate,
                        IssuedBy = IssuedBy,
                        Address = Address,
                        Telephone = Telephone,
                        Email = Email
                    });
                }

            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["SecurityKhmer"] = contract.listSecurityCreator;
            return PartialView("_CreateSecurityCreatorKhmer", contract.listSecurityCreator);
        }

        public ActionResult DeleteKhmer(string name, string idNo, bool isSaved)
        {
            SecurityContractKhmer contract = new SecurityContractKhmer();
            if (Session["SecurityKhmer"] != null)
                contract.listSecurityCreator = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
            SecurityCreatorKhmer security = contract.listSecurityCreator.Where(c => c.Name.Equals(name) && c.IDNo.Equals(idNo)).SingleOrDefault();
            contract.listSecurityCreator.Remove(security);
            Session["SecurityKhmer"] = contract.listSecurityCreator;
            return PartialView("_CreateSecurityCreatorKhmer", contract.listSecurityCreator);
        }
    }
}