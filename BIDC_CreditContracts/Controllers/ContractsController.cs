using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BIDC_CreditContracts.DAL;
using BIDC_CreditContracts.Models;
using Microsoft.Office.Interop.Word;
using Microsoft.Office.Core;
using System.Reflection;
using System.Globalization;
using System.Web.Security;
using System.Web.Profile;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using System.IO;
using System.Text.RegularExpressions;
using Spire.Doc;
using Spire.Doc.Documents;
using System.Drawing;
using System.Drawing.Imaging;
using BIDC_CreditContracts.Repositories;
using System.Threading;
//using log4net;

namespace BIDC_CreditContracts.Controllers
{
    public class ContractsController : Controller
    {
        //private static readonly ILog logger = LogManager.GetLogger(typeof(ContractsController));
        private CreditContractContext db = new CreditContractContext();

        // GET: Contracts
        public ActionResult Index()
        {
            //var contracts = db.Contracts.Include(c => c.Branch).Include(c => c.TypeOfContract);
            //return View(contracts.ToList());
            if (Session["BranchID"] != null)
            {
                string now = DateTime.Now.ToString("dd-MMMM-yyyy");
                string lastDate = DateTime.Now.AddDays(-7).ToString("dd-MMMM-yyyy");
                return RedirectToAction("Search", new { fromDate = lastDate, toDate = now });
            }
            else
                return RedirectToAction("LogOff", "Account");
        }

        [HttpPost]
        public ActionResult Search(SearchContract model)
        {
            if (Session["BranchID"] != null)
            {
                return RedirectToAction("Search", new { fromDate = model.FromDate, toDate = model.ToDate });
            }
            else
                return RedirectToAction("LogOff", "Account");
        }

        public ActionResult Search(string fromDate, string toDate)
        {
            MembershipUser user = Membership.GetUser();
            ProfileBase profile = ProfileBase.Create(user.UserName);
            string branchId = (string)profile.GetPropertyValue("BranchId");
            SearchContract model = new SearchContract();
            DateTime fromSearchDate;
            DateTime toSearchDate;
            try
            {
                fromSearchDate = (string.IsNullOrEmpty(fromDate))
                            ? DateTime.Parse("01/01/2015", CultureInfo.CreateSpecificCulture("fr-FR"))
                            : DateTime.Parse(fromDate);

                toSearchDate = (string.IsNullOrEmpty(toDate))
                            ? DateTime.Parse("01/01/2030", CultureInfo.CreateSpecificCulture("fr-FR"))
                            : DateTime.Parse(toDate);
                if (fromSearchDate.CompareTo(toSearchDate) > 0)
                {
                    ModelState.AddModelError("", "The From Date must be earlier than the To Date");
                    return View(model);
                }
            }
            catch
            {
                ModelState.AddModelError("", "The format of date must be \"mm/dd/yyyy\"");
                return View(model);
            }

            model.FromDate = fromSearchDate.ToString("MM/dd/yyyy");
            model.ToDate = toSearchDate.ToString("MM/dd/yyyy");
            if (branchId.Equals("KH0010001"))
            {
                model.listContractEng = db.Contracts.Where(c => c.ContractDate.CompareTo(fromSearchDate) >= 0 && c.ContractDate.CompareTo(toSearchDate) <= 0 && c.Language.Equals("English") && c.Status == Constances.Authorised)
                                                    .Include(c => c.Branch).Include(c => c.TypeOfContract).OrderByDescending(c => c.ContractDate).ToList();
                model.listContractKhmer = db.Contracts.Where(c => c.ContractDate.CompareTo(fromSearchDate) >= 0 && c.ContractDate.CompareTo(toSearchDate) <= 0 && c.Language.Equals("Khmer") && c.Status == Constances.Authorised)
                                                        .Include(c => c.Branch).Include(c => c.TypeOfContract).OrderByDescending(c => c.ContractDate).ToList();

            }
            else
            {
                model.listContractEng = db.Contracts.Where(c => c.ContractDate.CompareTo(fromSearchDate) >= 0 && c.ContractDate.CompareTo(toSearchDate) <= 0
                                                    && c.Language.Equals("English") && c.Status == Constances.Authorised && c.BranchID.Equals(branchId))
                                                    .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                                    .OrderByDescending(c => c.ContractDate).ToList();
                model.listContractKhmer = db.Contracts.Where(c => c.ContractDate.CompareTo(fromSearchDate) >= 0 && c.ContractDate.CompareTo(toSearchDate) <= 0
                                                        && c.Language.Equals("Khmer") && c.Status == Constances.Authorised && c.BranchID.Equals(branchId))
                                                        .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                                        .OrderByDescending(c => c.ContractDate).ToList();

            }

            return View(model);
        }

        // GET: Contracts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model = GetContractEng(contract);
            return View(model);
        }
                                        
