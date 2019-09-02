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
using System.Globalization;
using System.Web.Security;
using Spire.Doc;
using Spire.Doc.Documents;
using Microsoft.Office.Interop.Word;
using Microsoft.Office.Core;
using BIDC_CreditContracts.Repositories;
using System.Threading;
using System.IO;
using System.Reflection;
using System.Web.Profile;

namespace BIDC_CreditContracts.Controllers
{
    public class HypothecContractsController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: HypothecContracts
        public ActionResult Index()
        {
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
        public ActionResult Search(SearchHypothecContract model)
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
            SearchHypothecContract model = new SearchHypothecContract();
            DateTime fromSearchDate;
            DateTime toSearchDate;
            MembershipUser user = Membership.GetUser();
            ProfileBase profile = ProfileBase.Create(user.UserName);
            string branchId = (string)profile.GetPropertyValue("BranchId");

            try
            {
                fromSearchDate = (string.IsNullOrEmpty(fromDate))
                            ? DateTime.Parse("01/01/2017", CultureInfo.CreateSpecificCulture("fr-FR"))
                            : DateTime.Parse(fromDate);

                toSearchDate = (string.IsNullOrEmpty(toDate))
                            ? DateTime.Parse("01/01/2100", CultureInfo.CreateSpecificCulture("fr-FR"))
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
                model.listHypothecContractEng = db.HypothecContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                    && c.Language.Equals("English")).Include(c => c.Branch)
                                                    .OrderByDescending(c => c.CreateDate).ToList();
                model.listHypothecContractKhmer = db.HypothecContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                        && c.Language.Equals("Khmer")).Include(c => c.Branch)
                                                        .OrderByDescending(c => c.CreateDate).ToList();
            }
            else
            {
                model.listHypothecContractEng = db.HypothecContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                    && c.Language.Equals("English") && c.BranchID.Equals(branchId)).Include(c => c.Branch)
                                                    .OrderByDescending(c => c.CreateDate).ToList();
                model.listHypothecContractKhmer = db.HypothecContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                        && c.Language.Equals("Khmer") && c.BranchID.Equals(branchId)).Include(c => c.Branch)
                                                        .OrderByDescending(c => c.CreateDate).ToList();
            }
            
            return View(model);
        }

        // GET: HypothecContracts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            if (hypothecContract == null)
            {
                return HttpNotFound();
            }
            return View(hypothecContract);
        }

        public ActionResult CreateStep1()
        {
            CreateHypothecStep1 model = new CreateHypothecStep1();
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
            
            return View(model);
        }

        [HttpPost]
        public ActionResult CreateStep1(CreateHypothecStep1 model)
        {
            if (ModelState.IsValid)
            {
                int countCif;
                Session["CifCustomer"] = model.Cif;
                if (model.Language.Equals("English"))
                {
                    countCif = db.Contracts.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English") && c.Status == Constances.Authorised).Count();
                    if (countCif > 0)
                        return RedirectToAction("CreateStep2Eng");
                    else
                        return RedirectToAction("CreateNoContract");
                }
                else
                {
                    countCif = db.Contracts.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer") && c.Status == Constances.Authorised).Count();
                    if (countCif > 0)
                        return RedirectToAction("CreateStep2Khmer");
                    else
                        return RedirectToAction("CreateNoContractKhmer");
                }   
            }
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
            return View(model);
        }

        public ActionResult CreateStep2Eng()
        {
            CreateHypothecStep2Eng model = new CreateHypothecStep2Eng();
            model.Cif = (string)Session["CifCustomer"];
            try
            {
                List<string> listCreditContract = db.Contracts.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English"))
                                                                    .Select(c => c.ContractNo).ToList();
                foreach (string item in listCreditContract)
                {
                    model.CreditContractItems.Add(new SelectListItem
                    {
                        Text = item,
                        Value = item
                    });
                }
                model.CreditContractItems.Add(new SelectListItem
                {
                    Text = "Other",
                    Value = "Other"
                });
            }
            catch
            {
                ModelState.AddModelError("", "Please insert correct CIF");
                return RedirectToAction("CreateStep1");
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult CreateStep2Eng(CreateHypothecStep2Eng model)
        {
            Session["CifCustomer"] = model.Cif;
            Session["CreditContract"] = model.CreditContract;
            if(model.CreditContract.Equals("Other"))
                return RedirectToAction("CreateNoContract");
            else
                return RedirectToAction("Create");
        }

        public ActionResult CreateStep2Khmer()
        {
            CreateHypothecStep2Khmer model = new CreateHypothecStep2Khmer();
            model.Cif = (string)Session["CifCustomer"];
            try
            {
                List<string> listCreditContract = db.Contracts.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer"))
                                                                    .Select(c => c.ContractNo).ToList();
                foreach (string item in listCreditContract)
                {
                    model.CreditContractItems.Add(new SelectListItem
                    {
                        Text = item,
                        Value = item
                    });
                }
                model.CreditContractItems.Add(new SelectListItem
                {
                    Text = "Other",
                    Value = "Other"
                });
            }
            catch
            {
                ModelState.AddModelError("", "Please insert correct CIF");
                return RedirectToAction("CreateStep1");
            }
            return View(model);
        }

        [HttpPost]
        public ActionResult CreateStep2Khmer(CreateHypothecStep2Khmer model)
        {
            Session["CifCustomer"] = model.Cif;
            Session["CreditContract"] = model.CreditContract;
            if (model.CreditContract.Equals("Other"))
                return RedirectToAction("CreateNoContractKhmer");
            else
                return RedirectToAction("CreateKhmer");
        }

        // GET: HypothecContracts/Create
        public ActionResult Create()
        {
            CreateHypothecContractEng model = new CreateHypothecContractEng();
            //model.Cif = (string)Session["CifCustomer"];
            model.Cif = (string)Session["CifCustomer"];
            model.CreditContract = (string)Session["CreditContract"];
            Session["Hypothecator"] = null;
            //Session["Debtor"] = null;
            Session["Property"] = null;
            try
            {
                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).SingleOrDefault();
                model.CompanyName = company.CompanyName;
                model.CompanyRegistrationNo = company.RegistrationNo;
                model.CompanyAddress = company.CompanyAddress;
                model.CompanyDirector = company.CompanyDirector;
                model.TypeOfCompanyID = company.TypeOfCompanyID;
                model.TypeOfCompany = db.TypeOfCompanies.Where(c => c.ID == company.TypeOfCompanyID).Select(c => c.Name).SingleOrDefault();

                Contract loanContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("English"))
                                                    .Include(c => c.TypeOfContract).SingleOrDefault();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(loanContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                model.TypeOfLoanContract = loanContract.TypeOfContract.TypeName;
                model.CreditContractAmount = loanContract.LoanAmount;
                model.Currency = loanContract.LoanCurrency;
                model.CreditContractDate = loanContract.ContractDate;
                model.CreditContractInterestRate = loanContract.InterestRate;
                model.BranchID = loanContract.BranchID;
                model.BranchName = loanContract.Branch.BranchName;
                model.BranchDirector = loanContract.BranchDirector;

                model.DebtorName = company.CompanyName;
                model.DebtorBirthDate = company.RegistrationDate;
                model.DebtorNationality = company.RegistrationNo;
                model.DebtorAddress = company.CompanyAddress;

                model.Damages = 25;
                int countHypothecContract = db.HypothecContracts.Where(c => c.Language.Equals("English")).Count() + 1;
                if (countHypothecContract < 10)
                    model.ContractNo = "0" + countHypothecContract + "/" + DateTime.Now.Year + "/HP/" + branchStandfor + "/";
                else
                    model.ContractNo = countHypothecContract + "/" + DateTime.Now.Year + "/HP/" + branchStandfor + "/";

                int countProperty = db.Properties.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("English")).Count();
                if (countProperty > 0)
                {
                    List<Property> _listProperty = db.Properties.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("English")).ToList();
                    PropertyView proView;
                    foreach (Property item in _listProperty)
                    {
                        proView = new PropertyView();
                        proView.Ownership = item.Ownership;
                        proView.Pacelnumber = item.Pacelnumber;
                        proView.TitleNumber = item.TitleNumber;
                        proView.Location = item.Location;
                        proView.TypeOfProperty = item.TypeOfProperty;
                        proView.TotalSize = item.TotalSize;
                        model.listProperty.Add(proView);
                    }
                    Session["Property"] = model.listProperty;
                }
                List<string> listSex = db.Sexes.Select(c => c.NameEng).ToList();
                foreach (string item in listSex)
                {
                    model.SexItems.Add(new SelectListItem
                    {
                        Text = item,
                        Value = item
                    });
                }
                
                model.HypothecatorBirthDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
                foreach (TypeOfProperty item in listProperty)
                {
                    model.PropertyTypeItems.Add(new SelectListItem
                    {
                        Text = item.PropertyName,
                        Value = item.PropertyName
                    });
                }

                return View(model);
            }
            catch
            {
                ModelState.AddModelError("", "Please insert correct CIF");
                return RedirectToAction("CreateStep1");
            }
            
        }

        // POST: HypothecContracts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreateHypothecContractEng model)
        {
            List<TypeOfProperty> listProperty;
            List<string> listSex;
            //Contract loanContract;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = new HypothecContract();
                //loanContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("English"))
                //                                    .Include(c => c.TypeOfContract).SingleOrDefault();
                //string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(loanContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                hypothecContract.ContractNo = model.ContractNo + model.ContractNoSecond;
                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.Damages = model.Damages;

                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = model.BranchName;
                hypothecContract.BranchDirector = model.BranchDirector;
                
                MembershipUser user = Membership.GetUser();
                hypothecContract.inputer = user.UserName;
                hypothecContract.Language = "English";
                hypothecContract.CreateDate = DateTime.Now;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;
                hypothecContract.TypeOfcompany = model.TypeOfCompany;
                
                //Hypothecator
                if (Session["Hypothecator"] != null)
                {
                    List<HypothecatorEng> listHypothector = (List<HypothecatorEng>)Session["Hypothecator"];
                    Hypothecator hypothector;
                    foreach (HypothecatorEng item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");
                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    if (Session["Property"] != null)
                        model.listProperty = (List<PropertyView>)Session["Property"];
                    return View(model);
                }
                Session["Hypothecator"] = null;

                //Debtor
                if(!string.IsNullOrWhiteSpace(model.DebtorName)&& !string.IsNullOrWhiteSpace(model.DebtorBirthDate.ToString()))
                {
                    Debtor debtor = new Debtor();
                    debtor.HypothecContract = hypothecContract.ContractNo;
                    debtor.DebtorName = model.DebtorName;
                    debtor.DebtorBirthDate = model.DebtorBirthDate;
                    debtor.DebtorNationality = model.DebtorNationality;
                    debtor.DebtorAddress = model.DebtorAddress;
                    debtor.Language = hypothecContract.Language;
                    db.Debtors.Add(debtor);
                    db.SaveChanges();
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Detor");

                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    return View(model);
                }
                
                
                //Property
                if (Session["Property"] != null)
                {
                    List<PropertyView> listHypothecatedProperty = (List<PropertyView>)Session["Property"];
                    PropertyForHypothec property;
                    foreach (PropertyView item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");

                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    if (Session["Hypothecator"] != null)
                        model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
                    return View(model);
                }
                Session["Property"] = null;
                Session["CifCustomer"] = null;
                Session["CreditContract"] = null;
                db.HypothecContracts.Add(hypothecContract);
                db.SaveChanges();

                //CreateAnnexHypothecDoc(hypothecContract);
                //CreateHypothecDoc(hypothecContract);

                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameEng).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            if (Session["Hypothecator"] != null)
                model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
            if (Session["Property"] != null)
                model.listProperty = (List<PropertyView>)Session["Property"];
            return View(model);
        }

        public ActionResult CreateNoContract()
        {
            CreateHypothecContractEng model = new CreateHypothecContractEng();
            model.Cif = (string)Session["CifCustomer"];
           
            Session["Hypothecator"] = null;
            Session["Debtor"] = null;
            Session["Property"] = null;
            model.Damages = 25;
            int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif)).Count();
            if (countCompany > 0)
            {
                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).Single();
                model.CompanyName = company.CompanyName;
                model.CompanyRegistrationNo = company.RegistrationNo;
                model.CompanyAddress = company.CompanyAddress;
                model.CompanyDirector = company.CompanyDirector;
                model.TypeOfCompanyID = company.TypeOfCompanyID;
                model.TypeOfCompany = db.TypeOfCompanies.Where(c => c.ID == company.TypeOfCompanyID).Select(c => c.Name).SingleOrDefault();

                model.DebtorName = company.CompanyName;
                model.DebtorBirthDate = company.RegistrationDate;
                model.DebtorNationality = company.RegistrationNo;
                model.DebtorAddress = company.CompanyAddress;
            }

            int countHypothecContract = db.HypothecContracts.Where(c => c.Language.Equals("English")).Count() + 1;
            if (countHypothecContract < 10)
                model.ContractNo = "0" + countHypothecContract + "/" + DateTime.Now.Year + "/HP/";
            else
                model.ContractNo = countHypothecContract + "/" + DateTime.Now.Year + "/HP/";
            List<string> listSex = db.Sexes.Select(c => c.NameEng).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
                });
            }
            model.HypothecatorBirthDate = model.DebtorBirthDate = model.CreditContractDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            List<Branch> listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID
                });
            }
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            List<Currency> listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID
                });
            }
            List<TypeOfContract> listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName
                });
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNoContract(CreateHypothecContractEng model)
        {
            List<TypeOfProperty> listProperty;
            List<Branch> listBranch;
            List<TypeOfCompany> listCompany;
            List<Currency> listCcy;
            List<TypeOfContract> listTypeOfContract;
            List<string> listSex;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = new HypothecContract();
                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).Single();
                hypothecContract.BranchDirector = model.BranchDirector;
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                hypothecContract.ContractNo = model.ContractNo + branchStandfor + "/" + model.ContractNoSecond;

                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.Damages = model.Damages;
                MembershipUser user = Membership.GetUser();
                hypothecContract.inputer = user.UserName;
                hypothecContract.Language = "English";
                hypothecContract.CreateDate = DateTime.Now;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;
                hypothecContract.TypeOfcompany = db.TypeOfCompanies.Where(c => c.ID == model.TypeOfCompanyID).Select(c => c.Name).SingleOrDefault();
                                                    
                //Hypothecator
                if (Session["Hypothecator"] != null)
                {
                    List<HypothecatorEng> listHypothector = (List<HypothecatorEng>)Session["Hypothecator"];
                    Hypothecator hypothector;
                    foreach (HypothecatorEng item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");

                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeName,
                            Value = item.TypeName,
                            Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    
                    if (Session["Property"] != null)
                        model.listProperty = (List<PropertyView>)Session["Property"];
                    return View(model);
                }
                Session["Hypothecator"] = null;

                //Debtor
                if (!string.IsNullOrWhiteSpace(model.DebtorName) && !string.IsNullOrWhiteSpace(model.DebtorBirthDate.ToString()))
                {
                    Debtor debtor = new Debtor();
                    debtor.HypothecContract = hypothecContract.ContractNo;
                    debtor.DebtorName = model.DebtorName;
                    debtor.DebtorBirthDate = model.DebtorBirthDate;
                    debtor.DebtorNationality = model.DebtorNationality;
                    debtor.DebtorAddress = model.DebtorAddress;
                    debtor.Language = hypothecContract.Language;
                    db.Debtors.Add(debtor);
                    db.SaveChanges();
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Detor");
                    model.SexItems = new List<SelectListItem>();
                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeName,
                            Value = item.TypeName,
                            Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    if (Session["Hypothecator"] != null)
                        model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
                    if (Session["Property"] != null)
                        model.listProperty = (List<PropertyView>)Session["Property"];
                    return View(model);
                }
                
                
                //Property
                if (Session["Property"] != null)
                {
                    List<PropertyView> listHypothecatedProperty = (List<PropertyView>)Session["Property"];
                    PropertyForHypothec property;
                    foreach (PropertyView item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");
                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeName,
                            Value = item.TypeName,
                            Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    if (Session["Hypothecator"] != null)
                        model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
                    
                    return View(model);
                }
                Session["Property"] = null;
                Session["CifCustomer"] = null;
                
                db.HypothecContracts.Add(hypothecContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameEng).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID,
                    Selected = item.BranchID.Equals(model.BranchID) ? true : false
                });
            }
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                });
            }
            if (Session["Hypothecator"] != null)
                model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
            if (Session["Property"] != null)
                model.listProperty = (List<PropertyView>)Session["Property"];
            return View(model);
        }

        public ActionResult CreateKhmer()
        {
            CreateHypothecContractKhmer model = new CreateHypothecContractKhmer();
            model.Cif = (string)Session["CifCustomer"];
            model.CreditContract = (string)Session["CreditContract"];
            Session["HypothecatorKhmer"] = null;
            Session["DebtorKhmer"] = null;
            Session["PropertyKhmer"] = null;
            try
            {
                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).SingleOrDefault();
                model.CompanyName = company.CompanyName;
                model.CompanyRegistrationNo = company.RegistrationNo;
                model.CompanyAddress = company.CompanyAddress;
                model.CompanyDirector = company.CompanyDirector;
                model.TypeOfCompanyID = company.TypeOfCompanyID;
                model.TypeOfCompany = db.TypeOfCompanies.Where(c => c.ID == company.TypeOfCompanyID).Select(c => c.NameKhmer).SingleOrDefault();

                Contract loanContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("Khmer"))
                                                    .Include(c => c.TypeOfContract).SingleOrDefault();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(loanContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                model.TypeOfLoanContract = loanContract.TypeOfContract.TypeNameKhmer;
                model.CreditContractAmount = loanContract.LoanAmount;
                model.Currency = loanContract.LoanCurrency;
                model.CreditContractDate = loanContract.ContractDate;
                model.CreditContractInterestRate = loanContract.InterestRate;

                model.BranchID = loanContract.BranchID;
                model.BranchName = loanContract.Branch.BranchNameKhmer;
                model.BranchDirector = loanContract.BranchDirector;

                model.DebtorName = company.CompanyName;
                model.DebtorBirthDate = company.RegistrationDate;
                model.DebtorNationality = company.RegistrationNo;
                model.DebtorAddress = company.CompanyAddress;

                model.Damages = 25;
                int countHypothecContract = db.HypothecContracts.Where(c => c.Language.Equals("Khmer")).Count() + 1;
                if (countHypothecContract < 10)
                    model.ContractNo = "0" + countHypothecContract + "/" + DateTime.Now.Year + "/HP/" + branchStandfor + "/";
                else
                    model.ContractNo = countHypothecContract + "/" + DateTime.Now.Year + "/HP/" + branchStandfor + "/";

                int countProperty = db.Properties.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("Khmer")).Count();
                if (countProperty > 0)
                {
                    List<Property> _listProperty = db.Properties.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("Khmer")).ToList();
                    PropertyViewKhmer proView;
                    foreach (Property item in _listProperty)
                    {
                        proView = new PropertyViewKhmer();
                        proView.Ownership = item.Ownership;
                        proView.Pacelnumber = item.Pacelnumber;
                        proView.TitleNumber = item.TitleNumber;
                        proView.Location = item.Location;
                        proView.TypeOfProperty = item.TypeOfProperty;
                        proView.TotalSize = item.TotalSize;
                        model.listProperty.Add(proView);
                    }
                    Session["PropertyKhmer"] = model.listProperty;
                }
                List<string> listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                foreach (string item in listSex)
                {
                    model.SexItems.Add(new SelectListItem
                    {
                        Text = item,
                        Value = item
                    });
                }
                
                model.HypothecatorBirthDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
                foreach (TypeOfProperty item in listProperty)
                {
                    model.PropertyTypeItems.Add(new SelectListItem
                    {
                        Text = item.PropertyNameKhmer,
                        Value = item.PropertyNameKhmer
                    });
                }

                return View(model);
            }
            catch
            {
                ModelState.AddModelError("", "Please insert correct CIF");
                return RedirectToAction("CreateStep1");
            }
            
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateKhmer(CreateHypothecContractKhmer model)
        {
            List<TypeOfProperty> listProperty;
            List<string> listSex;
            //Contract loanContract;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = new HypothecContract();
                //loanContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("Khmer"))
                //                                    .Include(c => c.TypeOfContract).SingleOrDefault();
                //string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(loanContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                hypothecContract.ContractNo = model.ContractNo + model.ContractNoSecond;
                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.Damages = model.Damages;

                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = model.BranchName;
                hypothecContract.BranchDirector = model.BranchDirector;

                MembershipUser user = Membership.GetUser();
                hypothecContract.inputer = user.UserName;
                hypothecContract.Language = "Khmer";
                hypothecContract.CreateDate = DateTime.Now;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;
                hypothecContract.TypeOfcompany = model.TypeOfCompany;

                //Hypothecator
                if (Session["HypothecatorKhmer"] != null)
                {
                    List<HypothecatorKhmer> listHypothector = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    Hypothecator hypothector;
                    foreach (HypothecatorKhmer item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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

                    if (Session["PropertyKhmer"] != null)
                        model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    return View(model);
                }
                Session["HypothecatorKhmer"] = null;

                //Debtor
                if (!string.IsNullOrWhiteSpace(model.DebtorName) && !string.IsNullOrWhiteSpace(model.DebtorBirthDate.ToString()))
                {
                    Debtor debtor = new Debtor();
                    debtor.HypothecContract = hypothecContract.ContractNo;
                    debtor.DebtorName = model.DebtorName;
                    debtor.DebtorBirthDate = model.DebtorBirthDate;
                    debtor.DebtorNationality = model.DebtorNationality;
                    debtor.DebtorAddress = model.DebtorAddress;
                    debtor.Language = hypothecContract.Language;
                    db.Debtors.Add(debtor);
                    db.SaveChanges();
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Detor");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    return View(model);
                }
                                
                //Property
                if (Session["PropertyKhmer"] != null)
                {
                    List<PropertyViewKhmer> listHypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    PropertyForHypothec property;
                    foreach (PropertyViewKhmer item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    if (Session["HypothecatorKhmer"] != null)
                        model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    
                    return View(model);
                }
                Session["PropertyKhmer"] = null;
                Session["CifCustomer"] = null;
                Session["CreditContract"] = null;
                db.HypothecContracts.Add(hypothecContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            if (Session["PropertyKhmer"] != null)
                model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            if (Session["HypothecatorKhmer"] != null)
                model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
            return View(model);
        }

        public ActionResult CreateNoContractKhmer()
        {
            CreateHypothecContractKhmer model = new CreateHypothecContractKhmer();
            model.Cif = (string)Session["CifCustomer"];

            Session["HypothecatorKhmer"] = null;
            Session["DebtorKhmer"] = null;
            Session["PropertyKhmer"] = null;
            model.Damages = 25;

            int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif)).Count();
            if (countCompany > 0)
            {
                Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).Single();
                model.CompanyName = company.CompanyName;
                model.CompanyRegistrationNo = company.RegistrationNo;
                model.CompanyAddress = company.CompanyAddress;
                model.CompanyDirector = company.CompanyDirector;
                model.TypeOfCompanyID = company.TypeOfCompanyID;
                model.TypeOfCompany = db.TypeOfCompanies.Where(c => c.ID == company.TypeOfCompanyID).Select(c => c.Name).SingleOrDefault();

                model.DebtorName = company.CompanyName;
                model.DebtorBirthDate = company.RegistrationDate;
                model.DebtorNationality = company.RegistrationNo;
                model.DebtorAddress = company.CompanyAddress;
            }

            int countHypothecContract = db.HypothecContracts.Where(c => c.Language.Equals("Khmer")).Count() + 1;
            if (countHypothecContract < 10)
                model.ContractNo = "0" + countHypothecContract + "/" + DateTime.Now.Year + "/HP/";
            else
                model.ContractNo = countHypothecContract + "/" + DateTime.Now.Year + "/HP/";
            List<string> listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
                });
            }
            model.HypothecatorBirthDate = model.DebtorBirthDate = model.CreditContractDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            List<TypeOfProperty> listProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyNameKhmer,
                    Value = item.PropertyNameKhmer
                });
            }
            List<Branch> listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchNameKhmer,
                    Value = item.BranchID
                });
            }
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            List<Currency> listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID
                });
            }
            List<TypeOfContract> listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeNameKhmer,
                    Value = item.TypeNameKhmer
                });
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateNoContractKhmer(CreateHypothecContractKhmer model)
        {
            List<TypeOfProperty> listProperty;
            List<Branch> listBranch;
            List<TypeOfCompany> listCompany;
            List<Currency> listCcy;
            List<TypeOfContract> listTypeOfContract;
            List<string> listSex;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = new HypothecContract();
                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchNameKhmer).Single();
                hypothecContract.BranchDirector = model.BranchDirector;
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                hypothecContract.ContractNo = model.ContractNo + branchStandfor + "/" + model.ContractNoSecond;

                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.Damages = model.Damages;
                MembershipUser user = Membership.GetUser();
                hypothecContract.inputer = user.UserName;
                hypothecContract.Language = "Khmer";
                hypothecContract.CreateDate = DateTime.Now;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;
                hypothecContract.TypeOfcompany = db.TypeOfCompanies.Where(c => c.ID == model.TypeOfCompanyID).Select(c => c.NameKhmer).SingleOrDefault();

                //Hypothecator
                if (Session["HypothecatorKhmer"] != null)
                {
                    List<HypothecatorKhmer> listHypothector = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    Hypothecator hypothector;
                    foreach (HypothecatorKhmer item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchNameKhmer,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeNameKhmer,
                            Value = item.TypeNameKhmer,
                            Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    if (Session["PropertyKhmer"] != null)
                        model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    
                    return View(model);
                }
                Session["HypothecatorKhmer"] = null;

                //Debtor
                if (!string.IsNullOrWhiteSpace(model.DebtorName) && !string.IsNullOrWhiteSpace(model.DebtorBirthDate.ToString()))
                {
                    Debtor debtor = new Debtor();
                    debtor.HypothecContract = hypothecContract.ContractNo;
                    debtor.DebtorName = model.DebtorName;
                    debtor.DebtorBirthDate = model.DebtorBirthDate;
                    debtor.DebtorNationality = model.DebtorNationality;
                    debtor.DebtorAddress = model.DebtorAddress;
                    debtor.Language = hypothecContract.Language;
                    db.Debtors.Add(debtor);
                    db.SaveChanges();
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");
                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchNameKhmer,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeNameKhmer,
                            Value = item.TypeNameKhmer,
                            Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    if (Session["PropertyKhmer"] != null)
                        model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    if (Session["HypothecatorKhmer"] != null)
                        model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    return View(model);
                }
                                
                //Property
                if (Session["PropertyKhmer"] != null)
                {
                    List<PropertyViewKhmer> listHypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    PropertyForHypothec property;
                    foreach (PropertyViewKhmer item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchNameKhmer,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeNameKhmer,
                            Value = item.TypeNameKhmer,
                            Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }
                    
                    if (Session["HypothecatorKhmer"] != null)
                        model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    return View(model);
                }
                Session["PropertyKhmer"] = null;
                Session["CifCustomer"] = null;

                db.HypothecContracts.Add(hypothecContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchNameKhmer,
                    Value = item.BranchID,
                    Selected = item.BranchID.Equals(model.BranchID) ? true : false
                });
            }
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeNameKhmer,
                    Value = item.TypeNameKhmer,
                    Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                });
            }
            if (Session["PropertyKhmer"] != null)
                model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
            if (Session["HypothecatorKhmer"] != null)
                model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
            return View(model);
        }

        // GET: HypothecContracts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            if (hypothecContract == null)
            {
                return HttpNotFound();
            }
            CreateHypothecContractEng model = new CreateHypothecContractEng();
            model.ID = hypothecContract.ID;
            model.ContractNo = "temp";
            model.ContractNoSecond = hypothecContract.ContractNo;
            model.BranchID = hypothecContract.BranchID;
            model.BranchName = hypothecContract.BranchName;
            model.BranchDirector = hypothecContract.BranchDirector;
            List<Branch> listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID,
                    Selected = (item.BranchID.Equals(model.BranchID)) ? true : false
                });
            }

            model.CreditContract = hypothecContract.CreditContract;
            model.CreditContractDate = hypothecContract.CreditContractDate;
            model.TypeOfLoanContract = hypothecContract.TypeOfLoanContract;
            List<TypeOfContract> listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = (item.TypeName.Equals(model.TypeOfLoanContract)) ? true : false
                });
            }
            model.CreditContractAmount = hypothecContract.CreditContractAmount;
            model.Currency = hypothecContract.CreditContractCurrency;
            List<Currency> listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.Currency)) ? true : false
                });
            }
            model.CreditContractInterestRate = hypothecContract.CreditContractInterestRate;
            model.Damages = hypothecContract.Damages;

            model.Cif = hypothecContract.Cif;
            model.TypeOfCompany = hypothecContract.TypeOfcompany;
            model.TypeOfCompanyID = hypothecContract.TypeOfCompanyID;
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            model.CompanyRegistrationNo = hypothecContract.CompRegistrationNo;
            model.CompanyName = hypothecContract.CompanyName;
            model.CompanyAddress = hypothecContract.CompanyAddress;
            model.CompanyDirector = hypothecContract.CompanyDirector;

            int countHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).Count();
            if(countHypothecator>0)
            {
                List<Hypothecator> listHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                                        && c.Language.Equals(hypothecContract.Language)).ToList();
                HypothecatorEng _listHypothecator;
                foreach (Hypothecator item in listHypothecator)
                {
                    _listHypothecator = new HypothecatorEng();
                    _listHypothecator.HypothecatorName = item.HypothecatorName;
                    _listHypothecator.HypothecatorSex = item.HypothecatorSex;
                    _listHypothecator.HypothecatorBirthDate = item.HypothecatorBirthDate;
                    _listHypothecator.HypothecatorNationality = item.HypothecatorNationality;
                    _listHypothecator.HypothecatorAddress = item.HypothecatorAddress;
                    _listHypothecator.HypothecatorVillage = item.HypothecatorVillage;
                    _listHypothecator.HypothecatorSangkat = item.HypothecatorSangkat;
                    _listHypothecator.HypothecatorKhan = item.HypothecatorKhan;
                    _listHypothecator.HypothecatorCapital = item.HypothecatorCapital;
                    model.listHypothecator.Add(_listHypothecator);
                }
            }
            Session["Hypothecator"] = model.listHypothecator;

            int countDetor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                            && c.Language.Equals(hypothecContract.Language)).Count();
            if (countDetor > 0)
            {
                Debtor detor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                            && c.Language.Equals(hypothecContract.Language)).FirstOrDefault();
                model.DebtorName = detor.DebtorName;
                model.DebtorBirthDate = detor.DebtorBirthDate;
                model.DebtorNationality = detor.DebtorNationality;
                model.DebtorAddress = detor.DebtorAddress;
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
            int countProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).Count();
            if (countProperty > 0)
            {
                List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).ToList();
                PropertyView proView;
                foreach (PropertyForHypothec item in _listProperty)
                {
                    proView = new PropertyView();
                    proView.TypeOfProperty = item.TypeOfProperty;
                    proView.Pacelnumber = item.Pacelnumber;
                    proView.Ownership = item.Ownership;
                    proView.TitleNumber = item.TitleNumber;
                    proView.TotalSize = item.TotalSize;
                    proView.Location = item.Location;
                    model.listProperty.Add(proView);
                }  
            }
            Session["Property"] = model.listProperty;
            List<string> listSex = db.Sexes.Select(c => c.NameEng).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
                });
            }
            model.HypothecatorBirthDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            return View(model);
        }

        // POST: HypothecContracts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CreateHypothecContractEng model)
        {
            List<string> listSex;
            List<TypeOfProperty> listProperty;
            List<Branch> listBranch;
            List<TypeOfCompany> listCompany;
            List<Currency> listCcy;
            List<TypeOfContract> listTypeOfContract;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = db.HypothecContracts.Find(model.ID);
                hypothecContract.ContractNo = model.ContractNoSecond;
                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).FirstOrDefault();
                hypothecContract.BranchDirector = model.BranchDirector;
                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.Damages = model.Damages;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;

                Debtor debtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals("English"))
                                                .FirstOrDefault();
                debtor.DebtorName = model.DebtorName;
                debtor.DebtorBirthDate = model.DebtorBirthDate;
                debtor.DebtorNationality = model.DebtorNationality;
                debtor.DebtorAddress = model.DebtorAddress;
                db.Entry(debtor).State = EntityState.Modified;
                db.SaveChanges();

                //Hypothecator
                if (Session["Hypothecator"] != null)
                {
                    List<Hypothecator> listHypothectorOld = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                                                && c.Language.Equals("English")).ToList();
                    foreach (Hypothecator item in listHypothectorOld)
                    {
                        db.Hypothecators.Remove(item);
                    }

                    List<HypothecatorEng> listHypothector = (List<HypothecatorEng>)Session["Hypothecator"];
                    Hypothecator hypothector;
                    foreach (HypothecatorEng item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");

                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeName,
                            Value = item.TypeName,
                            Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }

                    if (Session["Property"] != null)
                        model.listProperty = (List<PropertyView>)Session["Property"];
                    return View(model);
                }
                Session["Hypothecator"] = null;

                //Property
                if (Session["Property"] != null)
                {
                    List<PropertyForHypothec> listPropertyOld = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                                        && c.Language.Equals("English")).ToList();
                    foreach (PropertyForHypothec item in listPropertyOld)
                    {
                        db.PropertyForHypothecs.Remove(item);
                    }

                    List<PropertyView> listHypothecatedProperty = (List<PropertyView>)Session["Property"];
                    PropertyForHypothec property;
                    foreach (PropertyView item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");

                    listSex = db.Sexes.Select(c => c.NameEng).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchName,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.Name,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeName,
                            Value = item.TypeName,
                            Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }

                    if (Session["Hypothecator"] != null)
                        model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];

                    return View(model);
                }
                Session["Property"] = null;

                hypothecContract.FileName = "";
                hypothecContract.FileNameAnnex = "";
                db.Entry(hypothecContract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameEng).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID,
                    Selected = item.BranchID.Equals(model.BranchID) ? true : false
                });
            }
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = item.TypeName.Equals(model.TypeOfLoanContract) ? true : false
                });
            }

            if (Session["Hypothecator"] != null)
                model.listHypothecator = (List<HypothecatorEng>)Session["Hypothecator"];
            if (Session["Property"] != null)
                model.listProperty = (List<PropertyView>)Session["Property"];

            return View(model);
        }

        public ActionResult EditKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            if (hypothecContract == null)
            {
                return HttpNotFound();
            }
            CreateHypothecContractKhmer model = new CreateHypothecContractKhmer();
            model.ID = hypothecContract.ID;
            model.ContractNo = "temp";
            model.ContractNoSecond = hypothecContract.ContractNo;
            model.BranchID = hypothecContract.BranchID;
            model.BranchName = hypothecContract.BranchName;
            model.BranchDirector = hypothecContract.BranchDirector;
            List<Branch> listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchNameKhmer,
                    Value = item.BranchID,
                    Selected = (item.BranchID.Equals(model.BranchID)) ? true : false
                });
            }

            model.CreditContract = hypothecContract.CreditContract;
            model.CreditContractDate = hypothecContract.CreditContractDate;
            model.TypeOfLoanContract = hypothecContract.TypeOfLoanContract;
            List<TypeOfContract> listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeNameKhmer,
                    Value = item.TypeNameKhmer,
                    Selected = (item.TypeNameKhmer.Equals(model.TypeOfLoanContract)) ? true : false
                });
            }
            model.CreditContractAmount = hypothecContract.CreditContractAmount;
            model.Currency = hypothecContract.CreditContractCurrency;
            List<Currency> listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = (item.CurrencyID.Equals(model.Currency)) ? true : false
                });
            }
            model.CreditContractInterestRate = hypothecContract.CreditContractInterestRate;
            model.Damages = hypothecContract.Damages;

            model.Cif = hypothecContract.Cif;
            model.TypeOfCompany = hypothecContract.TypeOfcompany;
            model.TypeOfCompanyID = hypothecContract.TypeOfCompanyID;
            List<TypeOfCompany> listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            model.CompanyRegistrationNo = hypothecContract.CompRegistrationNo;
            model.CompanyName = hypothecContract.CompanyName;
            model.CompanyAddress = hypothecContract.CompanyAddress;
            model.CompanyDirector = hypothecContract.CompanyDirector;

            int countHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).Count();
            if (countHypothecator > 0)
            {
                List<Hypothecator> listHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                                        && c.Language.Equals(hypothecContract.Language)).ToList();
                HypothecatorKhmer _listHypothecator;
                foreach (Hypothecator item in listHypothecator)
                {
                    _listHypothecator = new HypothecatorKhmer();
                    _listHypothecator.HypothecatorName = item.HypothecatorName;
                    _listHypothecator.HypothecatorSex = item.HypothecatorSex;
                    _listHypothecator.HypothecatorBirthDate = item.HypothecatorBirthDate;
                    _listHypothecator.HypothecatorNationality = item.HypothecatorNationality;
                    _listHypothecator.HypothecatorAddress = item.HypothecatorAddress;
                    _listHypothecator.HypothecatorVillage = item.HypothecatorVillage;
                    _listHypothecator.HypothecatorSangkat = item.HypothecatorSangkat;
                    _listHypothecator.HypothecatorKhan = item.HypothecatorKhan;
                    _listHypothecator.HypothecatorCapital = item.HypothecatorCapital;
                    model.listHypothecator.Add(_listHypothecator);
                }
            }
            Session["HypothecatorKhmer"] = model.listHypothecator;

            int countDetor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                            && c.Language.Equals(hypothecContract.Language)).Count();
            if (countDetor > 0)
            {
                Debtor detor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                            && c.Language.Equals(hypothecContract.Language)).FirstOrDefault();
                model.DebtorName = detor.DebtorName;
                model.DebtorBirthDate = detor.DebtorBirthDate;
                model.DebtorNationality = detor.DebtorNationality;
                model.DebtorAddress = detor.DebtorAddress;
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
            int countProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).Count();
            if (countProperty > 0)
            {
                List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                        && c.Language.Equals(hypothecContract.Language)).ToList();
                PropertyViewKhmer proView;
                foreach (PropertyForHypothec item in _listProperty)
                {
                    proView = new PropertyViewKhmer();
                    proView.TypeOfProperty = item.TypeOfProperty;
                    proView.Pacelnumber = item.Pacelnumber;
                    proView.Ownership = item.Ownership;
                    proView.TitleNumber = item.TitleNumber;
                    proView.TotalSize = item.TotalSize;
                    proView.Location = item.Location;
                    model.listProperty.Add(proView);
                }
            }
            Session["PropertyKhmer"] = model.listProperty;

            List<string> listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
                });
            }
            model.HypothecatorBirthDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditKhmer(CreateHypothecContractKhmer model)
        {
            List<string> listSex;
            List<TypeOfProperty> listProperty;
            List<Branch> listBranch;
            List<TypeOfCompany> listCompany;
            List<Currency> listCcy;
            List<TypeOfContract> listTypeOfContract;
            if (ModelState.IsValid)
            {
                HypothecContract hypothecContract = db.HypothecContracts.Find(model.ID);
                hypothecContract.ContractNo = model.ContractNoSecond;
                hypothecContract.BranchID = model.BranchID;
                hypothecContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchNameKhmer).FirstOrDefault();
                hypothecContract.BranchDirector = model.BranchDirector;
                hypothecContract.CreditContract = model.CreditContract;
                hypothecContract.CreditContractDate = model.CreditContractDate;
                hypothecContract.TypeOfLoanContract = model.TypeOfLoanContract;
                hypothecContract.CreditContractAmount = model.CreditContractAmount;
                hypothecContract.CreditContractCurrency = model.Currency;
                hypothecContract.CreditContractInterestRate = model.CreditContractInterestRate;
                hypothecContract.Damages = model.Damages;

                hypothecContract.Cif = model.Cif;
                hypothecContract.CompanyName = model.CompanyName;
                hypothecContract.CompRegistrationNo = model.CompanyRegistrationNo;
                hypothecContract.CompanyAddress = model.CompanyAddress;
                hypothecContract.CompanyDirector = model.CompanyDirector;
                hypothecContract.TypeOfCompanyID = model.TypeOfCompanyID;

                Debtor debtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals("Khmer"))
                                                .FirstOrDefault();
                debtor.DebtorName = model.DebtorName;
                debtor.DebtorBirthDate = model.DebtorBirthDate;
                debtor.DebtorNationality = model.DebtorNationality;
                debtor.DebtorAddress = model.DebtorAddress;
                db.Entry(debtor).State = EntityState.Modified;
                db.SaveChanges();

                //Hypothecator
                if (Session["HypothecatorKhmer"] != null)
                {
                    List<Hypothecator> listHypothectorOld = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                                                && c.Language.Equals("Khmer")).ToList();
                    foreach (Hypothecator item in listHypothectorOld)
                    {
                        db.Hypothecators.Remove(item);
                    }

                    List<HypothecatorKhmer> listHypothector = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
                    Hypothecator hypothector;
                    foreach (HypothecatorKhmer item in listHypothector)
                    {
                        hypothector = new Hypothecator();
                        hypothector.HypothecatorName = item.HypothecatorName;
                        hypothector.HypothecatorSex = item.HypothecatorSex;
                        hypothector.HypothecatorBirthDate = item.HypothecatorBirthDate;
                        hypothector.HypothecatorNationality = item.HypothecatorNationality;
                        hypothector.HypothecatorAddress = item.HypothecatorAddress;
                        hypothector.HypothecatorVillage = item.HypothecatorVillage;
                        hypothector.HypothecatorSangkat = item.HypothecatorSangkat;
                        hypothector.HypothecatorKhan = item.HypothecatorKhan;
                        hypothector.HypothecatorCapital = item.HypothecatorCapital;
                        hypothector.Language = hypothecContract.Language;
                        hypothector.HypothecContract = hypothecContract.ContractNo;
                        db.Hypothecators.Add(hypothector);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Hypothecator");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchNameKhmer,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeNameKhmer,
                            Value = item.TypeNameKhmer,
                            Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }

                    if (Session["PropertyKhmer"] != null)
                        model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    return View(model);
                }
                Session["HypothecatorKhmer"] = null;

                //Property
                if (Session["PropertyKhmer"] != null)
                {
                    List<PropertyForHypothec> listPropertyOld = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                                        && c.Language.Equals("Khmer")).ToList();
                    foreach (PropertyForHypothec item in listPropertyOld)
                    {
                        db.PropertyForHypothecs.Remove(item);
                    }

                    List<PropertyViewKhmer> listHypothecatedProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];
                    PropertyForHypothec property;
                    foreach (PropertyViewKhmer item in listHypothecatedProperty)
                    {
                        property = new PropertyForHypothec();
                        property.ContractNo = hypothecContract.CreditContract;
                        property.Language = hypothecContract.Language;
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.HypothecContractNo = hypothecContract.ContractNo;
                        db.PropertyForHypothecs.Add(property);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Property");

                    listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
                    foreach (string item in listSex)
                    {
                        model.SexItems.Add(new SelectListItem
                        {
                            Text = item,
                            Value = item
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
                    listBranch = db.Branches.ToList();
                    foreach (Branch item in listBranch)
                    {
                        model.BranchItems.Add(new SelectListItem
                        {
                            Text = item.BranchNameKhmer,
                            Value = item.BranchID,
                            Selected = item.BranchID.Equals(model.BranchID) ? true : false
                        });
                    }
                    listCompany = db.TypeOfCompanies.ToList();
                    foreach (TypeOfCompany item in listCompany)
                    {
                        model.CompanyItems.Add(new SelectListItem
                        {
                            Text = item.NameKhmer,
                            Value = item.ID.ToString(),
                            Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                        });
                    }
                    listCcy = db.Currencies.ToList();
                    foreach (Currency item in listCcy)
                    {
                        model.CCyItems.Add(new SelectListItem
                        {
                            Text = item.CurrencyName,
                            Value = item.CurrencyID,
                            Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                        });
                    }
                    listTypeOfContract = db.TypeOfContracts.ToList();
                    foreach (TypeOfContract item in listTypeOfContract)
                    {
                        model.TypeLoanContractItems.Add(new SelectListItem
                        {
                            Text = item.TypeNameKhmer,
                            Value = item.TypeNameKhmer,
                            Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                        });
                    }

                    if (Session["HypothecatorKhmer"] != null)
                        model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];

                    return View(model);
                }
                Session["PropertyKhmer"] = null;

                hypothecContract.FileName = "";
                hypothecContract.FileNameAnnex = "";
                db.Entry(hypothecContract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listSex = db.Sexes.Select(c => c.NameKhmer).ToList();
            foreach (string item in listSex)
            {
                model.SexItems.Add(new SelectListItem
                {
                    Text = item,
                    Value = item
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
            listBranch = db.Branches.ToList();
            foreach (Branch item in listBranch)
            {
                model.BranchItems.Add(new SelectListItem
                {
                    Text = item.BranchName,
                    Value = item.BranchID,
                    Selected = item.BranchID.Equals(model.BranchID) ? true : false
                });
            }
            listCompany = db.TypeOfCompanies.ToList();
            foreach (TypeOfCompany item in listCompany)
            {
                model.CompanyItems.Add(new SelectListItem
                {
                    Text = item.NameKhmer,
                    Value = item.ID.ToString(),
                    Selected = item.ID.ToString().Equals(model.TypeOfCompanyID.ToString()) ? true : false
                });
            }
            listCcy = db.Currencies.ToList();
            foreach (Currency item in listCcy)
            {
                model.CCyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            listTypeOfContract = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listTypeOfContract)
            {
                model.TypeLoanContractItems.Add(new SelectListItem
                {
                    Text = item.TypeNameKhmer,
                    Value = item.TypeNameKhmer,
                    Selected = item.TypeNameKhmer.Equals(model.TypeOfLoanContract) ? true : false
                });
            }

            if (Session["HypothecatorKhmer"] != null)
                model.listHypothecator = (List<HypothecatorKhmer>)Session["HypothecatorKhmer"];
            if (Session["PropertyKhmer"] != null)
                model.listProperty = (List<PropertyViewKhmer>)Session["PropertyKhmer"];

            return View(model);
        }

        // GET: HypothecContracts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            if (hypothecContract == null)
            {
                return HttpNotFound();
            }
            CreateHypothecContractEng model = new CreateHypothecContractEng();
            model.ID = hypothecContract.ID;
            model.ContractNo = hypothecContract.ContractNo;
            model.CreditContract = hypothecContract.CreditContract;
            model.TypeOfLoanContract = hypothecContract.TypeOfLoanContract;
            model.CreditContractDate = hypothecContract.CreditContractDate;
            model.CreditContractAmount = hypothecContract.CreditContractAmount;
            model.CreditContractInterestRate = hypothecContract.CreditContractInterestRate;
            model.Currency = hypothecContract.CreditContractCurrency;
            model.Damages = hypothecContract.Damages;

            model.BranchName = hypothecContract.BranchName;
            model.BranchDirector = hypothecContract.BranchDirector;

            model.Cif = hypothecContract.Cif;
            model.CompanyName = hypothecContract.CompanyName;
            model.CompanyAddress = hypothecContract.CompanyAddress;
            model.CompanyRegistrationNo = hypothecContract.CompRegistrationNo;
            model.CompanyDirector = hypothecContract.CompanyDirector;
            model.TypeOfCompany = hypothecContract.TypeOfcompany;
            
            
            List<Hypothecator> _listHypothector = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                                    .ToList();
            if (_listHypothector.Count > 0)
            {
                HypothecatorEng hypothecator;
                foreach (Hypothecator item in _listHypothector)
                {
                    hypothecator = new HypothecatorEng();
                    hypothecator.HypothecatorName = item.HypothecatorName;
                    hypothecator.HypothecatorSex = item.HypothecatorSex;
                    hypothecator.HypothecatorBirthDate = item.HypothecatorBirthDate;
                    hypothecator.HypothecatorNationality = item.HypothecatorNationality;
                    hypothecator.HypothecatorAddress = item.HypothecatorAddress;
                    hypothecator.HypothecatorVillage = item.HypothecatorVillage;
                    hypothecator.HypothecatorSangkat = item.HypothecatorSangkat;
                    hypothecator.HypothecatorKhan = item.HypothecatorKhan;
                    hypothecator.HypothecatorCapital = item.HypothecatorCapital;
                    model.listHypothecator.Add(hypothecator);
                }
            }
            //List<Debtor> _listDebtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
            //                                        .ToList();
            //if (_listDebtor.Count > 0)
            //{
            //    DebtorEng debtor;
            //    foreach (Debtor item in _listDebtor)
            //    {
            //        debtor = new DebtorEng();
            //        debtor.DebtorName = item.DebtorName;
            //        debtor.DebtorSex = item.DebtorSex;
            //        debtor.DebtorBirthDate = item.DebtorBirthDate;
            //        debtor.DebtorNationality = item.DebtorNationality;
            //        debtor.DebtorAddress = item.DebtorAddress;
            //        debtor.DebtorVillage = item.DebtorVillage;
            //        debtor.DebtorSangkat = item.DebtorSangkat;
            //        debtor.DebtorKhan = item.DebtorKhan;
            //        debtor.DebtorCapital = item.DebtorCapital;
            //        model.listDebtor.Add(debtor);
            //    }
            //}
            Debtor debtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                .FirstOrDefault();
            model.DebtorAddress = debtor.DebtorAddress;
            model.DebtorBirthDate = debtor.DebtorBirthDate;
            model.DebtorNationality = debtor.DebtorNationality;
            model.DebtorName = debtor.DebtorName;

            List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.ContractNo.Equals(hypothecContract.CreditContract) && c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                && c.Language.Equals(hypothecContract.Language)).ToList();
            if (_listProperty.Count > 0)
            {
                PropertyView property;
                foreach (PropertyForHypothec item in _listProperty)
                {
                    property = new PropertyView();
                    property.Pacelnumber = item.Pacelnumber;
                    property.TitleNumber = item.TitleNumber;
                    property.Ownership = item.Ownership;
                    property.TotalSize = item.TotalSize;
                    property.Location = item.Location;
                    property.TypeOfProperty = item.TypeOfProperty;
                    model.listProperty.Add(property);
                }
            }

            return View(model);
        }

        // POST: HypothecContracts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            List<Hypothecator> _listHypothector = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                                    .ToList();
            foreach (Hypothecator item in _listHypothector)
            {
                db.Hypothecators.Remove(item);
            }
            List<Debtor> _listDebtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                    .ToList();
            foreach (Debtor item in _listDebtor)
            {
                db.Debtors.Remove(item);
            }
            List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.ContractNo.Equals(hypothecContract.CreditContract) && c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                && c.Language.Equals(hypothecContract.Language)).ToList();
            foreach (PropertyForHypothec item in _listProperty)
            {
                db.PropertyForHypothecs.Remove(item);
            }
            db.HypothecContracts.Remove(hypothecContract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DeleteKhmer(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            if (hypothecContract == null)
            {
                return HttpNotFound();
            }
            CreateHypothecContractKhmer model = new CreateHypothecContractKhmer();
            model.ID = hypothecContract.ID;
            model.ContractNo = hypothecContract.ContractNo;
            model.CreditContract = hypothecContract.CreditContract;
            model.TypeOfLoanContract = hypothecContract.TypeOfLoanContract;
            model.CreditContractDate = hypothecContract.CreditContractDate;
            model.CreditContractAmount = hypothecContract.CreditContractAmount;
            model.CreditContractInterestRate = hypothecContract.CreditContractInterestRate;
            model.Currency = hypothecContract.CreditContractCurrency;
            model.Damages = hypothecContract.Damages;

            model.BranchName = hypothecContract.BranchName;
            model.BranchDirector = hypothecContract.BranchDirector;

            model.Cif = hypothecContract.Cif;
            model.CompanyName = hypothecContract.CompanyName;
            model.CompanyAddress = hypothecContract.CompanyAddress;
            model.CompanyRegistrationNo = hypothecContract.CompRegistrationNo;
            model.CompanyDirector = hypothecContract.CompanyDirector;
            model.TypeOfCompany = hypothecContract.TypeOfcompany;


            List<Hypothecator> _listHypothector = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                                    .ToList();
            if (_listHypothector.Count > 0)
            {
                HypothecatorKhmer hypothecator;
                foreach (Hypothecator item in _listHypothector)
                {
                    hypothecator = new HypothecatorKhmer();
                    hypothecator.HypothecatorName = item.HypothecatorName;
                    hypothecator.HypothecatorSex = item.HypothecatorSex;
                    hypothecator.HypothecatorBirthDate = item.HypothecatorBirthDate;
                    hypothecator.HypothecatorNationality = item.HypothecatorNationality;
                    hypothecator.HypothecatorAddress = item.HypothecatorAddress;
                    hypothecator.HypothecatorVillage = item.HypothecatorVillage;
                    hypothecator.HypothecatorSangkat = item.HypothecatorSangkat;
                    hypothecator.HypothecatorKhan = item.HypothecatorKhan;
                    hypothecator.HypothecatorCapital = item.HypothecatorCapital;
                    model.listHypothecator.Add(hypothecator);
                }
            }
            //List<Debtor> _listDebtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
            //                                        .ToList();
            //if (_listDebtor.Count > 0)
            //{
            //    DebtorKhmer debtor;
            //    foreach (Debtor item in _listDebtor)
            //    {
            //        debtor = new DebtorKhmer();
            //        debtor.DebtorName = item.DebtorName;
            //        debtor.DebtorSex = item.DebtorSex;
            //        debtor.DebtorBirthDate = item.DebtorBirthDate;
            //        debtor.DebtorNationality = item.DebtorNationality;
            //        debtor.DebtorAddress = item.DebtorAddress;
            //        debtor.DebtorVillage = item.DebtorVillage;
            //        debtor.DebtorSangkat = item.DebtorSangkat;
            //        debtor.DebtorKhan = item.DebtorKhan;
            //        debtor.DebtorCapital = item.DebtorCapital;
            //        model.listDebtor.Add(debtor);
            //    }
            //}
            Debtor debtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                && c.Language.Equals(hypothecContract.Language)).FirstOrDefault();
            model.DebtorAddress = debtor.DebtorAddress;
            model.DebtorBirthDate = debtor.DebtorBirthDate;
            model.DebtorNationality = debtor.DebtorNationality;
            model.DebtorName = debtor.DebtorName;

            List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.ContractNo.Equals(hypothecContract.CreditContract) && c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                && c.Language.Equals(hypothecContract.Language)).ToList();
            if (_listProperty.Count > 0)
            {
                PropertyViewKhmer property;
                foreach (PropertyForHypothec item in _listProperty)
                {
                    property = new PropertyViewKhmer();
                    property.Pacelnumber = item.Pacelnumber;
                    property.TitleNumber = item.TitleNumber;
                    property.Ownership = item.Ownership;
                    property.TotalSize = item.TotalSize;
                    property.Location = item.Location;
                    property.TypeOfProperty = item.TypeOfProperty;
                    model.listProperty.Add(property);
                }
            }

            return View(model);
        }

        [HttpPost, ActionName("DeleteKhmer")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteKhmerConfirmed(int id)
        {
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            List<Hypothecator> _listHypothector = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                                    .ToList();
            foreach (Hypothecator item in _listHypothector)
            {
                db.Hypothecators.Remove(item);
            }
            List<Debtor> _listDebtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                    .ToList();
            foreach (Debtor item in _listDebtor)
            {
                db.Debtors.Remove(item);
            }
            List<PropertyForHypothec> _listProperty = db.PropertyForHypothecs.Where(c => c.ContractNo.Equals(hypothecContract.CreditContract) && c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                                && c.Language.Equals(hypothecContract.Language)).ToList();
            foreach (PropertyForHypothec item in _listProperty)
            {
                db.PropertyForHypothecs.Remove(item);
            }
            db.HypothecContracts.Remove(hypothecContract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        internal void CreateAnnexHypothecDoc(HypothecContract hypothecContract)
        {
            List<PropertyForHypothec> listProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo) 
                                  && c.ContractNo.Equals(hypothecContract.CreditContract) && c.Language.Equals(hypothecContract.Language)).ToList();
            List<string> listHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo) && c.Language.Equals(hypothecContract.Language))
                                                                .Select(c=>c.HypothecatorName).ToList();

            string templateFileName = "AnnexHypothec.docx";
            string templatePath = "";
            if(hypothecContract.Language.Equals("English"))
                templatePath = Server.MapPath("~/Template/English/" + templateFileName);
            else
                templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            Spire.Doc.Section section;
            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            string listNameHypothecator = "";
            string HypothecName = "";
            int j = 0;
            foreach (string item in listHypothecator)
            {
                if (j == (listHypothecator.Count - 1))
                    listNameHypothecator += item.ToUpper();
                else
                    listNameHypothecator += item.ToUpper() + " - ";
                j++;
                HypothecName += item.ToUpper() + "\n\n\n\n\n\n\n\n\n\n";
            }
            replaceDict.Add("[Hypothecator]", listNameHypothecator);
            replaceDict.Add("[HypothecName]", HypothecName);

            replaceDict.Add("[Branch]", hypothecContract.BranchName);
            replaceDict.Add("[HypothecDate]", hypothecContract.CreateDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[ContractNo]", hypothecContract.ContractNo);
            replaceDict.Add("[CompanyName]", hypothecContract.CompanyName);
            replaceDict.Add("[TypeOfCompany]", hypothecContract.TypeOfcompany);
            replaceDict.Add("[ComNumber]", hypothecContract.CompRegistrationNo);
            replaceDict.Add("[ComAddr]", hypothecContract.CompanyAddress);
            replaceDict.Add("[ComDirector]", hypothecContract.CompanyDirector);
            replaceDict.Add("[CreditContractDate]", hypothecContract.CreditContractDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[TypeLoan]", hypothecContract.TypeOfLoanContract);
            replaceDict.Add("[Amount]", hypothecContract.CreditContractAmount.ToString("###,###,###.00") + " " + hypothecContract.CreditContractCurrency);
            
            string CcyWord = "";
            if (hypothecContract.Language.Equals("English"))
            {
                replaceDict.Add("[BrDirector]", "Mr." + hypothecContract.BranchDirector);
                if (hypothecContract.CreditContractCurrency.Equals("USD"))
                    CcyWord = "United States Dollar";
                else
                    CcyWord = " Khmer Riel";
                string loanAdmountWord = new Utility().EngNumberToWords((int)hypothecContract.CreditContractAmount);
                replaceDict.Add("[AmountWords]", loanAdmountWord + CcyWord);
            }
            else
            {
                replaceDict.Add("[BrDirector]", hypothecContract.BranchDirector);
                if (hypothecContract.CreditContractCurrency.Equals("USD"))
                    CcyWord = " ដុល្លារអាមេរិក";
                else
                    CcyWord = " រៀល";
                string loanAdmountWord = new Utility().KhmerNumberToWords((int)hypothecContract.CreditContractAmount);
                replaceDict.Add("[AmountWords]", loanAdmountWord + CcyWord);
            }
            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            int numberOfProperty = listProperty.Count;
            int i = 1;
            if (numberOfProperty > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[Property]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfProperty + 1, 6);

                table.Rows[0].Cells[0].Width = 30F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 85F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 85F;
                table.Rows[0].Cells[5].Width = 85F;
                //Create Header
                String[] Header;
                if (hypothecContract.Language.Equals("English"))
                {
                    Header = new String[] { "N", "Pacel number", "Title deed number", "Ownership", "Total Size (m2)","Location" };
                }
                else
                {
                    Header = new String[] { "ល.រ", "លេខប៉ាក់", "លេខចំណងជើង", "ភាពជាម្ចាស់", "ទំហំ (ម2)", "ទីតាំង" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (hypothecContract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (PropertyForHypothec item in listProperty)
                {
                    table.Rows[i].Cells[0].Width = 30F;
                    table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 85F;
                    table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = 85F;
                    table.Rows[i].Cells[5].Width = 85F;
                    TableRow DataRow = table.Rows[i];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
                    if (hypothecContract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Pacelnumber);
                    t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 10;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.TitleNumber);
                    t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 10;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.Ownership);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TotalSize);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    t4.CharacterFormat.FontSize = 11;
                    p4.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p5 = DataRow.Cells[5].AddParagraph();
                    Spire.Doc.Fields.TextRange t5 = p5.AppendText(item.Location);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t5.CharacterFormat.FontName = "Khmer OS Battambang";
                    t5.CharacterFormat.FontSize = 11;
                    p5.Format.AfterSpacing = 0;
                    i++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[Property]", "", false, true);

            Spire.Doc.PictureWatermark picture = new Spire.Doc.PictureWatermark();
            picture.Picture = System.Drawing.Image.FromFile(Server.MapPath("~/Content/themes/base/images/Logo.png"));
            picture.Scaling = 100;
            picture.IsWashout = true;
            doc.Watermark = picture;

            string wordFileName = "AnnexHypothec_" + hypothecContract.Cif + "_" + hypothecContract.BranchID + " "
                                        + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + wordFileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            //doc.Close();

            object missing = Missing.Value;
            Microsoft.Office.Interop.Word.Application wordApp = new Application();
            //wordApp.Visible = false;
            object readOnly = false;
            object osVisible = true;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            Object filename = (Object)wordFilePath;
            //string wordFilePath = Server.MapPath("~/Reports/" + hypothecContract.FileNameAnnex);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            hypothecContract.FileNameAnnex = wordFileName.Replace(".docx",".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileNameAnnex);
            object fileFormat = WdSaveFormat.wdFormatPDF;
            object outPutFileName = fileExportNamePath;
            aDoc.SaveAs2(ref outPutFileName, ref fileFormat, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing,
                                ref missing, ref missing, ref missing, ref missing, ref missing, ref missing);
            //wordApp.Documents.Close();
            object saveChanges = WdSaveOptions.wdDoNotSaveChanges;
            aDoc.Close(ref saveChanges, ref missing, ref missing);
            aDoc = null;
            wordApp.Quit(ref missing, ref missing, ref missing);
            wordApp = null;

            db.Entry(hypothecContract).State = EntityState.Modified;
            db.SaveChanges();
        }

        internal void CreateHypothecDoc(HypothecContract hypothecContract)
        {
            List<PropertyForHypothec> listProperty = db.PropertyForHypothecs.Where(c => c.HypothecContractNo.Equals(hypothecContract.ContractNo)
                                   && c.ContractNo.Equals(hypothecContract.CreditContract) && c.Language.Equals(hypothecContract.Language)).ToList();
            List<Hypothecator> listHypothecator = db.Hypothecators.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                    && c.Language.Equals(hypothecContract.Language)).ToList();
            List<Debtor> listDebtor = db.Debtors.Where(c => c.HypothecContract.Equals(hypothecContract.ContractNo)
                                                    && c.Language.Equals(hypothecContract.Language)).ToList();
            Branch branch = db.Branches.Where(c => c.BranchID.Equals(hypothecContract.BranchID)).SingleOrDefault();

            string templateFileName = "Hypothec.docx";
            string templatePath = "";
            if (hypothecContract.Language.Equals("English"))
                templatePath = Server.MapPath("~/Template/English/" + templateFileName);
            else
                templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            Spire.Doc.Section section;
            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            string listNameHypothecator = "";
            string listNamedebtor = "";
            string HypothecName = "";
            replaceDict.Add("[ContractNo]", hypothecContract.ContractNo);
            
            replaceDict.Add("[BrNumber]", branch.BranchRegistrationNo);
            replaceDict.Add("[BrDate]", branch.BranchRegisrationDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[BrPhone]", branch.Telephone);
            replaceDict.Add("[BrFax]", branch.Fax);
            replaceDict.Add("[BrEmail]", branch.Email);
            
            replaceDict.Add("[CompanyName]", hypothecContract.CompanyName);
            replaceDict.Add("[TypeOfCompany]", hypothecContract.TypeOfcompany);
            replaceDict.Add("[ComNumber]", hypothecContract.CompRegistrationNo);
            replaceDict.Add("[ComAddr]", hypothecContract.CompanyAddress);
            replaceDict.Add("[ComDirector]", hypothecContract.CompanyDirector);
            replaceDict.Add("[CreditContractDate]", hypothecContract.CreditContractDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[CreditContract]", hypothecContract.CreditContract);
            replaceDict.Add("[Amount]", hypothecContract.CreditContractAmount.ToString("###,###,###.00") + " " + hypothecContract.CreditContractCurrency);
            replaceDict.Add("[Interest]", hypothecContract.CreditContractInterestRate.ToString());
            replaceDict.Add("[Damage]", hypothecContract.Damages.ToString());
            string CcyWord = "";

            if (hypothecContract.Language.Equals("English"))
            {
                replaceDict.Add("[BrDirector]", "Mr." + hypothecContract.BranchDirector);
                foreach (Hypothecator item in listHypothecator)
                {
                    listNameHypothecator += "Name: " + item.HypothecatorName + " - Sex: " + item.HypothecatorSex + ". \n- Date of Birth: " + item.HypothecatorBirthDate.ToString("dd/MM/yyyy")
                        + " - Nationality: " + item.HypothecatorNationality + ". \n- Address: " + item.HypothecatorAddress + " - " + item.HypothecatorVillage
                        + " - " + item.HypothecatorSangkat + " - " + item.HypothecatorKhan
                        + " - " + item.HypothecatorCapital + ". \n ";
                    HypothecName += item.HypothecatorName.ToUpper() + "\n\n\n\n\n\n\n\n\n\n";
                }
                replaceDict.Add("[Hypothecator]", listNameHypothecator);
                replaceDict.Add("[HypothecName]", HypothecName);
                
                foreach (Debtor item in listDebtor)
                {
                    listNamedebtor += "- Name: " + item.DebtorName + ". \n- Registration date: " + item.DebtorBirthDate.ToString("dd/MM/yyyy")
                        + " - Registration No: " + item.DebtorNationality + ". \n- Address: " + item.DebtorAddress;
                }
                replaceDict.Add("[Debtor]", listNamedebtor);
                replaceDict.Add("[Branch]", branch.BranchName);
                replaceDict.Add("[BrAddr]", branch.BranchAddress);
                if (hypothecContract.CreditContractCurrency.Equals("USD"))
                    CcyWord = " United States Dollar";
                else
                    CcyWord = " Khmer Riel";

                string loanAdmountWord = new Utility().EngNumberToWords((int)hypothecContract.CreditContractAmount);
                replaceDict.Add("[AmountWords]", loanAdmountWord + CcyWord);
                string InterestWord = new Utility().EngNumberToWords((int)hypothecContract.CreditContractInterestRate);
                replaceDict.Add("[InterestWord]", InterestWord);
                string DamageWord = new Utility().EngNumberToWords((int)hypothecContract.Damages);
                replaceDict.Add("[DWord]", DamageWord);
            }
            else
            {
                replaceDict.Add("[BrDirector]", hypothecContract.BranchDirector);
                foreach (Hypothecator item in listHypothecator)
                {
                    listNameHypothecator += " ឈ្មោះ: " + item.HypothecatorName + " - ភេទ: " + item.HypothecatorSex + " ថ្ងៃកំណើត: " + item.HypothecatorBirthDate.ToString("dd/MM/yyyy")
                        + " សញ្ជាតិ: " + item.HypothecatorNationality + " អាសយដ្ឋាន: " + item.HypothecatorAddress + " - " + item.HypothecatorVillage
                        + " - " + item.HypothecatorSangkat + " - " + item.HypothecatorKhan
                        + " - " + item.HypothecatorCapital + ". \n ";
                    HypothecName += item.HypothecatorName + "\n\n\n\n\n\n\n\n\n\n";
                }
                replaceDict.Add("[Hypothecator]", listNameHypothecator);
                replaceDict.Add("[HypothecName]", HypothecName);
                foreach (Debtor item in listDebtor)
                {
                    listNamedebtor += "- ឈ្មោះ: " + item.DebtorName + " ថ្ងៃចុះបញ្ជី: " + item.DebtorBirthDate.ToString("dd/MM/yyyy")
                        + " លេខចុះបញ្ជី: " + item.DebtorNationality + " អាសយដ្ឋាន: " + item.DebtorAddress + ". \n ";
                }
                replaceDict.Add("[Debtor]", listNamedebtor);
                replaceDict.Add("[Branch]", branch.BranchNameKhmer);
                replaceDict.Add("[BrAddr]", branch.BranchAddressKhmer);
                if (hypothecContract.CreditContractCurrency.Equals("USD"))
                    CcyWord = " ដុល្លារអាមេរិក";
                else
                    CcyWord = " រៀល";
                string loanAdmountWord = new Utility().KhmerNumberToWords((int)hypothecContract.CreditContractAmount);
                replaceDict.Add("[AmountWords]", loanAdmountWord + CcyWord);
                string InterestWord = new Utility().KhmerNumberToWords((int)hypothecContract.CreditContractInterestRate);
                replaceDict.Add("[InterestWord]", InterestWord);
                string DamageWord = new Utility().KhmerNumberToWords((int)hypothecContract.Damages);
                replaceDict.Add("[DWord]", DamageWord);
            }
            
            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            int numberOfProperty = listProperty.Count;
            int i = 1;
            if (numberOfProperty > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[Property]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOfProperty + 1, 6);

                table.Rows[0].Cells[0].Width = 25F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 85F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 85F;
                table.Rows[0].Cells[5].Width = 85F;
                //Create Header
                String[] Header;
                if (hypothecContract.Language.Equals("English"))
                {
                    Header = new String[] { "No.", "Pacel number", "Title deed number", "Ownership", "Total Size (m2)", "Location" };
                }
                else
                {
                    Header = new String[] { "ល.រ", "លេខក្បាលដី", "លេខបណ្ណ៍", "កម្មសិទ្ធករ", "ទំហំ (ម2)", "ទីតាំង" };
                }

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    if (hypothecContract.Language.Equals("Khmer"))
                        TR.CharacterFormat.FontName = "Khmer OS Battambang";
                    else
                        TR.CharacterFormat.FontName = "Times New Roman";
                    TR.CharacterFormat.FontSize = 11;
                    p.Format.AfterSpacing = 0;
                }
                foreach (PropertyForHypothec item in listProperty)
                {
                    table.Rows[i].Cells[0].Width = 25F;
                    table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 85F;
                    table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = 85F;
                    table.Rows[i].Cells[5].Width = 85F;
                    TableRow DataRow = table.Rows[i];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
                    if (hypothecContract.Language.Equals("Khmer"))
                        t0.CharacterFormat.FontName = "Khmer OS Battambang";
                    else
                        t0.CharacterFormat.FontName = "Times New Roman";
                    t0.CharacterFormat.FontSize = 11;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Pacelnumber);
                    t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    t1.CharacterFormat.FontSize = 11;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.TitleNumber);
                    t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    t2.CharacterFormat.FontSize = 11;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.Ownership);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t3.CharacterFormat.FontName = "Khmer OS Battambang";
                    else
                        t3.CharacterFormat.FontName = "Times New Roman";
                    t3.CharacterFormat.FontSize = 11;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TotalSize);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t4.CharacterFormat.FontName = "Khmer OS Battambang";
                    else
                        t4.CharacterFormat.FontName = "Times New Roman";
                    t4.CharacterFormat.FontSize = 11;
                    p4.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p5 = DataRow.Cells[5].AddParagraph();
                    Spire.Doc.Fields.TextRange t5 = p5.AppendText(item.Location);
                    if (hypothecContract.Language.Equals("Khmer"))
                        t5.CharacterFormat.FontName = "Khmer OS Battambang";
                    else
                        t5.CharacterFormat.FontName = "Times New Roman";
                    t5.CharacterFormat.FontSize = 11;
                    p5.Format.AfterSpacing = 0;
                    i++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[Property]", "", false, true);

            Spire.Doc.PictureWatermark picture = new Spire.Doc.PictureWatermark();
            picture.Picture = System.Drawing.Image.FromFile(Server.MapPath("~/Content/themes/base/images/Logo.png"));
            picture.Scaling = 100;
            picture.IsWashout = true;
            doc.Watermark = picture;

            string wordFileName = "Hypothec_" + hypothecContract.Cif + "_" + hypothecContract.BranchID + " "
                                        + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + wordFileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            

            object missing = Missing.Value;
            Microsoft.Office.Interop.Word.Application wordApp = new Application();
            //wordApp.Visible = false;
            object readOnly = false;
            object osVisible = true;
            Microsoft.Office.Interop.Word.Document aDoc = null;
            Object filename = (Object)wordFilePath;
            //string wordFilePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            hypothecContract.FileName = wordFileName.Replace(".docx", ".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
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

            //hypothecContract.FileName = "Hypothec_" + hypothecContract.Cif + "_" + hypothecContract.BranchID + " "
            //                            + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".pdf";
            //string wordFilePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
            //doc.SaveToFile(wordFilePath, FileFormat.PDF);
            //doc.Close();

            db.Entry(hypothecContract).State = EntityState.Modified;
            db.SaveChanges();

        }

        public FileContentResult GenerateHypothec(int? id)
        {
            string fileExportNamePath = "";
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            
            if (!string.IsNullOrEmpty(hypothecContract.FileName))
            {
                fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
            }
            else
            {
                CreateHypothecDoc(hypothecContract);
                fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
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

        public FileContentResult GenerateAnnexHypothec(int? id)
        {
            string fileExportNamePath = "";
            HypothecContract hypothecContract = db.HypothecContracts.Find(id);
            
            if (!string.IsNullOrEmpty(hypothecContract.FileNameAnnex))
            {
                fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileNameAnnex);
            }
            else
            {
                CreateAnnexHypothecDoc(hypothecContract);
                fileExportNamePath = Server.MapPath("~/Reports/" + hypothecContract.FileNameAnnex);
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
