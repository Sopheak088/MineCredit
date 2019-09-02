using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Controllers
{
    public class CarLoanController : Controller
    {
        // GET: CarLoan
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Add(string CarLoanDescription, string CarLoanType, float CardLoanValue)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["CarLoan"] != null)
            {
                contract.listCarLoan = (List<CarLoanEnglish>)Session["CarLoan"];
            }
            //bool flag = false;
            if (!String.IsNullOrWhiteSpace(CarLoanDescription) && !string.IsNullOrWhiteSpace(CarLoanType) && CardLoanValue > 0)
            {
                if (contract.listCarLoan.Count > 0)
                {
                    int count = contract.listCarLoan.Where(c => c.Description.Equals(CarLoanDescription) && c.Type.Equals(CarLoanType) && c.Value == CardLoanValue)
                                                            .Count();
                    
                    if(count<=0)
                        contract.listCarLoan.Add(new CarLoanEnglish
                        {
                            Description = CarLoanDescription,
                            Type = CarLoanType,
                            Value = CardLoanValue,
                            isSaved = false
                        });
                    else
                        ViewBag.Error = "Guarantee car loan already have in list. Please input other guarantee car loan ";
                }
                else
                {
                    contract.listCarLoan.Add(new CarLoanEnglish
                    {
                        Description = CarLoanDescription,
                        Type = CarLoanType,
                        Value = CardLoanValue,
                        isSaved = false
                    });
                }
            }
            else
                ViewBag.Error = "Please input information is required.";
            Session["CarLoan"] = contract.listCarLoan;
            return PartialView("_CreateCarLoanEng", contract.listCarLoan);
        }

        public ActionResult Delete(string CarLoanDescription, float CardLoanValue, bool isSaved)
        {
            CreateIndividualContractEng contract = new CreateIndividualContractEng();
            if (Session["CarLoan"] != null)
            {
                contract.listCarLoan = (List<CarLoanEnglish>)Session["CarLoan"];
            }
            CarLoanEnglish CarLoan = contract.listCarLoan.Where(c => c.Description.Equals(CarLoanDescription) && c.Value == CardLoanValue).SingleOrDefault();
            contract.listCarLoan.Remove(CarLoan);
            Session["CarLoan"] = contract.listCarLoan;
            return PartialView("_CreateCarLoanEng", contract.listCarLoan);
        }

    }
}