        public ActionResult CreateContractStep1()
        {

            CreateContractStep1 model = new CreateContractStep1();
            model.ContractTypeItems = new List<SelectListItem>();
            model.ContractTypeItems.Add(new SelectListItem
            {
                Text = "Company",
                Value = "Company"
            });
            model.ContractTypeItems.Add(new SelectListItem
            {
                Text = "Individual",
                Value = "Individual"
            });

            model.LanguageItems = new List<SelectListItem>();
            model.LanguageItems.Add(new SelectListItem
            {
                Text = "English",
                Value = "English"
            });
            model.LanguageItems.Add(new SelectListItem
            {
                Text = "Khmer",
                Value = "Khmer"
            });

            List<Branch> listBranch = db.Branches.ToList();
            model.BranchItems = new List<SelectListItem>();
            foreach(Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID
                });
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult CreateContractStep1(CreateContractStep1 model)
        {
            List<Branch> listBranch;
            if (ModelState.IsValid)
            {
                CreateContractStep2 contractStep2 = new CreateContractStep2();
                contractStep2.Branch = model.Branch;
                contractStep2.Language = model.Language;
                contractStep2.DecideCode = model.DecideCode;
                int flagDecide = db.Decides.Where(c => c.DecideCode.Equals(model.DecideCode.Trim())).Count();
                if(flagDecide>0)
                    if (model.Language.Equals("English") && model.TypeContract.Equals("Company"))
                    {
                        Session["contractInfo"] = contractStep2;
                        return RedirectToAction("Create");
                    }
                    else if (model.Language.Equals("Khmer") && model.TypeContract.Equals("Company"))
                    {
                        Session["contractInfo"] = contractStep2;
                        return RedirectToAction("CreateKhmer");
                    }
                    else if (model.Language.Equals("English") && model.TypeContract.Equals("Individual"))
                    {
                        Session["contractInfo"] = contractStep2;
                        return RedirectToAction("CommingSoon", "IndividualContracts");
                    }
                    else
                    {
                        Session["contractInfo"] = contractStep2;
                        return RedirectToAction("CommingSoon", "IndividualContracts");
                    }
                else
                {
                    ModelState.AddModelError("", "Decision not have in system. Please add Decision first");
                    model.ContractTypeItems = new List<SelectListItem>();
                    model.ContractTypeItems.Add(new SelectListItem
                    {
                        Text = "Company",
                        Value = "Company"
                    });
                    model.ContractTypeItems.Add(new SelectListItem
                    {
                        Text = "Individual",
                        Value = "Individual"
                    });

                    model.LanguageItems = new List<SelectListItem>();
                    model.LanguageItems.Add(new SelectListItem
                    {
                        Text = "English",
                        Value = "English"
                    });
                    model.LanguageItems.Add(new SelectListItem
                    {
                        Text = "Khmer",
                        Value = "Khmer"
                    });

                    listBranch = db.Branches.ToList();
                    model.BranchItems = new List<SelectListItem>();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.Branch) ? true : false
                        });
                    }
                }
            }
            model.ContractTypeItems = new List<SelectListItem>();
            model.ContractTypeItems.Add(new SelectListItem
            {
                Text = "Company",
                Value = "Company"
            });
            model.ContractTypeItems.Add(new SelectListItem
            {
                Text = "Individual",
                Value = "Individual"
            });

            model.LanguageItems = new List<SelectListItem>();
            model.LanguageItems.Add(new SelectListItem
            {
                Text = "English",
                Value = "English"
            });
            model.LanguageItems.Add(new SelectListItem
            {
                Text = "Khmer",
                Value = "Khmer"
            });

            listBranch = db.Branches.ToList();
            model.BranchItems = new List<SelectListItem>();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID,
                    Selected = item.BranchID.Equals(model.Branch) ? true : false
                });
            }
            return View(model);
                
        }

        //put contract
        public Contract PutContractEng(CreateCompanyContractEng model, Contract contract)
        {
            //contract.ContractID = model.ContractID;
            contract.ContractNo = model.ContractNo + model.ContractNoSecond;
            contract.ContractDate = model.ContractDate;
            contract.ApplicationDate = model.ApplicationDate;
            //contract.BranchID = model.BranchID;
            //contract.TypeOfContractID = model.TypeOfContractID;
            contract.Language = model.Language;

            //customer or company
            contract.Cif = model.Cif;
            contract.CompanyName = model.CompanyName;
            contract.TypeOfCompanyID = model.TypeOfCompanyID;

            //approved loan
            contract.LoanAmount = model.LoanAmount;
            contract.LCBankGuarantee = model.LCBankGuarantee;
            contract.LoanCurrency = model.LoanCurrency;
            contract.LegalCurrency = model.LegalCurrency;
            contract.InterestRate = model.InterestRate;
            contract.Term = model.Term;
            contract.ProcessingFee = model.ProcessingFee;
            contract.Purpose = model.Purpose;
            contract.GracePeriod = model.GracePeriod;
            contract.RepaymentPrinciple = model.RepaymentPrinciple;
            contract.RepaymentInterest = model.RepaymentInterest;
                        
            contract.LoanWithdraw = model.LoanWithdraw;
            contract.OtherCondition = model.OtherCondition;
            contract.LegalFee = model.LegalFee;
            contract.LoanRestrucFee = model.LoanRestrucFee;
            contract.EarlySettleFee = model.EarlySettleFee;

            //contact
            contract.BankContactEmail = model.BankContactEmail;
            contract.BankContactPerson = model.BankContactPerson;
            contract.BankContactPhone = model.BankContactPhone;
            contract.BankContactPosition = model.BankContactPosition;

            contract.BorrowerContactPerson = model.BorrowerContactPerson;
            contract.BorrowerContactPosition = model.BorrowerContactPosition;
            contract.BorrowerContactPhone = model.BorrowerContactPhone;
            contract.BorrowerContactEmail = model.BorrowerContactEmail;

            contract.BankContactEmail = model.BankContactEmail;
            contract.BankContactPerson = model.BankContactPerson;
            contract.BankContactPhone = model.BankContactPhone;
            contract.BankContactPosition = model.BankContactPosition;

            //language
            contract.NumberBankKeep = model.NumberBankKeep;
            contract.NumberCustomerKeep = model.NumberCustomerKeep;
            contract.NumberOfContractEng = model.NumberOfContractEng;
            contract.NumberOfContractKH = model.NumberOfContractKH;
            contract.NumberOtherKeep = model.NumberOtherKeep;

            contract.BranchDirector = model.BranchDirector;
            contract.BranchPosition = model.BranchPosition;
            contract.OtherPurpose = model.OtherPurpose;
            contract.DecideCode = model.DecideCode;
            return contract;
        }

        public Contract PutContractKhmer(CreateCompanyContractKhmer model, Contract contract)
        {
            //contract.ContractID = model.ContractID;
            contract.ContractNo = model.ContractNo + model.ContractNoSecond;
            contract.ContractDate = model.ContractDate;
            contract.ApplicationDate = model.ApplicationDate;
            //contract.BranchID = model.BranchID;
            //contract.TypeOfContractID = model.TypeOfContractID;
            contract.Language = model.Language;

            //customer or company
            contract.Cif = model.Cif;
            contract.CompanyName = model.CompanyName;
            contract.TypeOfCompanyID = model.TypeOfCompanyID;

            //approved loan
            contract.LoanAmount = model.LoanAmount;
            contract.LCBankGuarantee = model.LCBankGuarantee;
            contract.LoanCurrency = model.LoanCurrency;
            contract.LegalCurrency = model.LegalCurrency;
            contract.InterestRate = model.InterestRate;
            contract.Term = model.Term;
            contract.ProcessingFee = model.ProcessingFee;
            contract.Purpose = model.Purpose;
            contract.GracePeriod = model.GracePeriod;
            contract.RepaymentPrinciple = model.RepaymentPrinciple;
            contract.RepaymentInterest = model.RepaymentInterest;

            contract.LoanWithdraw = model.LoanWithdraw;
            contract.OtherCondition = model.OtherCondition;
            contract.LegalFee = model.LegalFee;
            contract.LoanRestrucFee = model.LoanRestrucFee;
            contract.EarlySettleFee = model.EarlySettleFee;

            contract.BankContactEmail = model.BankContactEmail;
            contract.BankContactPerson = model.BankContactPerson;
            contract.BankContactPhone = model.BankContactPhone;
            contract.BankContactPosition = model.BankContactPosition;

            contract.BorrowerContactPerson = model.BorrowerContactPerson;
            contract.BorrowerContactPosition = model.BorrowerContactPosition;
            contract.BorrowerContactPhone = model.BorrowerContactPhone;
            contract.BorrowerContactEmail = model.BorrowerContactEmail;

            contract.BankContactEmail = model.BankContactEmail;
            contract.BankContactPerson = model.BankContactPerson;
            contract.BankContactPhone = model.BankContactPhone;
            contract.BankContactPosition = model.BankContactPosition;

            //language
            contract.NumberBankKeep = model.NumberBankKeep;
            contract.NumberCustomerKeep = model.NumberCustomerKeep;
            contract.NumberOfContractEng = model.NumberOfContractEng;
            contract.NumberOfContractKH = model.NumberOfContractKH;
            contract.NumberOtherKeep = model.NumberOtherKeep;

            contract.BranchDirector = model.BranchDirector;
            contract.BranchPosition = model.BranchPosition;
            contract.OtherPurpose = model.OtherPurpose;
            contract.DecideCode = model.DecideCode;
            return contract;
        }

        //get company contract english
        public CreateCompanyContractEng GetContractEng(Contract contract)
        {
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model.DecideCode = contract.DecideCode;
            model.ContractID = contract.ContractID;
            model.ContractNo = contract.ContractNo;
            model.Language = contract.Language;
            model.BranchID = contract.BranchID;
            model.TypeOfContractID = contract.TypeOfContractID;
            model.TypeOfContract = contract.TypeOfContract.TypeName;
            model.ContractDate = contract.ContractDate;
            model.ApplicationDate = contract.ApplicationDate;

            model.Cif = contract.Cif;
            model.CompanyName = contract.CompanyName;
            Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).SingleOrDefault();
            model.TypeOfCompanyID = company.TypeOfCompanyID;
            model.TypeOfCompany = company.TypeOfCompany.Name;
            model.RegistrationNo = company.RegistrationNo;
            model.RegistrationDate = company.RegistrationDate;
            model.CompanyAddress = company.CompanyAddress;
            model.CompanyTelephone = company.CompanyTelephone;
            model.CompanyEmail = company.CompanyEmail;
            //model.CompanyFax = contract.CompanyFax;
            //model.CompanyWebsite = contract.CompanyWebsite;
            model.CompanyDirector = company.CompanyDirector;
            model.CompanyPosition = company.Position;

            model.LoanAmount = contract.LoanAmount;
            model.LCBankGuarantee = contract.LCBankGuarantee;
            model.LoanCurrency = contract.LoanCurrency;
            model.LegalCurrency = contract.LegalCurrency;
            model.InterestRate = contract.InterestRate;
            model.Term = contract.Term;
            model.ProcessingFee = contract.ProcessingFee;
            model.Purpose = contract.Purpose;
            model.OtherPurpose = contract.OtherPurpose;
            model.GracePeriod = contract.GracePeriod;
            model.RepaymentPrinciple = contract.RepaymentPrinciple;
            model.RepaymentInterest = contract.RepaymentInterest;

            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listProperty.Count > 0)
            {
                PropertyView propertyView;
                foreach (Property item in listProperty)
                {
                    propertyView = new PropertyView();
                    propertyView.Ownership = item.Ownership;
                    propertyView.TitleNumber = item.TitleNumber;
                    propertyView.Pacelnumber = item.Pacelnumber;
                    propertyView.Location = item.Location;
                    propertyView.TypeOfProperty = item.TypeOfProperty;
                    propertyView.TotalSize = item.TotalSize;
                    propertyView.isSaved = true;
                    model.HypothecatedProperty.Add(propertyView);
                }
            }

            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listGuarantor.Count > 0)
            {
                GuarantorViewEng guarantorView;
                foreach (Guarantor item in listGuarantor)
                {
                    guarantorView = new GuarantorViewEng();
                    guarantorView.GuarantorName = item.GuarantorName;
                    guarantorView.Passport = item.Passport;
                    guarantorView.PassportDate = item.PassportDate;
                    guarantorView.isSaved = true;
                    model.Guarantor.Add(guarantorView);
                }
            }

            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listMortgageProperty.Count > 0)
            {
                MortgagePropertyView mortgagePropertyView;
                foreach (MortgageProperty item in listMortgageProperty)
                {
                    mortgagePropertyView = new MortgagePropertyView();
                    mortgagePropertyView.PlateNumberName = item.PlateNumberName;
                    mortgagePropertyView.PlateNumberYear = item.PlateNumberYear;
                    mortgagePropertyView.PlateChassis = item.PlateChassis;
                    mortgagePropertyView.PlateEngine = item.PlateEngine;
                    mortgagePropertyView.PlateVignette = item.PlateVignette;
                    mortgagePropertyView.IssuedByName = item.IssuedByName;
                    mortgagePropertyView.IssuedByYear = item.IssuedByYear;
                    mortgagePropertyView.IssuedByChassis = item.IssuedByChassis;
                    mortgagePropertyView.IssuedByEngine = item.IssuedByEngine;
                    mortgagePropertyView.IssuedByVignette = item.IssuedByVignette;
                    mortgagePropertyView.isSaved = true;
                    model.MortgageProperty.Add(mortgagePropertyView);
                }
            }

            List<FixDeposit> listFixDeposit = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listFixDeposit.Count > 0)
            {
                FixDepositViewEng fixDepositViewEng;
                foreach(FixDeposit item in listFixDeposit)
                {
                    fixDepositViewEng = new FixDepositViewEng();
                    fixDepositViewEng.Owner = item.Owner;
                    fixDepositViewEng.IDNumber = item.IDNumber;
                    fixDepositViewEng.OpeningDate = item.OpeningDate;
                    fixDepositViewEng.TypeOfDeposit = item.TypeOfDeposit;
                    fixDepositViewEng.isSaved = true;
                    model.FixDeposit.Add(fixDepositViewEng);
                }
            }

            model.LegalFee = contract.LegalFee;
            model.LoanWithdraw = contract.LoanWithdraw;
            model.OtherCondition = contract.OtherCondition;
            model.LoanRestrucFee = contract.LoanRestrucFee;
            model.EarlySettleFee = contract.EarlySettleFee;

            model.BankContactPerson = contract.BankContactPerson;
            model.BankContactEmail = contract.BankContactEmail;
            model.BankContactPhone = contract.BankContactPhone;
            model.BankContactPosition = contract.BankContactPosition;
            model.BorrowerContactEmail = contract.BorrowerContactEmail;
            model.BorrowerContactPerson = contract.BorrowerContactPerson;
            model.BorrowerContactPhone = contract.BorrowerContactPhone;
            model.BorrowerContactPosition = contract.BorrowerContactPosition;

            model.NumberBankKeep = contract.NumberBankKeep;
            model.NumberCustomerKeep = contract.NumberCustomerKeep;
            model.NumberOfContractEng = contract.NumberOfContractEng;
            model.NumberOfContractKH = contract.NumberOfContractKH;
            model.NumberOtherKeep = contract.NumberOtherKeep;
            model.BranchDirector = contract.BranchDirector;
            model.BranchPosition = contract.BranchPosition;
            return model;
        }

        //get company contract khmer
        public CreateCompanyContractKhmer GetContractKhmer(Contract contract)
        {
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            model.DecideCode = contract.DecideCode;
            model.ContractID = contract.ContractID;
            model.ContractNo = contract.ContractNo;
            model.Language = contract.Language;
            model.BranchID = contract.BranchID;
            model.TypeOfContractID = contract.TypeOfContractID;
            model.TypeOfContract = contract.TypeOfContract.TypeName;
            model.ContractDate = contract.ContractDate;
            model.ApplicationDate = contract.ApplicationDate;

            model.Cif = contract.Cif;
            Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).SingleOrDefault();
            model.CompanyName = contract.CompanyName;
            model.TypeOfCompanyID = company.TypeOfCompanyID;
            model.TypeOfCompany = company.TypeOfCompany.Name;
            model.RegistrationNo = company.RegistrationNo;
            model.RegistrationDate = company.RegistrationDate;
            model.CompanyAddress = company.CompanyAddress;
            model.CompanyTelephone = company.CompanyTelephone;
            model.CompanyEmail = company.CompanyEmail;
            //model.CompanyFax = contract.CompanyFax;
            //model.CompanyWebsite = contract.CompanyWebsite;
            model.CompanyDirector = company.CompanyDirector;
            model.CompanyPosition = company.Position;

            model.LoanAmount = contract.LoanAmount;
            model.LCBankGuarantee = contract.LCBankGuarantee;
            model.LoanCurrency = contract.LoanCurrency;
            model.LegalCurrency = contract.LegalCurrency;
            model.InterestRate = contract.InterestRate;
            model.Term = contract.Term;
            model.ProcessingFee = contract.ProcessingFee;
            model.Purpose = contract.Purpose;
            model.OtherPurpose = contract.OtherPurpose;
            model.GracePeriod = contract.GracePeriod;
            model.RepaymentPrinciple = contract.RepaymentPrinciple;
            model.RepaymentInterest = contract.RepaymentInterest;

            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listProperty.Count > 0)
            {
                PropertyViewKhmer propertyView;
                foreach (Property item in listProperty)
                {
                    propertyView = new PropertyViewKhmer();
                    propertyView.Ownership = item.Ownership;
                    propertyView.TitleNumber = item.TitleNumber;
                    propertyView.Pacelnumber = item.Pacelnumber;
                    propertyView.Location = item.Location;
                    propertyView.TypeOfProperty = item.TypeOfProperty;
                    propertyView.TotalSize = item.TotalSize;
                    propertyView.isSaved = true;
                    model.HypothecatedProperty.Add(propertyView);
                }
            }

            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listGuarantor.Count > 0)
            {
                GuarantorViewKhmer guarantorView;
                foreach (Guarantor item in listGuarantor)
                {
                    guarantorView = new GuarantorViewKhmer();
                    guarantorView.GuarantorName = item.GuarantorName;
                    guarantorView.Passport = item.Passport;
                    guarantorView.PassportDate = item.PassportDate;
                    guarantorView.isSaved = true;
                    model.Guarantor.Add(guarantorView);
                }
            }

            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listMortgageProperty.Count > 0)
            {
                MortgagePropertyViewKhmer mortgagePropertyView;
                foreach (MortgageProperty item in listMortgageProperty)
                {
                    mortgagePropertyView = new MortgagePropertyViewKhmer();
                    mortgagePropertyView.PlateNumberName = item.PlateNumberName;
                    mortgagePropertyView.PlateNumberYear = item.PlateNumberYear;
                    mortgagePropertyView.PlateChassis = item.PlateChassis;
                    mortgagePropertyView.PlateEngine = item.PlateEngine;
                    mortgagePropertyView.PlateVignette = item.PlateVignette;
                    mortgagePropertyView.IssuedByName = item.IssuedByName;
                    mortgagePropertyView.IssuedByYear = item.IssuedByYear;
                    mortgagePropertyView.IssuedByChassis = item.IssuedByChassis;
                    mortgagePropertyView.IssuedByEngine = item.IssuedByEngine;
                    mortgagePropertyView.IssuedByVignette = item.IssuedByVignette;
                    mortgagePropertyView.isSaved = true;
                    model.MortgageProperty.Add(mortgagePropertyView);
                }
            }

            List<FixDeposit> listFixDeposit = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            if (listFixDeposit.Count > 0)
            {
                FixDepositViewKhmer fixDepositViewEng;
                foreach (FixDeposit item in listFixDeposit)
                {
                    fixDepositViewEng = new FixDepositViewKhmer();
                    fixDepositViewEng.Owner = item.Owner;
                    fixDepositViewEng.IDNumber = item.IDNumber;
                    fixDepositViewEng.OpeningDate = item.OpeningDate;
                    fixDepositViewEng.TypeOfDeposit = item.TypeOfDeposit;
                    fixDepositViewEng.isSaved = true;
                    model.FixDeposit.Add(fixDepositViewEng);
                }
            }

            model.LegalFee = contract.LegalFee;
            model.LoanWithdraw = contract.LoanWithdraw;
            model.OtherCondition = contract.OtherCondition;
            model.LoanRestrucFee = contract.LoanRestrucFee;
            model.EarlySettleFee = contract.EarlySettleFee;

            model.BankContactPerson = contract.BankContactPerson;
            model.BankContactEmail = contract.BankContactEmail;
            model.BankContactPhone = contract.BankContactPhone;
            model.BankContactPosition = contract.BankContactPosition;
            model.BorrowerContactEmail = contract.BorrowerContactEmail;
            model.BorrowerContactPerson = contract.BorrowerContactPerson;
            model.BorrowerContactPhone = contract.BorrowerContactPhone;
            model.BorrowerContactPosition = contract.BorrowerContactPosition;

            model.NumberBankKeep = contract.NumberBankKeep;
            model.NumberCustomerKeep = contract.NumberCustomerKeep;
            model.NumberOfContractEng = contract.NumberOfContractEng;
            model.NumberOfContractKH = contract.NumberOfContractKH;
            model.NumberOtherKeep = contract.NumberOtherKeep;
            model.BranchDirector = contract.BranchDirector;
            model.BranchPosition = contract.BranchPosition;
            return model;
        }

        // GET: Contracts/Create
        public ActionResult Create()
        {
            CreateContractStep2 contractStep2 = (CreateContractStep2)Session["contractInfo"]; 
            Session["Property"] = null;
            Session["MortgageProperty"] = null;
            Session["Guarantor"] = null;
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            List<TypeOfContract> listContractType = db.TypeOfContracts.ToList();
            foreach(TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.StandFor
                });
            }
            DateTime tempDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            model.RegistrationDate = tempDate;
            model.GuarantorPassportDate = tempDate;
            model.ContractDate = DateTime.Now;
            model.ApplicationDate = DateTime.Now;
            model.Language = contractStep2.Language;
            model.BranchID = contractStep2.Branch;
            model.DecideCode = contractStep2.DecideCode;
            Decide decide = db.Decides.Where(c => c.DecideCode.Equals(contractStep2.DecideCode)).SingleOrDefault();

            Session["FixDeposit"] = null;
            model.OpeningDate = DateTime.Now;
            //model.ExpiryDate = DateTime.Now;
            
            if(!string.IsNullOrEmpty(decide.Cif))
            {
                model.Cif = decide.Cif;
                int companycount = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).Count();
                if (companycount > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).SingleOrDefault();
                    //model.CompanyAddress = company.CompanyAddress;
                    //model.CompanyDirector = company.CompanyDirector;
                    model.CompanyEmail = company.CompanyEmail;
                    //model.CompanyName = company.CompanyName;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.TypeOfCompanyID = company.TypeOfCompanyID;
                    model.CompanyPosition = company.Position;
                }
            }
            int countProperty = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).Count();
            if (countProperty > 0)
            {
                List<PropertyForDecision> _listProperty = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
                PropertyView proView;
                foreach (PropertyForDecision item in _listProperty)
                {
                    proView = new PropertyView();
                    proView.Ownership = item.Ownership;
                    proView.Pacelnumber = item.Pacelnumber;
                    proView.TitleNumber = item.TitleNumber;
                    proView.Location = item.Location;
                    proView.TypeOfProperty = item.TypeOfProperty;
                    proView.TotalSize = item.TotalSize;
                    model.HypothecatedProperty.Add(proView);
                }
                Session["Property"] = model.HypothecatedProperty;
            }
            int countGuaranty = db.Guarantors.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).Count();
            if (countGuaranty > 0)
            {
                List<Guarantor> _listGuarantor = db.Guarantors.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
                GuarantorViewEng guarantor;
                foreach (Guarantor item in _listGuarantor)
                {
                    guarantor = new GuarantorViewEng();
                    guarantor.GuarantorName = item.GuarantorName;
                    guarantor.Passport = item.Passport;
                    guarantor.PassportDate = item.PassportDate;
                    model.Guarantor.Add(guarantor);
                }
                Session["Guarantor"] = model.Guarantor;
            }
            int countMortgage = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).Count();
            if (countMortgage > 0)
            {
                List<MortgageProperty> _listMortgage = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
                MortgagePropertyView mortgage;
                foreach (MortgageProperty item in _listMortgage)
                {
                    mortgage = new MortgagePropertyView();
                    mortgage.IssuedByChassis = item.IssuedByChassis;
                    mortgage.IssuedByEngine = item.IssuedByEngine;
                    mortgage.IssuedByName = item.IssuedByName;
                    mortgage.IssuedByVignette = item.IssuedByVignette;
                    mortgage.IssuedByYear = item.IssuedByYear;
                    mortgage.PlateChassis = item.PlateChassis;
                    mortgage.PlateEngine = item.PlateEngine;
                    mortgage.PlateNumberName = item.PlateNumberName;
                    mortgage.PlateNumberYear = item.PlateNumberYear;
                    mortgage.PlateVignette = item.PlateVignette;
                    model.MortgageProperty.Add(mortgage);
                }
                Session["MortgageProperty"] = model.MortgageProperty;
            }
            model.CompanyName = decide.CustomerName;
            model.CompanyDirector = decide.Representative;
            model.CompanyAddress = decide.CustomerAddress;
            model.LoanAmount = decide.NewLoanAmount;
            model.InterestRate = decide.InterestRate;
            model.ProcessingFee = decide.ProcessingFee;
            TypeOfContract typeContract = db.TypeOfContracts.Where(c => c.TypeName.Equals(decide.TypeOfLoan)).SingleOrDefault();
            model.TypeOfContract = typeContract.TypeName;
            model.OtherCondition = decide.Condition;
            model.Purpose = decide.OtherPurpose;
            model.Term = decide.Term;
            model.LCBankGuarantee = decide.LCBankGuarantee;
                
            model.NumberOfContractEng = model.NumberOfContractKH = 4;
            model.NumberBankKeep = 2;
            model.NumberCustomerKeep = model.NumberOtherKeep = 1;
            int numberOfContract = db.Contracts.Where(c=>c.Language.Equals("English")).Count() + 1;
            model.BranchStandFor = db.Branches.Where(c => c.BranchID.Equals(contractStep2.Branch)).Select(c => c.BranchStandFor).Single();
            if (numberOfContract < 10)
                model.ContractNo = "0" + numberOfContract.ToString() + "/" + DateTime.Now.Year + "/" + typeContract.StandFor + "/" + model.BranchStandFor + "/";
            else
                model.ContractNo = numberOfContract.ToString() + "/" + DateTime.Now.Year + "/" + typeContract.StandFor + "/" + model.BranchStandFor + "/";
            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID
                });
            }
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach(TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name
                });
            }
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach(TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach(TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            List<BankPosition> listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionName,
                    Value = item.PositionName
                });
            }
            return View(model);
            
        }

        // POST: Contracts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreateCompanyContractEng model)
        {
            List<TypeOfContract> listContractType;
            List<Currency> listCurrency;
            List<TypeOfPurpose> listPurpose;
            List<TypeOfCompany> listCompany;
            List<TypeOfProperty> listProperty;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {   
                Contract contract = new Contract();
                contract = PutContractEng(model, contract);
                
                contract.BranchID = model.BranchID;
                contract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).Single();
                contract.TypeOfContractID = db.TypeOfContracts.Where(c => c.TypeName.Equals(model.TypeOfContract)).Select(c => c.ID).SingleOrDefault();

                MembershipUser user = Membership.GetUser();
                contract.inputer = user.UserName;
                contract.Status = Constances.UnAuthorised;
                //Property
                if (Session["Property"] != null)
                {
                    List<PropertyView> listHypothecatedProperty = (List<PropertyView>)Session["Property"];
                    Property property;
                    foreach (PropertyView item in listHypothecatedProperty)
                    {
                        property = new Property();
                        property.ContractNo = model.ContractNo + model.ContractNoSecond;
                        property.Language = model.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        db.Properties.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecated Property");
                    listContractType = db.TypeOfContracts.ToList();
                    listCurrency = db.Currencies.ToList();
                    //foreach (TypeOfContract item in listContractType)
                    //{
                    //    model.ContractTypeItems.Add(new SelectListItem
                    //    {
                    //        Text = item.TypeName,
                    //        Value = item.StandFor,
                    //        Selected = item.StandFor.Equals(model.TypeOfContract) ? true : false
                    //    });
                    //}
                    
                    foreach (Currency item in listCurrency)
                    {
                        model.CurrencyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.LoanCurrency) ? true : false
                        });
                    }
                    listPurpose = db.TypeOfPurposes.ToList();
                    //foreach (TypeOfPurpose item in listPurpose)
                    //{
                    //    model.PurposeTypeItems.Add(new SelectListItem
                    //    {
                    //        Text = item.Name,
                    //        Value = item.Name,
                    //        Selected = item.Name.Equals(model.Purpose) ? true : false
                    //    });
                    //}
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyTypeItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                        });
                    }
                    listProperty = db.TypeOfProperties.ToList();
                    foreach (TypeOfProperty item in listProperty)
                    {
                        model.PropertyTypeItems.Add(new SelectListItem
                        {
                            Text = item.PropertyName,
                            Value = item.PropertyName
                        });
                    }
                    listBankPosition = db.BankPositions.ToList();
                    foreach (BankPosition item in listBankPosition)
                    {
                        model.BranchPositionItems.Add(new SelectListItem
                        {
                            Text = item.PositionName,
                            Value = item.PositionName,
                            Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                        });
                    }

                    if (Session["MortgageProperty"] != null)
                    {
                        model.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
                    }
                    if (Session["Guarantor"] != null)
                        model.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
                    return View(model);
                }
                Session["Property"] = null;

                if (Session["Guarantor"] != null)
                {
                    List<GuarantorViewEng> listGuarantor = (List<GuarantorViewEng>)Session["Guarantor"];
                    Guarantor guarantor;
                    foreach (GuarantorViewEng item in listGuarantor)
                    {
                        guarantor = new Guarantor();
                        guarantor.GuarantorName = item.GuarantorName;
                        guarantor.Passport = item.Passport;
                        guarantor.PassportDate = item.PassportDate;
                        guarantor.ContractNo = model.ContractNo + model.ContractNoSecond;
                        guarantor.Language = model.Language;
                        guarantor.isLoanContract = false;
                        db.Guarantors.Add(guarantor);
                        db.SaveChanges();                       
                    }
                }
                Session["Guarantor"] = null;

                if (Session["MortgageProperty"] != null)
                {
                    List<MortgagePropertyView> listMortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
                    MortgageProperty mortgageProperty;
                    foreach (MortgagePropertyView item in listMortgageProperty)
                    {
                        mortgageProperty = new MortgageProperty();
                        mortgageProperty.ContractNo = model.ContractNo + model.ContractNoSecond;
                        mortgageProperty.Language = model.Language;
                        mortgageProperty.PlateNumberName = item.PlateNumberName;
                        mortgageProperty.IssuedByName = item.IssuedByName;
                        mortgageProperty.PlateNumberYear = item.PlateNumberYear;
                        mortgageProperty.IssuedByYear = item.IssuedByYear;
                        mortgageProperty.PlateChassis = item.PlateChassis;
                        mortgageProperty.IssuedByChassis = item.IssuedByChassis;
                        mortgageProperty.PlateEngine = item.PlateEngine;
                        mortgageProperty.IssuedByEngine = item.IssuedByEngine;
                        mortgageProperty.PlateVignette = item.PlateVignette;
                        mortgageProperty.IssuedByVignette = item.IssuedByVignette;
                        mortgageProperty.isLoanContract = false;
                        db.MortgageProperties.Add(mortgageProperty);
                        db.SaveChanges();
                    }
                }
                Session["MortgageProperty"] = null;
               

                if (Session["FixDeposit"] != null)
                {
                    List<FixDepositViewEng> listFixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];
                    FixDeposit fixDeposit;
                    foreach(FixDepositViewEng item in listFixDeposit)
                    {
                        fixDeposit = new FixDeposit();
                        fixDeposit.ContractNo = model.ContractNo + model.ContractNoSecond;
                        fixDeposit.Language = model.Language;
                        fixDeposit.Owner = item.Owner;
                        fixDeposit.IDNumber = item.IDNumber;
                        fixDeposit.OpeningDate = item.OpeningDate;
                        fixDeposit.TypeOfDeposit = item.TypeOfDeposit;
                        db.FixDeposits.Add(fixDeposit);
                        db.SaveChanges();
                    }
                }
                Session["FixDeposit"] = null;
                
                db.Contracts.Add(contract);
                db.SaveChanges();

                Company company = new Company();
                if (model.flagCompany == false)
                {
                    company.Cif = model.Cif;
                    int count = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).Count();
                    if (count <= 0)
                    {
                        company.CompanyName = model.CompanyName;
                        company.RegistrationNo = model.RegistrationNo;
                        company.RegistrationDate = model.RegistrationDate;
                        company.TypeOfCompanyID = model.TypeOfCompanyID;
                        company.CompanyAddress = model.CompanyAddress;
                        company.CompanyTelephone = model.CompanyTelephone;
                        company.CompanyEmail = model.CompanyEmail;
                        company.CompanyDirector = model.CompanyDirector;
                        company.Position = model.CompanyPosition;
                        company.Language = "English";
                        db.Companies.Add(company);
                        db.SaveChanges();
                    }
                }

                //CreateDocumentContractDraft(contract);
                return RedirectToAction("UnAutCompany");
                
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listContractType = db.TypeOfContracts.ToList();
            listCurrency = db.Currencies.ToList();
            //foreach (TypeOfContract item in listContractType)
            //{
            //    model.ContractTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.TypeName,
            //        Value = item.StandFor,
            //        Selected = item.StandFor.Equals(model.TypeOfContract) ? true : false
            //    });
            //}

            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.LoanCurrency) ? true : false
                });
            }
            listPurpose = db.TypeOfPurposes.ToList();
            //foreach (TypeOfPurpose item in listPurpose)
            //{
            //    model.PurposeTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.Name,
            //        Value = item.Name,
            //        Selected = item.Name.Equals(model.Purpose) ? true : false
            //    });
            //}
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                });
            }
            listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }

            listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionName,
                    Value = item.PositionName,
                    Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                });
            }

            if (Session["Property"] != null)
            {
                model.HypothecatedProperty = (List<PropertyView>)Session["Property"];
            }
            if (Session["MortgageProperty"]!=null)
            {
                model.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
            }
            if (Session["Guarantor"] != null)
                model.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
            if (Session["FixDeposit"] != null)
                model.FixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];

            return View(model);
        }

        // GET: Contracts/CreateKhmer
        public ActionResult CreateKhmer()
        {
            CreateContractStep2 contractStep2 = (CreateContractStep2)Session["contractInfo"];
            Session["PropertyKhmer"] = null;
            Session["MortgagePropertyKhmer"] = null;
            Session["GuarantorKhmer"] = null;
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            DateTime tempDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            model.RegistrationDate = tempDate;
            model.GuarantorPassportDate = tempDate;
            model.ContractDate = DateTime.Now;
            model.ApplicationDate = DateTime.Now;
            model.Language = contractStep2.Language;
            model.BranchID = contractStep2.Branch;
            model.DecideCode = contractStep2.DecideCode;

            Session["FixDepositKhmer"] = null;
            model.OpeningDate = DateTime.Now;
            //model.ExpiryDate = DateTime.Now;

            Decide decide = db.Decides.Where(c => c.DecideCode.Equals(contractStep2.DecideCode)).SingleOrDefault();
            if (!string.IsNullOrEmpty(decide.Cif))
            {
                model.Cif = decide.Cif;
                int companycount = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).Count();
                if (companycount > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).SingleOrDefault();
                    //model.CompanyAddress = company.CompanyAddress;
                    //model.CompanyDirector = company.CompanyDirector;
                    model.CompanyEmail = company.CompanyEmail;
                    //model.CompanyName = company.CompanyName;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.TypeOfCompanyID = company.TypeOfCompanyID;
                    model.CompanyPosition = company.Position;
                }
            }

            model.CompanyName = decide.CustomerName;
            model.CompanyDirector = decide.Representative;
            model.CompanyAddress = decide.CustomerAddress;
            model.LoanAmount = decide.NewLoanAmount;
            model.InterestRate = decide.InterestRate;
            model.ProcessingFee = decide.ProcessingFee;
            TypeOfContract typeContract = db.TypeOfContracts.Where(c => c.TypeName.Equals(decide.TypeOfLoan)).SingleOrDefault();
            model.TypeOfContract = typeContract.TypeName;
            model.OtherCondition = decide.Condition;
            model.Purpose = decide.OtherPurpose;
            model.Term = decide.Term;
            model.LCBankGuarantee = decide.LCBankGuarantee;

            model.NumberOfContractEng = model.NumberOfContractKH = 4;
            model.NumberBankKeep = 2;
            model.NumberCustomerKeep = model.NumberOtherKeep = 1;
            int numberOfContract = db.Contracts.Where(c=>c.Language.Equals("Khmer")).Count() + 1;
            model.BranchStandFor = db.Branches.Where(c => c.BranchID.Equals(contractStep2.Branch)).Select(c => c.BranchStandFor).Single();
            if (numberOfContract < 10)
                model.ContractNo = "0" + numberOfContract.ToString() + "/" + DateTime.Now.Year + "/" + typeContract.StandFor + "/" + model.BranchStandFor + "/";
            else
                model.numberOfContract = numberOfContract.ToString() + "/" + DateTime.Now.Year + "/" + typeContract.StandFor + "/" + model.BranchStandFor + "/";
            List<TypeOfContract> listContractType = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeNameKhmer,
                    Value = item.StandFor
                });
            }
            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID
                });
            }
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.NameForKhmer,
                    Value = item.NameForKhmer
                });
            }
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString()
                });
            }
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyNameKhmer,
                    Value = item.PropertyNameKhmer
                });
            }
            List<BankPosition> listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionNameKhmer,
                    Value = item.PositionNameKhmer
                });
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateKhmer(CreateCompanyContractKhmer model)
        {
            List<TypeOfContract> listContractType;
            List<Currency> listCurrency;
            List<TypeOfPurpose> listPurpose;
            List<TypeOfCompany> listCompany;
            List<TypeOfProperty> listProperty;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {
                Contract contract = new Contract();
                contract = PutContractKhmer(model, contract);

                contract.BranchID = model.BranchID;
                contract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).Single();
                contract.TypeOfContractID = db.TypeOfContracts.Where(c => c.TypeName.Equals(model.TypeOfContract)).Select(c => c.ID).SingleOrDefault();

                MembershipUser user = Membership.GetUser();
                contract.inputer = user.UserName;
                contract.Status = Constances.UnAuthorised;
                //Property
                if (Session["PropertyKhmer"] != null)
                {
                    List<PropertyViewKhmer> listHypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    Property property;
                    foreach (PropertyViewKhmer item in listHypothecatedProperty)
                    {
                        property = new Property();
                        property.ContractNo = model.ContractNo + model.ContractNoSecond;
                        property.Language = model.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        db.Properties.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecated Property");
                    listContractType = db.TypeOfContracts.ToList();
                    listCurrency = db.Currencies.ToList();
                    //foreach (TypeOfContract item in listContractType)
                    //{
                    //    model.ContractTypeItems.Add(new SelectListItem
                    //    {
                    //        Text = item.TypeNameKhmer,
                    //        Value = item.StandFor,
                    //        Selected = item.StandFor.Equals(model.TypeOfContract) ? true : false
                    //    });
                    //}

                    foreach (Currency item in listCurrency)
                    {
                        model.CurrencyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.LoanCurrency) ? true : false
                        });
                    }
                    listPurpose = db.TypeOfPurposes.ToList();
                    //foreach (TypeOfPurpose item in listPurpose)
                    //{
                    //    model.PurposeTypeItems.Add(new SelectListItem
                    //    {
                    //        Text = item.NameForKhmer,
                    //        Value = item.NameForKhmer,
                    //        Selected = item.NameForKhmer.Equals(model.Purpose) ? true : false
                    //    });
                    //}
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyTypeItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                        });
                    }
                    listProperty = db.TypeOfProperties.ToList();
                    foreach (TypeOfProperty item in listProperty)
                    {
                        model.PropertyTypeItems.Add(new SelectListItem
                        {
                            Text = item.PropertyNameKhmer,
                            Value = item.PropertyNameKhmer
                        });
                    }
                    listBankPosition = db.BankPositions.ToList();
                    foreach (BankPosition item in listBankPosition)
                    {
                        model.BranchPositionItems.Add(new SelectListItem
                        {
                            Text = item.PositionNameKhmer,
                            Value = item.PositionNameKhmer,
                            Selected = item.PositionNameKhmer.Equals(model.BranchPosition) ? true : false
                        });
                    }

                    if (Session["MortgagePropertyKhmer"] != null)
                    {
                        model.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
                    }
                    if (Session["GuarantorKhmer"] != null)
                        model.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
                    return View(model);
                }
                Session["PropertyKhmer"] = null;

                if (Session["GuarantorKhmer"] != null)
                {
                    List<GuarantorViewKhmer> listGuarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
                    Guarantor guarantor;
                    foreach (GuarantorViewKhmer item in listGuarantor)
                    {
                        guarantor = new Guarantor();
                        guarantor.GuarantorName = item.GuarantorName;
                        guarantor.Passport = item.Passport;
                        guarantor.PassportDate = item.PassportDate;
                        guarantor.ContractNo = model.ContractNo + model.ContractNoSecond;
                        guarantor.Language = model.Language;
                        guarantor.isLoanContract = false;
                        db.Guarantors.Add(guarantor);
                        db.SaveChanges();
                    }
                }
                Session["GuarantorKhmer"] = null;

                if (Session["MortgagePropertyKhmer"] != null)
                {
                    List<MortgagePropertyViewKhmer> listMortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
                    MortgageProperty mortgageProperty;
                    foreach (MortgagePropertyViewKhmer item in listMortgageProperty)
                    {
                        mortgageProperty = new MortgageProperty();
                        mortgageProperty.ContractNo = model.ContractNo + model.ContractNoSecond;
                        mortgageProperty.Language = model.Language;
                        mortgageProperty.PlateNumberName = item.PlateNumberName;
                        mortgageProperty.IssuedByName = item.IssuedByName;
                        mortgageProperty.PlateNumberYear = item.PlateNumberYear;
                        mortgageProperty.IssuedByYear = item.IssuedByYear;
                        mortgageProperty.PlateChassis = item.PlateChassis;
                        mortgageProperty.IssuedByChassis = item.IssuedByChassis;
                        mortgageProperty.PlateEngine = item.PlateEngine;
                        mortgageProperty.IssuedByEngine = item.IssuedByEngine;
                        mortgageProperty.PlateVignette = item.PlateVignette;
                        mortgageProperty.IssuedByVignette = item.IssuedByVignette;
                        mortgageProperty.isLoanContract = false;
                        db.MortgageProperties.Add(mortgageProperty);
                        db.SaveChanges();
                    }
                }
                Session["MortgagePropertyKhmer"] = null;

                if (Session["FixDepositKhmer"] != null)
                {
                    List<FixDepositViewKhmer> listFixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];
                    FixDeposit fixDeposit;
                    foreach (FixDepositViewKhmer item in listFixDeposit)
                    {
                        fixDeposit = new FixDeposit();
                        fixDeposit.ContractNo = model.ContractNo + model.ContractNoSecond;
                        fixDeposit.Language = model.Language;
                        fixDeposit.Owner = item.Owner;
                        fixDeposit.IDNumber = item.IDNumber;
                        fixDeposit.OpeningDate = item.OpeningDate;
                        fixDeposit.TypeOfDeposit = item.TypeOfDeposit;
                        db.FixDeposits.Add(fixDeposit);
                        db.SaveChanges();
                    }
                }
                Session["FixDepositKhmer"] = null;

                db.Contracts.Add(contract);
                db.SaveChanges();

                Company company = new Company();
                if (model.flagCompany == false)
                {
                    int count = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).Count();
                    if (count <= 0)
                    {
                        company.Cif = model.Cif;
                        company.CompanyName = model.CompanyName;
                        company.RegistrationNo = model.RegistrationNo;
                        company.RegistrationDate = model.RegistrationDate;
                        company.TypeOfCompanyID = model.TypeOfCompanyID;
                        company.CompanyAddress = model.CompanyAddress;
                        company.CompanyTelephone = model.CompanyTelephone;
                        company.CompanyEmail = model.CompanyDirector;
                        company.CompanyDirector = model.CompanyDirector;
                        company.Position = model.CompanyPosition;
                        company.Language = "Khmer";
                        db.Companies.Add(company);
                        db.SaveChanges();
                    }
                }

                //CreateDocumentContractDraft(contract);
                return RedirectToAction("UnAutCompany");
                
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");
            
            if (Session["PropertyKhmer"] != null)
            {
                model.HypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            }
            if (Session["MortgagePropertyKhmer"] != null)
            {
                model.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
            }
            if (Session["GuarantorKhmer"] != null)
                model.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
            if (Session["FixDepositKhmer"] != null)
                model.FixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];

            listContractType = db.TypeOfContracts.ToList();
            listCurrency = db.Currencies.ToList();
            //foreach (TypeOfContract item in listContractType)
            //{
            //    model.ContractTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.TypeNameKhmer,
            //        Value = item.StandFor,
            //        Selected = item.StandFor.Equals(model.TypeOfContract) ? true : false
            //    });
            //}

            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.LoanCurrency) ? true : false
                });
            }
            listPurpose = db.TypeOfPurposes.ToList();
            //foreach (TypeOfPurpose item in listPurpose)
            //{
            //    model.PurposeTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.NameForKhmer,
            //        Value = item.NameForKhmer,
            //        Selected = item.NameForKhmer.Equals(model.Purpose) ? true : false
            //    });
            //}
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                });
            }
            listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyNameKhmer,
                    Value = item.PropertyNameKhmer
                });
            }
            listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionNameKhmer,
                    Value = item.PositionNameKhmer,
                    Selected = item.PositionNameKhmer.Equals(model.BranchPosition) ? true : false
                });
            }
            return View(model);
        }

        // GET: Contracts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model = GetContractEng(contract);
            model.ContractNoSecond = "temp";
            model.GuarantorPassportDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
			
            Session["Property"] = model.HypothecatedProperty;
            Session["MortgageProperty"] = model.MortgageProperty;
            Session["Guarantor"] = model.Guarantor;
            Session["FixDeposit"] = model.FixDeposit;
			
            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                });
            }
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name,
                    Selected = (item.Name.Equals(model.Purpose)) ? true: false
                });
            }
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true: false
                });
            }
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            List<BankPosition> listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionName,
                    Value = item.PositionName,
                    Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                });
            }
            return View(model);
        }

        // POST: Contracts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CreateCompanyContractEng model)
        {
            List<Currency> listCurrency;
            List<TypeOfPurpose> listPurpose;
            List<TypeOfCompany> listCompany;
            List<TypeOfProperty> listProperty;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {
                Contract contract = db.Contracts.Find(model.ContractID);
                model.ContractNoSecond = "";
                contract = PutContractEng(model, contract);

                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals(contract.Language)).SingleOrDefault();
                company.CompanyName = model.CompanyName;
                company.RegistrationNo = model.RegistrationNo;
                company.RegistrationDate = model.RegistrationDate;
                company.TypeOfCompanyID = model.TypeOfCompanyID;
                company.CompanyAddress = model.CompanyAddress;
                company.CompanyTelephone = model.CompanyTelephone;
                company.CompanyEmail = model.CompanyEmail;
                company.CompanyDirector = model.CompanyDirector;
                company.Position = model.CompanyPosition;
                db.Entry(company).State = EntityState.Modified;
                db.SaveChanges();

                MembershipUser user = Membership.GetUser();
                contract.inputer = user.UserName;
                if (!string.IsNullOrEmpty(contract.FileName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName.Replace(".pdf",".docx")));
                    contract.FileName = "";
                }

                if (!string.IsNullOrEmpty(contract.FileNameDraft))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft.Replace(".pdf", ".docx")));
                    contract.FileNameDraft = "";
                }

                if (!string.IsNullOrEmpty(contract.FileGeneralName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName.Replace(".pdf", ".docx")));
                    contract.FileGeneralName = "";
                }
                //Property
                List<Property> listPropertyOld = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
                foreach (Property item in listPropertyOld)
                {
                    db.Properties.Remove(item);
                }

                if (Session["Property"] != null)
                {
                    List<PropertyView> _listProperty = (List<PropertyView>)Session["Property"];
                    Property property;
                    foreach (PropertyView item in _listProperty)
                    {
                        property = new Property();
                        property.ContractNo = model.ContractNo;
                        property.Language = model.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TotalSize = item.TotalSize;
                        property.TypeOfProperty = item.TypeOfProperty;
                        db.Properties.Add(property);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecated Property");
                    listCurrency = db.Currencies.ToList();
                    foreach (Currency item in listCurrency)
                    {
                        model.CurrencyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                        });
                    }
                    listPurpose = db.TypeOfPurposes.ToList();
                    foreach (TypeOfPurpose item in listPurpose)
                    {
                        model.PurposeTypeItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.Name,
                            Selected = (item.Name.Equals(model.Purpose)) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyTypeItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                        });
                    }
                    listProperty = db.TypeOfProperties.ToList();
                    foreach (TypeOfProperty item in listProperty)
                    {
                        model.PropertyTypeItems.Add(new SelectListItem
                        {
                            Text = item.PropertyName,
                            Value = item.PropertyName
                        });
                    }
                    listBankPosition = db.BankPositions.ToList();
                    foreach (BankPosition item in listBankPosition)
                    {
                        model.BranchPositionItems.Add(new SelectListItem
                        {
                            Text = item.PositionName,
                            Value = item.PositionName,
                            Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                        });
                    }

                    if (Session["MortgageProperty"] != null)
                    {
                        model.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
                    }
                    if (Session["Guarantor"] != null)
                        model.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
                    return View(model);
                }
				
				
				
				
				
                Session["Property"] = null;

                List<MortgageProperty> _listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
                foreach(MortgageProperty item in _listMortgageProperty)
                {
                    db.MortgageProperties.Remove(item);
                }

                if (Session["MortgageProperty"] != null)
                {
                    List<MortgagePropertyView> listMortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
                    MortgageProperty mortgageProperty;
                    foreach (MortgagePropertyView item in listMortgageProperty)
                    {
                        mortgageProperty = new MortgageProperty();
                        mortgageProperty.ContractNo = model.ContractNo;
                        mortgageProperty.Language = model.Language;
                        mortgageProperty.PlateNumberName = item.PlateNumberName;
                        mortgageProperty.IssuedByName = item.IssuedByName;
                        mortgageProperty.PlateNumberYear = item.PlateNumberYear;
                        mortgageProperty.IssuedByYear = item.IssuedByYear;
                        mortgageProperty.PlateChassis = item.PlateChassis;
                        mortgageProperty.IssuedByChassis = item.IssuedByChassis;
                        mortgageProperty.PlateEngine = item.PlateEngine;
                        mortgageProperty.IssuedByEngine = item.IssuedByEngine;
                        mortgageProperty.PlateVignette = item.PlateVignette;
                        mortgageProperty.IssuedByVignette = item.IssuedByVignette;

                        db.MortgageProperties.Add(mortgageProperty);
                    }
                }
                Session["MortgageProperty"] = null;

                List<Guarantor> listGuarantorOld = db.Guarantors.Where(c => c.ContractNo.Equals(model.ContractNo) && c.Language.Equals(model.Language)).ToList();
                foreach (Guarantor item in listGuarantorOld)
                {
                    db.Guarantors.Remove(item);
                }

                if (Session["Guarantor"] != null)
                {
                    List<GuarantorViewEng> listGuarantor = (List<GuarantorViewEng>)Session["Guarantor"];
                    Guarantor guarantor;
                    foreach (GuarantorViewEng item in listGuarantor)
                    {
                        guarantor = new Guarantor();
                        guarantor.GuarantorName = item.GuarantorName;
                        guarantor.Passport = item.Passport;
                        guarantor.PassportDate = item.PassportDate;
                        guarantor.ContractNo = model.ContractNo + model.ContractNoSecond;
                        guarantor.Language = model.Language;
                        db.Guarantors.Add(guarantor);
                    }
                }
                
                Session["Guarantor"] = null;

                List<FixDeposit> listFixOld = db.FixDeposits.Where(c => c.ContractNo.Equals(model.ContractNo) && c.Language.Equals(model.Language)).ToList();
                foreach(FixDeposit item in listFixOld)
                {
                    db.FixDeposits.Remove(item);
                }
                if (Session["FixDeposit"] != null)
                {
                    List<FixDepositViewEng> listFixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];
                    FixDeposit fixDeposit;
                    foreach (FixDepositViewEng item in listFixDeposit)
                    {
                        fixDeposit = new FixDeposit();
                        fixDeposit.ContractNo = model.ContractNo + model.ContractNoSecond;
                        fixDeposit.Language = model.Language;
                        fixDeposit.Owner = item.Owner;
                        fixDeposit.IDNumber = item.IDNumber;
                        fixDeposit.OpeningDate = item.OpeningDate;
                        fixDeposit.TypeOfDeposit = item.TypeOfDeposit;
                        db.FixDeposits.Add(fixDeposit);
                        db.SaveChanges();
                    }
                }
                Session["FixDeposit"] = null;

                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();

                //CreateDocumentContractDraft(contract);
                return RedirectToAction("UnAutCompany");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            if (Session["Property"] != null)
            {
                model.HypothecatedProperty = (List<PropertyView>)Session["Property"];
            }
            if (Session["MortgageProperty"] != null)
            {
                model.MortgageProperty = (List<MortgagePropertyView>)Session["MortgageProperty"];
            }
            if (Session["Guarantor"] != null)
                model.Guarantor = (List<GuarantorViewEng>)Session["Guarantor"];
            if (Session["FixDeposit"] != null)
                model.FixDeposit = (List<FixDepositViewEng>)Session["FixDeposit"];

            listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                });
            }
            listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name,
                    Selected = (item.Name.Equals(model.Purpose)) ? true : false
                });
            }
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                });
            }
            listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionName,
                    Value = item.PositionName,
                    Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                });
            }
            return View(model);
        }

        // GET: Contracts/EditKhmer
        public ActionResult EditKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            model = GetContractKhmer(contract);
            model.ContractNoSecond = "temp";
            Session["PropertyKhmer"] = model.HypothecatedProperty;
            Session["MortgagePropertyKhmer"] = model.MortgageProperty;
            Session["GuarantorKhmer"] = model.Guarantor;
            Session["FixDepositKhmer"] = model.FixDeposit;
            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                });
            }
            //List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            //foreach (TypeOfPurpose item in listPurpose)
            //{
            //    model.PurposeTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.NameForKhmer,
            //        Value = item.NameForKhmer,
            //        Selected = (item.NameForKhmer.Equals(model.Purpose)) ? true : false
            //    });
            //}
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                });
            }
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyNameKhmer,
                    Value = item.PropertyNameKhmer
                });
            }
            List<BankPosition> listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionNameKhmer,
                    Value = item.PositionNameKhmer,
                    Selected = item.PositionNameKhmer.Equals(model.BranchPosition) ? true : false
                });
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditKhmer(CreateCompanyContractKhmer model)
        {
            List<Currency> listCurrency;
            List<TypeOfPurpose> listPurpose;
            List<TypeOfCompany> listCompany;
            List<TypeOfProperty> listProperty;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {
                Contract contract = db.Contracts.Find(model.ContractID);
                model.ContractNoSecond = "";
                contract = PutContractKhmer(model, contract);

                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals(contract.Language)).SingleOrDefault();
                company.CompanyName = model.CompanyName;
                company.RegistrationNo = model.RegistrationNo;
                company.RegistrationDate = model.RegistrationDate;
                company.TypeOfCompanyID = model.TypeOfCompanyID;
                company.CompanyAddress = model.CompanyAddress;
                company.CompanyTelephone = model.CompanyTelephone;
                company.CompanyEmail = model.CompanyEmail;
                company.CompanyDirector = model.CompanyDirector;
                company.Position = model.CompanyPosition;
                db.Entry(company).State = EntityState.Modified;
                db.SaveChanges();

                MembershipUser user = Membership.GetUser();
                contract.inputer = user.UserName;
                if (!string.IsNullOrEmpty(contract.FileName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName.Replace(".pdf", ".docx")));
                    contract.FileName = "";
                }

                if (!string.IsNullOrEmpty(contract.FileNameDraft))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft.Replace(".pdf", ".docx")));
                    contract.FileNameDraft = "";
                }

                if (!string.IsNullOrEmpty(contract.FileGeneralName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName.Replace(".pdf", ".docx")));
                    contract.FileGeneralName = "";
                }
                //Property
                List<Property> listPropertyOld = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
                foreach (Property item in listPropertyOld)
                {
                    db.Properties.Remove(item);
                }

                if (Session["PropertyKhmer"] != null)
                {
                    List<PropertyViewKhmer> _listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    Property property;
                    foreach (PropertyViewKhmer item in _listProperty)
                    {
                        property = new Property();
                        property.ContractNo = model.ContractNo;
                        property.Language = model.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TotalSize = item.TotalSize;
                        property.TypeOfProperty = item.TypeOfProperty;
                        db.Properties.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecated Property");
                    listCurrency = db.Currencies.ToList();
                    foreach (Currency item in listCurrency)
                    {
                        model.CurrencyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                        });
                    }
                    //listPurpose = db.TypeOfPurposes.ToList();
                    //foreach (TypeOfPurpose item in listPurpose)
                    //{
                    //    model.PurposeTypeItems.Add(new SelectListItem
                    //    {
                    //        Text = item.NameForKhmer,
                    //        Value = item.NameForKhmer,
                    //        Selected = (item.NameForKhmer.Equals(model.Purpose)) ? true : false
                    //    });
                    //}
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyTypeItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                        });
                    }
                    listProperty = db.TypeOfProperties.ToList();
                    foreach (TypeOfProperty item in listProperty)
                    {
                        model.PropertyTypeItems.Add(new SelectListItem
                        {
                            Text = item.PropertyNameKhmer,
                            Value = item.PropertyNameKhmer
                        });
                    }
                    listBankPosition = db.BankPositions.ToList();
                    foreach (BankPosition item in listBankPosition)
                    {
                        model.BranchPositionItems.Add(new SelectListItem
                        {
                            Text = item.PositionNameKhmer,
                            Value = item.PositionNameKhmer,
                            Selected = item.PositionNameKhmer.Equals(model.BranchPosition) ? true : false
                        });
                    }
                    if (Session["MortgagePropertyKhmer"] != null)
                    {
                        model.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
                    }
                    if (Session["GuarantorKhmer"] != null)
                        model.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
                    return View(model);
                }
                Session["PropertyKhmer"] = null;

                List<MortgageProperty> _listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
                foreach (MortgageProperty item in _listMortgageProperty)
                {
                    db.MortgageProperties.Remove(item);
                }

                if (Session["MortgagePropertyKhmer"] != null)
                {
                    List<MortgagePropertyViewKhmer> listMortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
                    MortgageProperty mortgageProperty;
                    foreach (MortgagePropertyViewKhmer item in listMortgageProperty)
                    {
                        mortgageProperty = new MortgageProperty();
                        mortgageProperty.ContractNo = model.ContractNo;
                        mortgageProperty.Language = model.Language;
                        mortgageProperty.PlateNumberName = item.PlateNumberName;
                        mortgageProperty.IssuedByName = item.IssuedByName;
                        mortgageProperty.PlateNumberYear = item.PlateNumberYear;
                        mortgageProperty.IssuedByYear = item.IssuedByYear;
                        mortgageProperty.PlateChassis = item.PlateChassis;
                        mortgageProperty.IssuedByChassis = item.IssuedByChassis;
                        mortgageProperty.PlateEngine = item.PlateEngine;
                        mortgageProperty.IssuedByEngine = item.IssuedByEngine;
                        mortgageProperty.PlateVignette = item.PlateVignette;
                        mortgageProperty.IssuedByVignette = item.IssuedByVignette;
                        db.MortgageProperties.Add(mortgageProperty);
                        db.SaveChanges();
                    }
                }
                Session["MortgagePropertyKhmer"] = null;

                List<Guarantor> listGuarantorOld = db.Guarantors.Where(c => c.ContractNo.Equals(model.ContractNo) && c.Language.Equals(model.Language)).ToList();
                foreach (Guarantor item in listGuarantorOld)
                {
                    db.Guarantors.Remove(item);
                }

                if (Session["GuarantorKhmer"] != null)
                {
                    List<GuarantorViewKhmer> listGuarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
                    Guarantor guarantor;
                    foreach (GuarantorViewKhmer item in listGuarantor)
                    {
                        guarantor = new Guarantor();
                        guarantor.GuarantorName = item.GuarantorName;
                        guarantor.Passport = item.Passport;
                        guarantor.PassportDate = item.PassportDate;
                        guarantor.ContractNo = model.ContractNo + model.ContractNoSecond;
                        guarantor.Language = model.Language;
                        db.Guarantors.Add(guarantor);
                        db.SaveChanges();
                    }
                }
                
                Session["GuarantorKhmer"] = null;

                List<FixDeposit> listFixOld = db.FixDeposits.Where(c => c.ContractNo.Equals(model.ContractNo) && c.Language.Equals(model.Language)).ToList();
                foreach (FixDeposit item in listFixOld)
                {
                    db.FixDeposits.Remove(item);
                }
                if (Session["FixDepositKhmer"] != null)
                {
                    List<FixDepositViewKhmer> listFixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];
                    FixDeposit fixDeposit;
                    foreach (FixDepositViewKhmer item in listFixDeposit)
                    {
                        fixDeposit = new FixDeposit();
                        fixDeposit.ContractNo = model.ContractNo + model.ContractNoSecond;
                        fixDeposit.Language = model.Language;
                        fixDeposit.Owner = item.Owner;
                        fixDeposit.IDNumber = item.IDNumber;
                        fixDeposit.OpeningDate = item.OpeningDate;
                        fixDeposit.TypeOfDeposit = item.TypeOfDeposit;
                        db.FixDeposits.Add(fixDeposit);
                        db.SaveChanges();
                    }
                }
                Session["FixDepositKhmer"] = null;

                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();

                //CreateDocumentContractDraft(contract);
                return RedirectToAction("UnAutCompany");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            if (Session["PropertyKhmer"] != null)
            {
                model.HypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            }
            if (Session["MortgagePropertyKhmer"] != null)
            {
                model.MortgageProperty = (List<MortgagePropertyViewKhmer>)Session["MortgagePropertyKhmer"];
            }
            if (Session["GuarantorKhmer"] != null)
                model.Guarantor = (List<GuarantorViewKhmer>)Session["GuarantorKhmer"];
            if (Session["FixDepositKhmer"] != null)
                model.FixDeposit = (List<FixDepositViewKhmer>)Session["FixDepositKhmer"];

            listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.LoanCurrency)) ? true : false
                });
            }
            listPurpose = db.TypeOfPurposes.ToList();
            //foreach (TypeOfPurpose item in listPurpose)
            //{
            //    model.PurposeTypeItems.Add(new SelectListItem
            //    {
            //        Text = item.NameForKhmer,
            //        Value = item.NameForKhmer,
            //        Selected = (item.NameForKhmer.Equals(model.Purpose)) ? true : false
            //    });
            //}
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyTypeItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = (item.ID == model.TypeOfCompanyID) ? true : false
                });
            }
            listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyNameKhmer,
                    Value = item.PropertyNameKhmer
                });
            }
            listBankPosition = db.BankPositions.ToList();
            foreach (BankPosition item in listBankPosition)
            {
                model.BranchPositionItems.Add(new SelectListItem
                {
                    Text = item.PositionNameKhmer,
                    Value = item.PositionNameKhmer,
                    Selected = item.PositionNameKhmer.Equals(model.BranchPosition) ? true : false
                });
            }
            return View(model);
        }

        // GET: Contracts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model = GetContractEng(contract);
            return View(model);
        }

        // POST: Contracts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach(Property item in listProperty)
            {
                db.Properties.Remove(item);
            }
            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach(MortgageProperty item in listMortgageProperty)
            {
                db.MortgageProperties.Remove(item);
            }
            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach (Guarantor item in listGuarantor)
            {
                db.Guarantors.Remove(item);
            }
            List<FixDeposit> listFix = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach(FixDeposit item in listFix)
            {
                db.FixDeposits.Remove(item);
            }
            db.Contracts.Remove(contract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DeleteKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            model = GetContractKhmer(contract);
            return View(model);
        }

        [HttpPost, ActionName("DeleteKhmer")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteKhmerConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach (Property item in listProperty)
            {
                db.Properties.Remove(item);
            }
            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach (MortgageProperty item in listMortgageProperty)
            {
                db.MortgageProperties.Remove(item);
            }
            List<FixDeposit> listFix = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) && c.Language.Equals(contract.Language)).ToList();
            foreach (FixDeposit item in listFix)
            {
                db.FixDeposits.Remove(item);
            }
            db.Contracts.Remove(contract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult UnAutCompany()
        {
            SearchContract model = new SearchContract();
            MembershipUser user = Membership.GetUser();
            ProfileBase profile = ProfileBase.Create(user.UserName);
            string branchId = (string)profile.GetPropertyValue("BranchId");
            if (branchId.Equals("KH0010001"))
            {
                model.listContractEng = db.Contracts.Where(c => c.Language.Equals("English") && c.Status == Constances.UnAuthorised)
                                            .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                            .OrderByDescending(c => c.ContractDate).ToList();
                model.listContractKhmer = db.Contracts.Where(c => c.Language.Equals("Khmer") && c.Status == Constances.UnAuthorised)
                                                .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                                .OrderByDescending(c => c.ContractDate).ToList();
            }
            else
            {
                model.listContractEng = db.Contracts.Where(c => c.Language.Equals("English") && c.Status == Constances.UnAuthorised && c.BranchID.Equals(branchId))
                                            .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                            .OrderByDescending(c => c.ContractDate).ToList();
                model.listContractKhmer = db.Contracts.Where(c => c.Language.Equals("Khmer") && c.Status == Constances.UnAuthorised && c.BranchID.Equals(branchId))
                                                .Include(c => c.Branch).Include(c => c.TypeOfContract)
                                                .OrderByDescending(c => c.ContractDate).ToList();
            }
            
            return View(model);
        }

        public ActionResult Authorise(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model = GetContractEng(contract);
            return View(model);
        }

        [HttpPost, ActionName("Authorise")]
        [ValidateAntiForgeryToken]
        public ActionResult AuthoriseConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            try
            { 
                MembershipUser user = Membership.GetUser();
                contract.authoriser = user.UserName;
                contract.Status = Constances.Authorised;
                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();

                //CreateDocumentContract(contract);
                //CreateDocumentContractGeneral(contract);
                return RedirectToAction("UnAutCompany");
            }
            catch(Exception)
            {
                ModelState.AddModelError("", "Systerm error. Please contact IT Department!");
                CreateCompanyContractEng model = new CreateCompanyContractEng();
                model = GetContractEng(contract);
                return View(model);
            }
        }

        public ActionResult AuthoriseKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            model = GetContractKhmer(contract);
            return View(model);
        }

        [HttpPost, ActionName("AuthoriseKhmer")]
        [ValidateAntiForgeryToken]
        public ActionResult AuthoriseKhmerConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            try
            {
                MembershipUser user = Membership.GetUser();
                contract.authoriser = user.UserName;
                contract.Status = Constances.Authorised;
                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();

                //CreateDocumentContract(contract);
                //CreateDocumentContractGeneral(contract);
                return RedirectToAction("UnAutCompany");
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Systerm error. Please contact IT Department!");
                CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
                model = GetContractKhmer(contract);
                return View(model);
            }
        }

        public ActionResult Revert(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractEng model = new CreateCompanyContractEng();
            model = GetContractEng(contract);
            return View(model);
        }

        [HttpPost, ActionName("Revert")]
        [ValidateAntiForgeryToken]
        public ActionResult RevertConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            try
            {
                contract.authoriser = "";
                contract.Status = Constances.UnAuthorised;
                if (!string.IsNullOrEmpty(contract.FileName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName.Replace(".pdf",".docx")));
                    contract.FileName = "";
                }

                if (!string.IsNullOrEmpty(contract.FileNameDraft))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft.Replace(".pdf", ".docx")));
                    contract.FileNameDraft = "";
                }

                if (!string.IsNullOrEmpty(contract.FileGeneralName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName.Replace(".pdf", ".docx")));
                    contract.FileGeneralName = "";
                }

                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Systerm error. Please contact IT Department!");
                CreateCompanyContractEng model = new CreateCompanyContractEng();
                model = GetContractEng(contract);
                return View(model);
            }
        }

        public ActionResult RevertKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Contract contract = db.Contracts.Find(id);
            if (contract == null)
            {
                return HttpNotFound();
            }
            CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
            model = GetContractKhmer(contract);
            return View(model);
        }

        [HttpPost, ActionName("RevertKhmer")]
        [ValidateAntiForgeryToken]
        public ActionResult RevertKhmerConfirmed(int id)
        {
            Contract contract = db.Contracts.Find(id);
            try
            {
                contract.authoriser = "";
                contract.Status = Constances.UnAuthorised;
                if (!string.IsNullOrEmpty(contract.FileName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileName.Replace(".pdf", ".docx")));
                    contract.FileName = "";
                }

                if (!string.IsNullOrEmpty(contract.FileNameDraft))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileNameDraft.Replace(".pdf", ".docx")));
                    contract.FileNameDraft = "";
                }

                if (!string.IsNullOrEmpty(contract.FileGeneralName))
                {
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName));
                    System.IO.File.Delete(Server.MapPath("~/Reports/" + contract.FileGeneralName.Replace(".pdf", ".docx")));
                    contract.FileGeneralName = "";
                }
                db.Entry(contract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                ModelState.AddModelError("", "Systerm error. Please contact IT Department!");
                CreateCompanyContractKhmer model = new CreateCompanyContractKhmer();
                model = GetContractKhmer(contract);
                return View(model);
            }
        }

        public void FindAndReplace(Application wordApp, object findText, object replaceText)
        {
            object matchCase = true;
            object matchWholeWord = true;
            object matchWildCards = false;
            object matchSoundLike = false;
            object matchAllForms = false;
            object forward = true;
            object format = false;
            object matchKashida = false;
            object matchDiactitis = false;
            object matchAlefHamza = false;
            object matchControl = false;
            object read_only = false;
            object visible = true;
            object replace = 2;
            object wrap = 1;
            wordApp.Selection.Find.Execute(ref findText, ref matchCase, ref matchWholeWord, ref matchWildCards, ref matchSoundLike,
                                                ref matchAllForms, ref forward, ref wrap, ref format, ref replaceText, ref replace,
                                                ref matchKashida, ref matchDiactitis, ref matchAlefHamza, ref matchControl);

        }

        //tao ban draft cho hop dong
        internal void CreateDocumentContractDraft(Contract contract)
        {
            string templateFileName = "";
            string templatePath = "";

            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) 
                                                                && c.Language.Equals(contract.Language)).ToList();
            int numberOfProperty = listProperty.Count;

            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                                c.Language.Equals(contract.Language)).ToList();
            int numberOfMortgage = listMortgageProperty.Count;

            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                    c.Language.Equals(contract.Language)).ToList();
            List<FixDeposit> listFix = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                    c.Language.Equals(contract.Language)).ToList();
            Company company = db.Companies.Where(c => c.Cif.Equals(contract.Cif) && c.Language.Equals(contract.Language))
                                                    .Include(c => c.TypeOfCompany).SingleOrDefault();
            Branch branch = db.Branches.Where(c => c.BranchID.Equals(contract.BranchID)).SingleOrDefault();
            switch (contract.TypeOfContractID)
            {
                case 1:
                    templateFileName = "LongTerm.docx";
                    if (contract.Language.Equals("English"))
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;

                case 3:
                    templateFileName = "CreditLine.docx";
                    if (contract.Language.Equals("English"))
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 4:
                    templateFileName = "OverDraft.docx";
                    if (contract.Language.Equals("English"))
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 5:
                    templateFileName = "ShortTerm.docx";
                    if (contract.Language.Equals("English"))
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
            }

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            Spire.Doc.Section section;
            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            replaceDict.Add("[CompanyName]", contract.CompanyName);
            replaceDict.Add("[ContractNo]", contract.ContractNo);
            replaceDict.Add("[Date]", contract.ContractDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[AppDate]", contract.ApplicationDate.ToString("dd/MM/yyyy"));

            replaceDict.Add("[BrNumber]", branch.BranchRegistrationNo);
            replaceDict.Add("[BrDate]", branch.BranchRegisrationDate.ToString("dd/MM/yyyy"));   
            replaceDict.Add("[BrPhone]", branch.Telephone);
            replaceDict.Add("[BrFax]", branch.Fax);
            replaceDict.Add("[BrEmail]", branch.Email);     
            replaceDict.Add("[BrPosition]", contract.BranchPosition);

            replaceDict.Add("[ComNumber]", company.RegistrationNo);
            replaceDict.Add("[ComDate]", company.RegistrationDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[ComAddr]", company.CompanyAddress);
            replaceDict.Add("[ComPhone]", company.CompanyTelephone);
            if (!string.IsNullOrEmpty(company.CompanyEmail))
            {
                replaceDict.Add("[ComEmail]", company.CompanyEmail);//
            }
            else
                doc.Replace("[ComEmail]", "", false, true);

            replaceDict.Add("[ComDirector]", company.CompanyDirector);

            replaceDict.Add("[Amount]", contract.LoanAmount.ToString("###,###,###.00"));
            if(contract.LCBankGuarantee>0)
                replaceDict.Add("[LCBG]", contract.LoanCurrency + " " + contract.LCBankGuarantee.ToString("###,###,###.00"));
            else
                replaceDict.Add("[LCBG]", "N/A");
            replaceDict.Add("[Ccy]", contract.LoanCurrency);
            //replaceDict.Add("[LegalCcy]", contract.LegalCurrency);

            replaceDict.Add("[Interest]", contract.InterestRate.ToString());
            replaceDict.Add("[Term]", contract.Term.ToString());
            replaceDict.Add("[Fee]", contract.ProcessingFee.ToString());
            replaceDict.Add("[Purpose]", contract.Purpose);

            if (!string.IsNullOrEmpty(contract.OtherCondition))
                replaceDict.Add("[OtherCondition]", contract.OtherCondition);
            else
                doc.Replace("[OtherCondition]", "", false, true);

            replaceDict.Add("[BankPerson]", contract.BankContactPerson);
            replaceDict.Add("[BankPosition]", contract.BankContactPosition);
            replaceDict.Add("[BankContactPhone]", contract.BankContactPhone);
            replaceDict.Add("[BankContactEmail]", contract.BankContactEmail);
            replaceDict.Add("[BorrowerPerson]", contract.BorrowerContactPerson);
            replaceDict.Add("[BorrowerPosition]", contract.BorrowerContactPosition);
            replaceDict.Add("[BorrowerPhone]", contract.BorrowerContactPhone);

            if (!string.IsNullOrEmpty(contract.BorrowerContactEmail))
                replaceDict.Add("[BorrowerEmail]", contract.BorrowerContactEmail);
            else
                doc.Replace("[BorrowerEmail]", "", false, true);

            replaceDict.Add("[KhContract]", contract.NumberOfContractKH.ToString());
            replaceDict.Add("[EngContract]", contract.NumberOfContractEng.ToString());
            replaceDict.Add("[BankKeep]", contract.NumberBankKeep.ToString());
            replaceDict.Add("[BorrKeep]", contract.NumberCustomerKeep.ToString());
            replaceDict.Add("[OtherKeep]", contract.NumberOtherKeep.ToString());

            if (!string.IsNullOrEmpty(contract.EarlySettleFee.ToString()))
                replaceDict.Add("[EarlyFee]", contract.EarlySettleFee.ToString());//
            if (!string.IsNullOrEmpty(contract.RepaymentPrinciple))
                replaceDict.Add("[Principle]", contract.RepaymentPrinciple);//
            if (!string.IsNullOrEmpty(contract.RepaymentInterest))
                replaceDict.Add("[RepayInterest]", contract.RepaymentInterest);//

            replaceDict.Add("[Inputter]", "Inputter: " + contract.inputer);
            replaceDict.Add("[Authoriser]", "Authoriser: " + contract.authoriser);

            if (contract.Language.Equals("English"))
            {
                replaceDict.Add("[Branch]", branch.BranchName);
                replaceDict.Add("[BrAddr]", branch.BranchAddress);
                replaceDict.Add("[TypeOfCompany]", company.TypeOfCompany.Name);
                replaceDict.Add("[BrDirector]", "Mr." + contract.BranchDirector);
                if (contract.LoanCurrency.Equals("USD"))
                    replaceDict.Add("[CcyWord]", "United States Dollar");
                else
                    replaceDict.Add("[CcyWord]", "Khmer Riel");

                string loanAdmountWord = new Utility().EngNumberToWords((int)contract.LoanAmount);
                replaceDict.Add("[Words]", loanAdmountWord);
				
                string LCBGWord = new Utility().EngNumberToWords((int)contract.LCBankGuarantee);
                replaceDict.Add("[LCWord]", LCBGWord);

                if (!string.IsNullOrEmpty(contract.GracePeriod.ToString()))
                {
                    replaceDict.Add("[Repay]", contract.GracePeriod.ToString());
                    string RepayWord = new Utility().EngNumberToWords((int)contract.GracePeriod);//
                    replaceDict.Add("[RepayWord]", RepayWord);
                }
                if (!string.IsNullOrEmpty(contract.LoanWithdraw.ToString()))
                {
                    replaceDict.Add("[LoanDraw]", contract.LoanWithdraw.ToString());//
                    string wordLoanWithDraw = new Utility().EngNumberToWords((int)contract.LoanWithdraw);
                    replaceDict.Add("[WordDraw]", wordLoanWithDraw);
                }
                if (!string.IsNullOrEmpty(contract.LoanRestrucFee.ToString()))
                {
                    replaceDict.Add("[LoanFee]", contract.LoanRestrucFee.ToString());//
                    string wordLoanFee = new Utility().EngNumberToWords((int)contract.LoanRestrucFee);
                    replaceDict.Add("[LoanFeeWord]", wordLoanFee);
                }

                string KhWord = new Utility().EngNumberToWords(contract.NumberOfContractKH);
                replaceDict.Add("[KhWord]", KhWord);
                string EngWord = new Utility().EngNumberToWords(contract.NumberOfContractEng);
                replaceDict.Add("[EngWord]", EngWord);
                string bankKeep = new Utility().EngNumberToWords(contract.NumberBankKeep);
                replaceDict.Add("[BankWord]", bankKeep);
                string borrowerKeep = new Utility().EngNumberToWords(contract.NumberCustomerKeep);
                replaceDict.Add("[BorrWord]", borrowerKeep);
                string otherKeep = new Utility().EngNumberToWords(contract.NumberOtherKeep);
                replaceDict.Add("[OtherWord]", otherKeep);

                replaceDict.Add("[Borrower]", "Borrower: " + contract.CompanyName);
                replaceDict.Add("[BSF]", "BANK FOR INVESTMENT AND DEVELOPMENT OF CAMBODIA PLC - " + branch.BranchStandFor);
            }
            else
            {
                replaceDict.Add("[Branch]", branch.BranchNameKhmer);
                replaceDict.Add("[BrAddr]", branch.BranchAddressKhmer);
                replaceDict.Add("[TypeOfCompany]", company.TypeOfCompany.NameKhmer);
                replaceDict.Add("[BrDirector]", contract.BranchDirector);
                if (contract.LoanCurrency.Equals("USD"))
                    replaceDict.Add("[CcyWord]", "ដុល្លារអាមេរិក");
                else
                    replaceDict.Add("[CcyWord]", "រៀល");
                string loanAdmountWord = new Utility().KhmerNumberToWords((int)contract.LoanAmount);
                replaceDict.Add("[Words]", loanAdmountWord);
                string LCBGWord = new Utility().KhmerNumberToWords((int)contract.LCBankGuarantee);
                replaceDict.Add("[LCWord]", LCBGWord);

                if (!string.IsNullOrEmpty(contract.GracePeriod.ToString()))
                {
                    replaceDict.Add("[Repay]", contract.GracePeriod.ToString());
                    string RepayWord = new Utility().KhmerNumberToWords((int)contract.GracePeriod);//
                    replaceDict.Add("[RepayWord]", RepayWord);
                }
                if (!string.IsNullOrEmpty(contract.LoanWithdraw.ToString()))
                {
                    replaceDict.Add("[LoanDraw]", contract.LoanWithdraw.ToString());//
                    string wordLoanWithDraw = new Utility().KhmerNumberToWords((int)contract.LoanWithdraw);
                    replaceDict.Add("[WordDraw]", wordLoanWithDraw);
                }
                if (!string.IsNullOrEmpty(contract.LoanRestrucFee.ToString()))
                {
                    replaceDict.Add("[LoanFee]", contract.LoanRestrucFee.ToString());//
                    string wordLoanFee = new Utility().KhmerNumberToWords((int)contract.LoanRestrucFee);
                    replaceDict.Add("[LoanFeeWord]", wordLoanFee);
                }

                string KhWord = new Utility().KhmerNumberToWords(contract.NumberOfContractKH);
                replaceDict.Add("[KhWord]", KhWord);

                string EngWord = new Utility().KhmerNumberToWords(contract.NumberOfContractEng);
                replaceDict.Add("[EngWord]", EngWord);
                string bankKeep = new Utility().KhmerNumberToWords(contract.NumberBankKeep);
                replaceDict.Add("[BankWord]", bankKeep);
                string borrowerKeep = new Utility().KhmerNumberToWords(contract.NumberCustomerKeep);
                replaceDict.Add("[BorrWord]", borrowerKeep);
                string otherKeep = new Utility().KhmerNumberToWords(contract.NumberOtherKeep);
                replaceDict.Add("[OtherWord]", otherKeep);
                replaceDict.Add("[Borrower]", "អ្នកខ្ចី: " + contract.CompanyName);
                replaceDict.Add("[BSF]", "ធនាគារវិនិយោគ និងអភិវឌ្ឍន៍កម្ពុជា ភីអិលស៊ី - " + branch.BranchStandFor);
            }

            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            int i = 1;
            if (numberOfProperty > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[HypothecatedProperty]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfProperty + 1, 6);

                table.Rows[0].Cells[0].Width = 25F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 70F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 70F;
                table.Rows[0].Cells[5].Width = 70F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                {
                    Header = new String[] { "N", "Ownership", "Pacel number", "Title deed number","Total Size (m2)", "Location" };
                }
                else
                {
                    Header = new String[] { "ល.រ", "កម្មសិទ្ធករ", "លេខក្បាលដី", "លេខបណ្ណ៍","ទំហំ (ម2)", "ទីតាំង" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 10;
                    p.Format.AfterSpacing = 0;
                }
                foreach (Property item in listProperty)
                {
                    table.Rows[i].Cells[0].Width = 25F;
                    table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 70F;
                    table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = 70F;
                    table.Rows[i].Cells[5].Width = 70F;
                    TableRow DataRow = table.Rows[i];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 10;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Ownership);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 10;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Pacelnumber);
                    t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 9;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.TitleNumber);
                    t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 9;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TotalSize);
                    if (contract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    t4.CharacterFormat.FontSize = 10;
                    p4.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p5 = DataRow.Cells[5].AddParagraph();
                    Spire.Doc.Fields.TextRange t5 = p5.AppendText(item.Location);
                    if (contract.Language.Equals("Khmer"))
                        t5.CharacterFormat.FontName = "Khmer OS Battambang";
                    t5.CharacterFormat.FontSize = 10;
                    p5.Format.AfterSpacing = 0;
                    i++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[HypothecatedProperty]", "N/A", false, true);

            int j = 1;
            if (numberOfMortgage > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[MortgageProperty]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfMortgage + 1, 4);

                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                {
                    Header = new String[] { "No.", "Asset Information", "Plate Number", "Issued By" };
                }
                else
                {
                    Header = new String[] { "លរ", "ពត៍មានចលនទ្រព្យ", "ស្ហាកលេខ", "ចេញដោយ" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }

                foreach (MortgageProperty item in listMortgageProperty)
                {
                    table.Rows[j].Cells[0].Width = 30F;
                    table.Rows[j].Cells[1].Width = table.Rows[j].Cells[2].Width = 100F;
                    table.Rows[j].Cells[3].Width = 100F;
                    table[j, 0].AddParagraph().AppendText(j.ToString());
                    TableRow DataRow = table.Rows[j];
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1;
                    if (contract.Language.Equals("English"))
                    {
                        t1 = p1.AppendText(" - Model name: \n - Model year: \n - Chassis No: \n - Engine No: \n - Vignette No:");
                        t1.CharacterFormat.FontSize = 11;
                    }
                    else
                    {
                        t1 = p1.AppendText(" - ឈ្មោះម៉ូដែល: \n - ឆ្នាំគំរូ: \n - លេខតួ: \n - លេខម៉ាស៊ីន: \n - លេខលតាប័ត្រ:");
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                        t1.CharacterFormat.FontSize = 11;
                    }

                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(" " + item.PlateNumberName + " \n " + item.PlateNumberYear + " \n " + item.PlateChassis
                                            + "  \n " + item.PlateEngine + " \n " + item.PlateVignette);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(" " + item.IssuedByName + " \n " + item.IssuedByYear + " \n " + item.IssuedByChassis + " \n "
                                            + item.IssuedByEngine + " \n " + item.IssuedByVignette);
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;

                    table.Rows[j].Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    j++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[MortgageProperty]", "N/A", false, true);

            int l = 1;
            if (listGuarantor.Count > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[Guarantor]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(listGuarantor.Count + 1, 4);
                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                    Header = new String[] { "No", "Guarantor name", "ID Card/Passport", "Issued on" };
                else
                    Header = new String[] { "លរ", "ឈ្មោះ", "អត្តសញ្ញាណប័ណ្ឌ/លិខិតឆ្លងដែន ", "ចេញនៅលើ" };
                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (Guarantor item in listGuarantor)
                {
                    table.Rows[l].Cells[0].Width = 30F;
                    table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = table.Rows[l].Cells[3].Width = 100F;
                    TableRow DataRow = table.Rows[l];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(l.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.GuarantorName);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Passport);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.PassportDate.ToString("dd/MM/yyyy"));
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    l++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[Guarantor]", "N/A", false, true);

            //***************************************for fix deposti*******************************************
             int s = 1;
            if (listFix.Count > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[FixDeposit]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(listFix.Count + 1, 5);//table.ResetCells(listGuarantor.Count + 1, 5);
                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 80F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 90F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                    Header = new String[] { "No", "Onwer", "ID Number", "Opening Date","Type Of Deposit" };
                else
                    Header = new String[] { "លរ", "ម្ចាស់", "គណនីបញ្ញើមានកាលកំណត់", "បើកកាលបរិច្ឆេទ", "ប្រភេទប្រាក់បញ្ញើ" };
                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }

                //*******************************************fix deposit**********************************************

                foreach (FixDeposit item in listFix)
                {
                    table.Rows[s].Cells[0].Width = 30F;
                    table.Rows[s].Cells[1].Width = table.Rows[s].Cells[2].Width = 80F;
                    table.Rows[s].Cells[3].Width = table.Rows[s].Cells[4].Width = 90F;
                    TableRow DataRow = table.Rows[s];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(s.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Owner);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.IDNumber);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.OpeningDate.ToString("dd/MM/yyyy"));
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    //Change from date expire
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TypeOfDeposit);
                    if (contract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    t4.CharacterFormat.FontSize = 11;
                    p4.Format.AfterSpacing = 0;
                    s++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[FixDeposit]", "N/A", false, true);

            Spire.Doc.TextWatermark txtWatermark = new Spire.Doc.TextWatermark();
            txtWatermark.Text = "DRAFT";
            txtWatermark.FontSize = 150;
            txtWatermark.Layout = WatermarkLayout.Diagonal;
            txtWatermark.FontName = "Times New Roman";
            doc.Watermark = txtWatermark;
            string wordFileName = "Draft_" + contract.Cif + "_" + contract.BranchID + " "
                                        + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + wordFileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            doc.Close();

            object missing = Missing.Value;
            Microsoft.Office.Interop.Word.Application wordApp = new Application();
            //wordApp.Visible = false;
            object readOnly = false;
            object osVisible = true;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            Object filename = (Object)wordFilePath;
            //string wordFilePath = Server.MapPath("~/Reports/" + contract.FileNameDraft);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            contract.FileNameDraft = wordFileName.Replace(".docx", ".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileNameDraft);
            object fileFormat = WdSaveFormat.wdFormatPDF;
            object outPutFileName = fileExportNamePath;
            aDoc.SaveAs2(ref outPutFileName, ref fileFormat, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
            object saveChanges = WdSaveOptions.wdDoNotSaveChanges;
            aDoc.Close(ref saveChanges, ref missing, ref missing);
            aDoc = null;
            wordApp.Quit(ref missing, ref missing, ref missing);
            wordApp = null;

            db.Entry(contract).State = EntityState.Modified;
            db.SaveChanges();
        }

        internal void CreateDocumentContract(Contract contract)
        {
            string templateFileName = "";
            string templatePath = "";

            List<Property> listProperty = db.Properties.Where(c => c.ContractNo.Equals(contract.ContractNo) 
                                                            && c.Language.Equals(contract.Language)).ToList();
            int numberOfProperty = listProperty.Count;

            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                                c.Language.Equals(contract.Language)).ToList();
            int numberOfMortgage = listMortgageProperty.Count;

            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                    c.Language.Equals(contract.Language)).ToList();
            List<FixDeposit> listFix = db.FixDeposits.Where(c => c.ContractNo.Equals(contract.ContractNo) &&
                                                                    c.Language.Equals(contract.Language)).ToList();
            Company company = db.Companies.Where(c => c.Cif.Equals(contract.Cif) && c.Language.Equals(contract.Language))
                                                    .Include(c => c.TypeOfCompany).SingleOrDefault();
            Branch branch = db.Branches.Where(c => c.BranchID.Equals(contract.BranchID)).SingleOrDefault();
            switch (contract.TypeOfContractID)
            {
                case 1:
                    templateFileName = "LongTerm.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;

                case 3:
                    templateFileName = "CreditLine.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 4:
                    templateFileName = "OverDraft.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 5:
                    templateFileName = "ShortTerm.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
            }

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            Spire.Doc.Section section;
            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            
            replaceDict.Add("[CompanyName]", contract.CompanyName);
            replaceDict.Add("[ContractNo]", contract.ContractNo);
            replaceDict.Add("[Date]", contract.ContractDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[AppDate]", contract.ApplicationDate.ToString("dd/MM/yyyy"));

            replaceDict.Add("[BrNumber]", branch.BranchRegistrationNo);
            replaceDict.Add("[BrDate]", branch.BranchRegisrationDate.ToString("dd/MM/yyyy"));
            
            replaceDict.Add("[BrPhone]", branch.Telephone);
            replaceDict.Add("[BrFax]", branch.Fax);
            replaceDict.Add("[BrEmail]", branch.Email);  
            replaceDict.Add("[BrPosition]", contract.BranchPosition);
          
            replaceDict.Add("[ComNumber]", company.RegistrationNo);
            replaceDict.Add("[ComDate]", company.RegistrationDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[ComAddr]", company.CompanyAddress);
            replaceDict.Add("[ComPhone]", company.CompanyTelephone);

            replaceDict.Add("[ComDirector]", company.CompanyDirector);

            replaceDict.Add("[Amount]", contract.LoanAmount.ToString("###,###,###.00"));
            if (contract.LCBankGuarantee > 0)
                replaceDict.Add("[LCBG]", contract.LoanCurrency + " " + contract.LCBankGuarantee.ToString("###,###,###.00"));
            else
                replaceDict.Add("[LCBG]", "N/A");
            replaceDict.Add("[Ccy]", contract.LoanCurrency);
            //replaceDict.Add("[LegalCcy]", contract.LegalCurrency);

            replaceDict.Add("[Interest]", contract.InterestRate.ToString());
            replaceDict.Add("[Term]", contract.Term.ToString());
            replaceDict.Add("[Fee]", contract.ProcessingFee.ToString());
            replaceDict.Add("[Purpose]", contract.Purpose);

            if (!string.IsNullOrEmpty(contract.OtherCondition))
                replaceDict.Add("[OtherCondition]", contract.OtherCondition);
            else
                doc.Replace("[OtherCondition]", "", false, true);

            replaceDict.Add("[BankPerson]", contract.BankContactPerson);
            replaceDict.Add("[BankPosition]", contract.BankContactPosition);
            replaceDict.Add("[BankContactPhone]", contract.BankContactPhone);
            replaceDict.Add("[BankContactEmail]", contract.BankContactEmail);
            replaceDict.Add("[BorrowerPerson]", contract.BorrowerContactPerson);
            replaceDict.Add("[BorrowerPosition]", contract.BorrowerContactPosition);
            replaceDict.Add("[BorrowerPhone]", contract.BorrowerContactPhone);

            if (!string.IsNullOrEmpty(contract.BorrowerContactEmail))
                replaceDict.Add("[BorrowerEmail]", contract.BorrowerContactEmail);
            else
                doc.Replace("[BorrowerEmail]", "", false, true);

            replaceDict.Add("[KhContract]", contract.NumberOfContractKH.ToString());
            replaceDict.Add("[EngContract]", contract.NumberOfContractEng.ToString());
            replaceDict.Add("[BankKeep]", contract.NumberBankKeep.ToString());
            replaceDict.Add("[BorrKeep]", contract.NumberCustomerKeep.ToString());
            replaceDict.Add("[OtherKeep]", contract.NumberOtherKeep.ToString());

            if (!string.IsNullOrEmpty(contract.EarlySettleFee.ToString()))
                replaceDict.Add("[EarlyFee]", contract.EarlySettleFee.ToString());//
            if (!string.IsNullOrEmpty(contract.RepaymentPrinciple))
                replaceDict.Add("[Principle]", contract.RepaymentPrinciple);//
            if (!string.IsNullOrEmpty(contract.RepaymentInterest))
                replaceDict.Add("[RepayInterest]", contract.RepaymentInterest);//

            replaceDict.Add("[Inputter]", "Inputter: " + contract.inputer);
            replaceDict.Add("[Authoriser]", "Authoriser: " + contract.authoriser);

            if (contract.Language.Equals("English"))
            {
                replaceDict.Add("[Branch]", branch.BranchName);
                replaceDict.Add("[BrAddr]", branch.BranchAddress);
                replaceDict.Add("[TypeOfCompany]", company.TypeOfCompany.Name);
                replaceDict.Add("[BrDirector]", "Mr." + contract.BranchDirector);
                if (!string.IsNullOrEmpty(company.CompanyEmail))
                {
                    replaceDict.Add("[ComEmail]", "email: " + company.CompanyEmail);//
                }
                else
                    doc.Replace("[ComEmail]", "", false, true);

                if (contract.LoanCurrency.Equals("USD"))
                    replaceDict.Add("[CcyWord]", "United States Dollar");
                else
                    replaceDict.Add("[CcyWord]", "Khmer Riel");

                string loanAdmountWord = new Utility().EngNumberToWords((int)contract.LoanAmount);
                replaceDict.Add("[Words]", loanAdmountWord);
                string LCBGWord = new Utility().EngNumberToWords((int)contract.LCBankGuarantee);
                replaceDict.Add("[LCWord]", LCBGWord);

                if (!string.IsNullOrEmpty(contract.GracePeriod.ToString()))
                {
                    replaceDict.Add("[Repay]", contract.GracePeriod.ToString());
                    string RepayWord = new Utility().EngNumberToWords((int)contract.GracePeriod);//
                    replaceDict.Add("[RepayWord]", RepayWord);
                }
                if (!string.IsNullOrEmpty(contract.LoanWithdraw.ToString()))
                {
                    replaceDict.Add("[LoanDraw]", contract.LoanWithdraw.ToString());//
                    string wordLoanWithDraw = new Utility().EngNumberToWords((int)contract.LoanWithdraw);
                    replaceDict.Add("[WordDraw]", wordLoanWithDraw);
                }
                if (!string.IsNullOrEmpty(contract.LoanRestrucFee.ToString()))
                {
                    replaceDict.Add("[LoanFee]", contract.LoanRestrucFee.ToString());//
                    string wordLoanFee = new Utility().EngNumberToWords((int)contract.LoanRestrucFee);
                    replaceDict.Add("[LoanFeeWord]", wordLoanFee);
                }

                string KhWord = new Utility().EngNumberToWords(contract.NumberOfContractKH);
                replaceDict.Add("[KhWord]", KhWord);
                string EngWord = new Utility().EngNumberToWords(contract.NumberOfContractEng);
                replaceDict.Add("[EngWord]", EngWord);
                string bankKeep = new Utility().EngNumberToWords(contract.NumberBankKeep);
                replaceDict.Add("[BankWord]", bankKeep);
                string borrowerKeep = new Utility().EngNumberToWords(contract.NumberCustomerKeep);
                replaceDict.Add("[BorrWord]", borrowerKeep);
                string otherKeep = new Utility().EngNumberToWords(contract.NumberOtherKeep);
                replaceDict.Add("[OtherWord]", otherKeep);

                replaceDict.Add("[Borrower]", "Borrower: " + contract.CompanyName);
                replaceDict.Add("[BSF]", "BANK FOR INVESTMENT AND DEVELOPMENT OF CAMBODIA PLC - " + branch.BranchStandFor);
            }
            else
            {
                replaceDict.Add("[Branch]", branch.BranchNameKhmer);
                replaceDict.Add("[BrAddr]", branch.BranchAddressKhmer);
                replaceDict.Add("[TypeOfCompany]", company.TypeOfCompany.NameKhmer);
                replaceDict.Add("[BrDirector]", contract.BranchDirector);
                if (!string.IsNullOrEmpty(company.CompanyEmail))
                {
                    replaceDict.Add("[ComEmail]", "អ៊ីម៉ែល: " + company.CompanyEmail);//
                }
                else
                    doc.Replace("[ComEmail]", "", false, true);

                if (contract.LoanCurrency.Equals("USD"))
                    replaceDict.Add("[CcyWord]", "ដុល្លារអាមេរិក");
                else
                    replaceDict.Add("[CcyWord]", "រៀល");
                string loanAdmountWord = new Utility().KhmerNumberToWords((int)contract.LoanAmount);
                replaceDict.Add("[Words]", loanAdmountWord);
                string LCBGWord = new Utility().KhmerNumberToWords((int)contract.LCBankGuarantee);
                replaceDict.Add("[LCWord]", LCBGWord);

                if (!string.IsNullOrEmpty(contract.GracePeriod.ToString()))
                {
                    replaceDict.Add("[Repay]", contract.GracePeriod.ToString());
                    string RepayWord = new Utility().KhmerNumberToWords((int)contract.GracePeriod);//
                    replaceDict.Add("[RepayWord]", RepayWord);
                }
                if (!string.IsNullOrEmpty(contract.LoanWithdraw.ToString()))
                {
                    replaceDict.Add("[LoanDraw]", contract.LoanWithdraw.ToString());//
                    string wordLoanWithDraw = new Utility().KhmerNumberToWords((int)contract.LoanWithdraw);
                    replaceDict.Add("[WordDraw]", wordLoanWithDraw);
                }
                if (!string.IsNullOrEmpty(contract.LoanRestrucFee.ToString()))
                {
                    replaceDict.Add("[LoanFee]", contract.LoanRestrucFee.ToString());//
                    string wordLoanFee = new Utility().KhmerNumberToWords((int)contract.LoanRestrucFee);
                    replaceDict.Add("[LoanFeeWord]", wordLoanFee);
                }

                string KhWord = new Utility().KhmerNumberToWords(contract.NumberOfContractKH);
                replaceDict.Add("[KhWord]", KhWord);
                string EngWord = new Utility().KhmerNumberToWords(contract.NumberOfContractEng);
                replaceDict.Add("[EngWord]", EngWord);
                string bankKeep = new Utility().KhmerNumberToWords(contract.NumberBankKeep);
                replaceDict.Add("[BankWord]", bankKeep);
                string borrowerKeep = new Utility().KhmerNumberToWords(contract.NumberCustomerKeep);
                replaceDict.Add("[BorrWord]", borrowerKeep);
                string otherKeep = new Utility().KhmerNumberToWords(contract.NumberOtherKeep);
                replaceDict.Add("[OtherWord]", otherKeep);
                replaceDict.Add("[Borrower]", "អ្នកខ្ចី: " + contract.CompanyName);
                replaceDict.Add("[BSF]", "ធនាគារវិនិយោគ និងអភិវឌ្ឍន៍កម្ពុជា ភីអិលស៊ី - " + branch.BranchStandFor);
            }

            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            int i = 1;
            if (numberOfProperty > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[HypothecatedProperty]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfProperty + 1, 6);

                table.Rows[0].Cells[0].Width = 25F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 70F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 70F;
                table.Rows[0].Cells[5].Width = 70F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                {
                    Header = new String[] { "N", "Ownership", "Pacel number", "Title deed number", "Total Size (m2)", "Location" };
                }
                else
                {
                    Header = new String[] { "ល.រ", "កម្មសិទ្ធករ", "លេខក្បាលដី", "លេខបណ្ណ៍", "ទំហំ (ម2)", "ទីតាំង" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (Property item in listProperty)
                {
                    table.Rows[i].Cells[0].Width = 25F;
                    table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 70F;
                    table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = 70F;
                    table.Rows[0].Cells[5].Width = 70F;
                    TableRow DataRow = table.Rows[i];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Ownership);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Pacelnumber);
                    t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 10;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.TitleNumber);
                    t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 10;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TotalSize);
                    if (contract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    t4.CharacterFormat.FontSize = 11;
                    p4.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p5 = DataRow.Cells[5].AddParagraph();
                    Spire.Doc.Fields.TextRange t5 = p5.AppendText(item.Location);
                    if (contract.Language.Equals("Khmer"))
                        t5.CharacterFormat.FontName = "Khmer OS Battambang";
                    t5.CharacterFormat.FontSize = 11;
                    p5.Format.AfterSpacing = 0;
                    i++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[HypothecatedProperty]", "N/A", false, true);

            int j = 1;
            if (numberOfMortgage > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[MortgageProperty]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfMortgage + 1, 4);

                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                {
                    Header = new String[] { "No.", "Asset Information", "Plate Number", "Issued By" };
                }
                else
                {
                    Header = new String[] { "លរ", "ពត៍មានចលនទ្រព្យ", "ស្ហាកលេខ", "ចេញដោយ" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }

                foreach (MortgageProperty item in listMortgageProperty)
                {
                    table.Rows[j].Cells[0].Width = 30F;
                    table.Rows[j].Cells[1].Width = table.Rows[j].Cells[2].Width = 100F;
                    table.Rows[j].Cells[3].Width = 100F;
                    table[j, 0].AddParagraph().AppendText(j.ToString());
                    TableRow DataRow = table.Rows[j];
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1;
                    if (contract.Language.Equals("English"))
                    {
                        t1 = p1.AppendText(" - Model name: \n - Model year: \n - Chassis No: \n - Engine No: \n - Vignette No:");
                        t1.CharacterFormat.FontSize = 11;
                    }
                    else
                    {
                        t1 = p1.AppendText(" - ឈ្មោះម៉ូដែល: \n - ឆ្នាំគំរូ: \n - លេខតួ: \n - លេខម៉ាស៊ីន: \n - លេខលតាប័ត្រ:");
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                        t1.CharacterFormat.FontSize = 11;
                    }

                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(" " + item.PlateNumberName + " \n " + item.PlateNumberYear + " \n " + item.PlateChassis
                                            + "  \n " + item.PlateEngine + " \n " + item.PlateVignette);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(" " + item.IssuedByName + " \n " + item.IssuedByYear + " \n " + item.IssuedByChassis + " \n "
                                            + item.IssuedByEngine + " \n " + item.IssuedByVignette);
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;

                    table.Rows[j].Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    j++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[MortgageProperty]", "N/A", false, true);

            int l = 1;
            if (listGuarantor.Count > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[Guarantor]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(listGuarantor.Count + 1, 4);
                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                    Header = new String[] { "No", "Guarantor name", "ID Card/Passport", "Issued on" };
                else
                    Header = new String[] { "លរ", "ឈ្មោះ", "អត្តសញ្ញាណប័ណ្ឌ/លិខិតឆ្លងដែន ", "កាលបរិច្ឆេទចេញផ្សាយ" };
                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (Guarantor item in listGuarantor)
                {
                    table.Rows[l].Cells[0].Width = 30F;
                    table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = table.Rows[l].Cells[3].Width = 100F;
                    TableRow DataRow = table.Rows[l];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(l.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.GuarantorName);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Passport);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.PassportDate.ToString("dd/MM/yyyy"));
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    l++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[Guarantor]", "N/A", false, true);

            l = 1;
            if (listFix.Count > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[FixDeposit]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(listGuarantor.Count + 1, 5);
                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 100F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 80F;
                //Create Header
                String[] Header;
                if (contract.Language.Equals("English"))
                    Header = new String[] { "No", "Onwer", "ID Number", "Opening Date", "Expiry Date" };
                else
                    Header = new String[] { "លរ", "ម្ចាស់", "គណនីបញ្ញើមានកាលកំណត់", "បើកកាលបរិច្ឆេទ", "កាលបរិច្ឆេទ​ផុតកំណត់" };
                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (contract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (FixDeposit item in listFix)
                {
                    table.Rows[l].Cells[0].Width = 30F;
                    table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = 100F;
                    table.Rows[l].Cells[3].Width = table.Rows[l].Cells[4].Width = 80F;
                    TableRow DataRow = table.Rows[l];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(l.ToString());
                    if (contract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Owner);
                    if (contract.Language.Equals("Khmer"))
                        t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.IDNumber);
                    if (contract.Language.Equals("Khmer"))
                        t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.OpeningDate.ToString("dd/MM/yyyy"));
                    if (contract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    //Change from Date expire
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TypeOfDeposit);
                    if (contract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    t4.CharacterFormat.FontSize = 11;
                    p4.Format.AfterSpacing = 0;
                    l++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[FixDeposit]", "N/A", false, true);

            Spire.Doc.PictureWatermark picture = new Spire.Doc.PictureWatermark();
            picture.Picture = System.Drawing.Image.FromFile(Server.MapPath("~/Content/themes/base/images/Logo.png"));
            picture.Scaling = 100;
            picture.IsWashout = true;
            doc.Watermark = picture;
            string wordFileName = contract.Cif + "_" + contract.BranchID + " "
                                        + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + wordFileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            doc.Close();

            object missing = Missing.Value;
            Microsoft.Office.Interop.Word.Application wordApp = new Application();
            //wordApp.Visible = false;
            object readOnly = false;
            object osVisible = true;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            Object filename = (Object)wordFilePath;
            //string wordFilePath = Server.MapPath("~/Reports/" + contract.FileName);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            
            contract.FileName = wordFileName.Replace(".docx",".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileName);
            object fileFormat = WdSaveFormat.wdFormatPDF;
            object outPutFileName = fileExportNamePath;
            aDoc.SaveAs2(ref outPutFileName, ref fileFormat, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);

            object saveChanges = WdSaveOptions.wdDoNotSaveChanges;
            aDoc.Close(ref saveChanges, ref missing, ref missing);
            aDoc = null;
            wordApp.Quit(ref missing, ref missing, ref missing);
            wordApp = null;
            db.Entry(contract).State = EntityState.Modified;
            db.SaveChanges();
        }

        internal void CreateDocumentContractGeneral(Contract contract)
        {
            //Contract contract = (Contract)_contract;
            string templateFileName = "";
            string templatePath = "";

            switch (contract.TypeOfContractID)
            {
                case 1:
                    templateFileName = "LongTermGeneral.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 3:
                    templateFileName = "CreditLineGeneral.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 4:
                    templateFileName = "OverDraftGeneral.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
                case 5:
                    templateFileName = "ShortTermGeneral.docx";
                    if (contract.Language.Equals("English"))
                    {
                        templatePath = Server.MapPath("~/Template/English/" + templateFileName);
                    }
                    else
                        templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);
                    break;
            }
            Company company = db.Companies.Where(c => c.Cif.Equals(contract.Cif) && c.Language.Equals(contract.Language))
                                                    .Include(c=>c.TypeOfCompany).SingleOrDefault();
            Branch branch = db.Branches.Where(c => c.BranchID.Equals(contract.BranchID)).SingleOrDefault();
            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);

            doc.Replace("[Branch]", contract.BranchName, false, true);
            doc.Replace("[CompanyName]", contract.CompanyName, false, true);
            
            doc.Replace("[ComDirector]", company.CompanyDirector, false, true);
            doc.Replace("[Inputter]", "Inputter: " + contract.inputer, false, true);
            doc.Replace("[Authoriser]", "Authoriser: " + contract.authoriser, false, true);
            if (contract.Language.Equals("English"))
            {
                doc.Replace("[BrDirector]", "Mr." + contract.BranchDirector, false, true);
                doc.Replace("[Borrower]", "Borrower: " + contract.CompanyName, false, true);
                doc.Replace("[BSF]", "BANK FOR INVESTMENT AND DEVELOPMENT OF CAMBODIA PLC - " + branch.BranchStandFor, false, true);
            }
            else
            {
                doc.Replace("[BrDirector]", contract.BranchDirector, false, true);
                doc.Replace("[Borrower]", "អ្នកខ្ចី: " + contract.CompanyName, false, true);
                doc.Replace("[BSF]", "ធនាគារវិនិយោគ និងអភិវឌ្ឍន៍កម្ពុជា ភីអិលស៊ី - " + branch.BranchStandFor, false, true);
            }

            Spire.Doc.PictureWatermark picture = new Spire.Doc.PictureWatermark();
            picture.Picture = System.Drawing.Image.FromFile(Server.MapPath("~/Content/themes/base/images/Logo.png"));
            picture.Scaling = 100;
            picture.IsWashout = true;
            doc.Watermark = picture;

            string wordFileName = "G_" + contract.Cif + "_" + contract.BranchID + " "
                                        + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + wordFileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            doc.Close();

            object missing = Missing.Value;
            Microsoft.Office.Interop.Word.Application wordApp = new Application();
            //wordApp.Visible = false;
            object readOnly = false;
            object osVisible = true;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            Object filename = (Object)wordFilePath;
            //string wordFilePath = Server.MapPath("~/Reports/" + contract.FileGeneralName);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            contract.FileGeneralName = wordFileName.Replace(".docx", ".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileGeneralName);
            object fileFormat = WdSaveFormat.wdFormatPDF;
            object outPutFileName = fileExportNamePath;
            aDoc.SaveAs2(ref outPutFileName, ref fileFormat, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
            object saveChanges = WdSaveOptions.wdDoNotSaveChanges;
            aDoc.Close(ref saveChanges, ref missing, ref missing);
            aDoc = null;
            wordApp.Quit(ref missing, ref missing, ref missing);
            wordApp = null;

            db.Entry(contract).State = EntityState.Modified;
            db.SaveChanges();
        }

        //view ban draft hop dong**************************************************
        public FileContentResult GenerateDraftContract(int? id)
        {
            string fileExportNamePath = "";
            Contract contract = db.Contracts.Find(id);
            if (!string.IsNullOrEmpty(contract.FileNameDraft))
            {
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileNameDraft);
            }
            else
            {
                CreateDocumentContractDraft(contract);
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileNameDraft);
            }
            //string temp = Path.GetExtension(fileExportNamePath);
            //if (!temp.Equals(".pdf"))
            //{
            //}
            //var mimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
            var mimeType = "application/pdf";
            var fileContents = System.IO.File.ReadAllBytes(fileExportNamePath);
            return new FileContentResult(fileContents, mimeType);
        }

        public FileContentResult GenerateContract2(int? id)
        {
            string fileExportNamePath = "";
            Contract contract = db.Contracts.Find(id);
            if (!string.IsNullOrEmpty(contract.FileName))
            {
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileName);
            }
            else
            {
                CreateDocumentContract(contract);
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileName);
            }
            //string temp = Path.GetExtension(fileExportNamePath);
            //if(!temp.Equals(".pdf"))
            //{

            //}         
            //var mimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
            var mimeType = "application/pdf";
            var fileContents = System.IO.File.ReadAllBytes(fileExportNamePath);
            return new FileContentResult(fileContents, mimeType);
        }

        public FileContentResult ExportGeneralContract(int? id)
        {
            string fileExportNamePath = "";
            Contract contract = db.Contracts.Find(id);
            if (!String.IsNullOrEmpty(contract.FileGeneralName))
            {
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileGeneralName);
            }
            else
            {
                CreateDocumentContractGeneral(contract);
                fileExportNamePath = Server.MapPath("~/Reports/" + contract.FileGeneralName);
            }
            //string temp = Path.GetExtension(fileExportNamePath);

            //if(!temp.Equals(".pdf"))
            //{                

            //}
            var mimeType = "application/pdf";
            var fileContents = System.IO.File.ReadAllBytes(fileExportNamePath);
            return new FileContentResult(fileContents, mimeType);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
