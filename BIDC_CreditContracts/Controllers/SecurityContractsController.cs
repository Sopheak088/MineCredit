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
using Spire.Doc;
using System.Reflection;
using Microsoft.Office.Interop.Word;
using BIDC_CreditContracts.Repositories;
using System.Web.Security;
using System.Web.Profile;

namespace BIDC_CreditContracts.Controllers
{
    public class SecurityContractsController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: SecurityContracts
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
        public ActionResult Search(SearchSecurityContract model)
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
            SearchSecurityContract model = new SearchSecurityContract();
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
                model.listSecurityContractEng = db.SecurityContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                    && c.Language.Equals("English")).OrderByDescending(c => c.CreateDate).ToList();
                model.listSecurityContractKhmer = db.SecurityContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                        && c.Language.Equals("Khmer")).OrderByDescending(c => c.CreateDate).ToList();
            }
            else
            {
                model.listSecurityContractEng = db.SecurityContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                    && c.Language.Equals("English") && c.BranchID.Equals(branchId)).OrderByDescending(c => c.CreateDate).ToList();
                model.listSecurityContractKhmer = db.SecurityContracts.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0
                                                        && c.Language.Equals("Khmer") && c.BranchID.Equals(branchId)).OrderByDescending(c => c.CreateDate).ToList();
            }
            
            return View(model);
        }

        // GET: SecurityContracts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SecurityContract securityContract = db.SecurityContracts.Find(id);
            if (securityContract == null)
            {
                return HttpNotFound();
            }
            return View(securityContract);
        }

        public ActionResult CreateStep1()
        {
            CreateSecurityContractStep1 model = new CreateSecurityContractStep1();
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
        public ActionResult CreateStep1(CreateSecurityContractStep1 model)
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
            CreateSecurityContractStep2Eng model = new CreateSecurityContractStep2Eng();
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
        public ActionResult CreateStep2Eng(CreateSecurityContractStep2Eng model)
        {
            Session["CifCustomer"] = model.Cif;
            Session["CreditContract"] = model.CreditContract;
            if (model.CreditContract.Equals("Other"))
                return RedirectToAction("CreateNoContract");
            else
                return RedirectToAction("Create");
        }

        // GET: SecurityContracts/Create
        public ActionResult Create()
        {
            SecurityContractEng model = new SecurityContractEng();
            model.Cif = (string)Session["CifCustomer"];
            Session["Security"] = null;
            model.CreditContract = (string)Session["CreditContract"];
            try
            {
                Contract creditContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("English"))
                                                        .Include(c => c.TypeOfContract).SingleOrDefault();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(creditContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                model.CreditContractDate = creditContract.ContractDate;
                model.TypeOfLoanContract = creditContract.TypeOfContract.TypeName;
                model.BranchID = creditContract.BranchID;
                model.BranchName = creditContract.BranchName;
                model.BranchRepresented = creditContract.BranchDirector;
                model.BranchPosition = creditContract.BranchPosition;

                int countSecurityContract = db.SecurityContracts.Where(c => c.Language.Equals("English")).Count() + 1;
                if (countSecurityContract < 10)
                    model.ContractNo = "0" + countSecurityContract + "/" + DateTime.Now.Year + "/SC/" + branchStandfor + "/";
                else
                    model.ContractNo = countSecurityContract + "/" + DateTime.Now.Year + "/SC/" + branchStandfor + "/";
                
                int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).Count();
                if (countCompany > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).SingleOrDefault();
                    model.CompanyName = company.CompanyName;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.CompanyAddress = company.CompanyAddress;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.CompanyDirector = company.CompanyDirector;
                    model.CompanyPosition = company.Position;
                }
                model.IssuedDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                model.PropertyEvaluationDate = model.SecurityAgreementDate = DateTime.Today;
                
                return View(model);
            }
            catch
            {
                return RedirectToAction("CreateStep1");
            }
        }

        // POST: SecurityContracts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(SecurityContractEng model)
        {
            if (ModelState.IsValid)
            {
                SecurityContract securityContract = new SecurityContract();
                securityContract.CreditContract = model.CreditContract;
                securityContract.Language = "English";
                securityContract.CreateDate = DateTime.Now;
                
                securityContract.ContractNo = model.ContractNo + model.ContractNoSecond;
                securityContract.CreditContractDate = model.CreditContractDate;
                securityContract.TypeOfLoanContract = model.TypeOfLoanContract;

                securityContract.PropertyEvaluationDate = model.PropertyEvaluationDate;
                securityContract.SecurityAgreementNo = model.SecurityAgreementNo;
                securityContract.SecurityAgreementDate = model.SecurityAgreementDate;

                securityContract.Cif = model.Cif;
                securityContract.CompanyName = model.CompanyName;

                securityContract.BranchID = model.BranchID;
                securityContract.BranchName = model.BranchName;
                securityContract.BranchRepresented = model.BranchRepresented;
                securityContract.BranchPosition = model.BranchPosition;

                if (Session["Security"] != null)
                {
                    List<SecurityCreatorEng> listSecurity = (List<SecurityCreatorEng>)Session["Security"];
                    SecurityCreator security;
                    foreach (SecurityCreatorEng item in listSecurity)
                    {
                        security = new SecurityCreator();
                        security.Name = item.Name;
                        security.IDNo = item.IDNo;
                        security.IssuedDate = item.IssuedDate;
                        security.IssuedBy = item.IssuedBy;
                        security.Address = item.Address;
                        security.Telephone = item.Telephone;
                        security.Email = item.Email;
                        security.Language = securityContract.Language;
                        security.SecurityContract = securityContract.ContractNo;
                        db.SecurityCreators.Add(security);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Security Creator");
                    
                    return View(model);
                }
                Session["Security"] = null;
                Session["CifCustomer"] = null;
                Session["CreditContract"] = null;

                db.SecurityContracts.Add(securityContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            if (Session["Security"] != null)
                model.listSecurityCreator = (List<SecurityCreatorEng>)Session["Security"];
            return View(model);
        }

        public ActionResult CreateNoContract()
        {
            SecurityContractEng model = new SecurityContractEng();
            model.Cif = (string)Session["CifCustomer"];
            Session["Security"] = null;
            try
            {
                int countSecurityContract = db.SecurityContracts.Where(c => c.Language.Equals("English")).Count() + 1;
                if (countSecurityContract < 10)
                    model.ContractNo = "0" + countSecurityContract + "/" + DateTime.Now.Year + "/SC/";
                else
                    model.ContractNo = countSecurityContract + "/" + DateTime.Now.Year + "/SC/";

                int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).Count();
                if (countCompany > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("English")).SingleOrDefault();
                    model.CompanyName = company.CompanyName;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.CompanyAddress = company.CompanyAddress;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.CompanyDirector = company.CompanyDirector;
                    model.CompanyPosition = company.Position;
                }
                else
                    model.RegistrationDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));

                model.IssuedDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                model.PropertyEvaluationDate = model.SecurityAgreementDate = DateTime.Today;
                model.CreditContractDate = DateTime.Parse("01/01/2010", CultureInfo.CreateSpecificCulture("fr-FR"));

                List<Branch> listBranch = db.Branches.ToList();
                foreach (Branch item in listBranch)
                {
                    model.BranchItems.Add(new SelectListItem
                    {
                        Text = item.BranchName,
                        Value = item.BranchID
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
            catch
            {
                return RedirectToAction("CreateStep1");
            }
        }

        [HttpPost]
        public ActionResult CreateNoContract(SecurityContractEng model)
        {
            List<Branch> listBranch;
            List<TypeOfContract> listTypeOfContract;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {
                SecurityContract securityContract = new SecurityContract();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                securityContract.ContractNo = model.ContractNo + branchStandfor + "/" + model.ContractNoSecond;
                securityContract.Language = "English";
                securityContract.CreateDate = DateTime.Now;
                securityContract.SecurityAgreementDate = model.SecurityAgreementDate;
                securityContract.SecurityAgreementNo = model.SecurityAgreementNo;
                securityContract.PropertyEvaluationDate = model.PropertyEvaluationDate;

                securityContract.CreditContract = model.CreditContract;
                securityContract.CreditContractDate = model.CreditContractDate;
                securityContract.TypeOfLoanContract = model.TypeOfLoanContract;

                securityContract.BranchID = model.BranchID;
                securityContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).SingleOrDefault();
                securityContract.BranchRepresented = model.BranchRepresented;
                securityContract.BranchPosition = model.BranchPosition;
                

                securityContract.Cif = model.Cif;
                securityContract.CompanyName = model.CompanyName;
                if (model.flagCompany == false)
                {
                    Company company = new Company();
                    company.CompanyName = model.CompanyName;
                    company.RegistrationNo = model.RegistrationNo;
                    company.RegistrationDate = model.RegistrationDate;
                    company.CompanyAddress = model.CompanyAddress;
                    company.CompanyTelephone = model.CompanyTelephone;
                    company.CompanyDirector = model.CompanyDirector;
                    company.Position = model.CompanyPosition;
                    db.Companies.Add(company);
                    db.SaveChanges();
                }
                if (Session["Security"] != null)
                {
                    List<SecurityCreatorEng> listSecurity = (List<SecurityCreatorEng>)Session["Security"];
                    SecurityCreator security;
                    foreach (SecurityCreatorEng item in listSecurity)
                    {
                        security = new SecurityCreator();
                        security.Name = item.Name;
                        security.IDNo = item.IDNo;
                        security.IssuedDate = item.IssuedDate;
                        security.IssuedBy = item.IssuedBy;
                        security.Address = item.Address;
                        security.Telephone = item.Telephone;
                        security.Email = item.Email;
                        security.Language = securityContract.Language;
                        security.SecurityContract = securityContract.ContractNo;
                        db.SecurityCreators.Add(security);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Security Creator");
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

                Session["Security"] = null;
                Session["CifCustomer"] = null;
                db.SecurityContracts.Add(securityContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

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
            if (Session["Security"] != null)
                model.listSecurityCreator = (List<SecurityCreatorEng>)Session["Security"];
            return View(model);
        }

        public ActionResult CreateStep2Khmer()
        {
            CreateSecurityContractStep2Khmer model = new CreateSecurityContractStep2Khmer();
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
        public ActionResult CreateStep2Khmer(CreateSecurityContractStep2Khmer model)
        {
            Session["CifCustomer"] = model.Cif;
            Session["CreditContract"] = model.CreditContract;
            if (model.CreditContract.Equals("Other"))
                return RedirectToAction("CreateNoContractKhmer");
            else
                return RedirectToAction("CreateKhmer");
        }

        public ActionResult CreateKhmer()
        {
            SecurityContractKhmer model = new SecurityContractKhmer();
            model.Cif = (string)Session["CifCustomer"];
            model.CreditContract = (string)Session["CreditContract"];
            Session["SecurityKhmer"] = null;
            try
            {
                Contract creditContract = db.Contracts.Where(c => c.ContractNo.Equals(model.CreditContract) && c.Language.Equals("Khmer"))
                                                        .Include(c => c.TypeOfContract).SingleOrDefault();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(creditContract.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                model.CreditContractDate = creditContract.ContractDate;
                model.TypeOfLoanContract = creditContract.TypeOfContract.TypeNameKhmer;
                model.BranchID = creditContract.BranchID;
                model.BranchName = creditContract.BranchName;
                model.BranchRepresented = creditContract.BranchDirector;
                model.BranchPosition = creditContract.BranchPosition;

                int countSecurityContract = db.SecurityContracts.Where(c => c.Language.Equals("Khmer")).Count() + 1;
                if (countSecurityContract < 10)
                    model.ContractNo = "0" + countSecurityContract + "/" + DateTime.Now.Year + "/SC/" + branchStandfor + "/";
                else
                    model.ContractNo = countSecurityContract + "/" + DateTime.Now.Year + "/SC/" + branchStandfor + "/";

                int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).Count();
                if (countCompany > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).SingleOrDefault();
                    model.CompanyName = company.CompanyName;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.CompanyAddress = company.CompanyAddress;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.CompanyDirector = company.CompanyDirector;
                    model.CompanyPosition = company.Position;
                }
                model.IssuedDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                model.PropertyEvaluationDate = model.SecurityAgreementDate = DateTime.Today;

                return View(model);
            }
            catch
            {
                return RedirectToAction("CreateStep1");
            }
        }

        [HttpPost]
        public ActionResult CreateKhmer(SecurityContractKhmer model)
        {
            if (ModelState.IsValid)
            {
                SecurityContract securityContract = new SecurityContract();
                
                securityContract.CreditContract = model.CreditContract;
                securityContract.Language = "Khmer";
                securityContract.CreateDate = DateTime.Now;
                
                securityContract.ContractNo = model.ContractNo + model.ContractNoSecond;

                securityContract.CreditContractDate = model.CreditContractDate;
                securityContract.TypeOfLoanContract = model.TypeOfLoanContract;

                securityContract.PropertyEvaluationDate = model.PropertyEvaluationDate;
                securityContract.SecurityAgreementNo = model.SecurityAgreementNo;
                securityContract.SecurityAgreementDate = model.SecurityAgreementDate;

                securityContract.Cif = model.Cif;
                securityContract.CompanyName = model.CompanyName;

                securityContract.BranchID = model.BranchID;
                securityContract.BranchName = model.BranchName;
                securityContract.BranchRepresented = model.BranchRepresented;
                securityContract.BranchPosition = model.BranchPosition;

                if (Session["SecurityKhmer"] != null)
                {
                    List<SecurityCreatorKhmer> listSecurity = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
                    SecurityCreator security;
                    foreach (SecurityCreatorKhmer item in listSecurity)
                    {
                        security = new SecurityCreator();
                        security.Name = item.Name;
                        security.IDNo = item.IDNo;
                        security.IssuedDate = item.IssuedDate;
                        security.IssuedBy = item.IssuedBy;
                        security.Address = item.Address;
                        security.Telephone = item.Telephone;
                        security.Email = item.Email;
                        security.Language = securityContract.Language;
                        security.SecurityContract = securityContract.ContractNo;
                        db.SecurityCreators.Add(security);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Security Creator");
                    
                    return View(model);
                }
                Session["SecurityKhmer"] = null;
                Session["CifCustomer"] = null;
                Session["CreditContract"] = null;

                db.SecurityContracts.Add(securityContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            if (Session["SecurityKhmer"] != null)
                model.listSecurityCreator = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
            return View(model);
        }

        public ActionResult CreateNoContractKhmer()
        {
            SecurityContractKhmer model = new SecurityContractKhmer();
            model.Cif = (string)Session["CifCustomer"];
            Session["SecurityKhmer"] = null;
            try
            {
                int countSecurityContract = db.SecurityContracts.Where(c => c.Language.Equals("Khmer")).Count() + 1;
                if (countSecurityContract < 10)
                    model.ContractNo = "0" + countSecurityContract + "/" + DateTime.Now.Year + "/SC/";
                else
                    model.ContractNo = countSecurityContract + "/" + DateTime.Now.Year + "/SC/";

                int countCompany = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).Count();
                if (countCompany > 0)
                {
                    model.flagCompany = true;
                    Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals("Khmer")).SingleOrDefault();
                    model.CompanyName = company.CompanyName;
                    model.RegistrationNo = company.RegistrationNo;
                    model.RegistrationDate = company.RegistrationDate;
                    model.CompanyAddress = company.CompanyAddress;
                    model.CompanyTelephone = company.CompanyTelephone;
                    model.CompanyDirector = company.CompanyDirector;
                    model.CompanyPosition = company.Position;
                }
                else
                    model.RegistrationDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));

                model.IssuedDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
                model.PropertyEvaluationDate = model.SecurityAgreementDate = DateTime.Today;
                model.CreditContractDate = DateTime.Parse("01/01/2010", CultureInfo.CreateSpecificCulture("fr-FR"));

                List<Branch> listBranch = db.Branches.ToList();
                foreach (Branch item in listBranch)
                {
                    model.BranchItems.Add(new SelectListItem
                    {
                        Text = item.BranchName,
                        Value = item.BranchID
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
            catch
            {
                return RedirectToAction("CreateStep1");
            }
        }

        [HttpPost]
        public ActionResult CreateNoContractKhmer(SecurityContractKhmer model)
        {
            List<Branch> listBranch;
            List<TypeOfContract> listTypeOfContract;
            List<BankPosition> listBankPosition;
            if (ModelState.IsValid)
            {
                SecurityContract securityContract = new SecurityContract();
                string branchStandfor = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchStandFor).SingleOrDefault();
                securityContract.ContractNo = model.ContractNo + branchStandfor + "/" + model.ContractNoSecond;
                securityContract.Language = "Khmer";
                securityContract.CreateDate = DateTime.Now;

                securityContract.SecurityAgreementDate = model.SecurityAgreementDate;
                securityContract.SecurityAgreementNo = model.SecurityAgreementNo;
                securityContract.PropertyEvaluationDate = model.PropertyEvaluationDate;

                securityContract.CreditContract = model.CreditContract;
                securityContract.CreditContractDate = model.CreditContractDate;
                securityContract.TypeOfLoanContract = model.TypeOfLoanContract;

                securityContract.BranchID = model.BranchID;
                securityContract.BranchName = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).Select(c => c.BranchName).SingleOrDefault();
                securityContract.BranchRepresented = model.BranchRepresented;
                securityContract.BranchPosition = model.BranchPosition;

                securityContract.Cif = model.Cif;
                securityContract.CompanyName = model.CompanyName;
                if (model.flagCompany == false)
                {
                    Company company = new Company();
                    company.CompanyName = model.CompanyName;
                    company.RegistrationNo = model.RegistrationNo;
                    company.RegistrationDate = model.RegistrationDate;
                    company.CompanyAddress = model.CompanyAddress;
                    company.CompanyTelephone = model.CompanyTelephone;
                    company.CompanyDirector = model.CompanyDirector;
                    company.Position = model.CompanyPosition;
                    db.Companies.Add(company);
                    db.SaveChanges();
                }
                if (Session["SecurityKhmer"] != null)
                {
                    List<SecurityCreatorKhmer> listSecurity = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
                    SecurityCreator security;
                    foreach (SecurityCreatorKhmer item in listSecurity)
                    {
                        security = new SecurityCreator();
                        security.Name = item.Name;
                        security.IDNo = item.IDNo;
                        security.IssuedDate = item.IssuedDate;
                        security.IssuedBy = item.IssuedBy;
                        security.Address = item.Address;
                        security.Telephone = item.Telephone;
                        security.Email = item.Email;
                        security.Language = securityContract.Language;
                        security.SecurityContract = securityContract.ContractNo;
                        db.SecurityCreators.Add(security);
                        db.SaveChanges();
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please insert Security Creator");
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
                    listBankPosition = db.BankPositions.ToList();
                    foreach (BankPosition item in listBankPosition)
                    {
                        model.BranchPositionItems.Add(new SelectListItem
                        {
                            Text = item.PositionNameKhmer,
                            Value = item.PositionNameKhmer,
                            Selected = item.PositionName.Equals(model.BranchPosition) ? true : false
                        });
                    }
                    return View(model);
                }

                Session["SecurityKhmer"] = null;
                Session["CifCustomer"] = null;

                db.SecurityContracts.Add(securityContract);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

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
            if (Session["SecurityKhmer"] != null)
                model.listSecurityCreator = (List<SecurityCreatorKhmer>)Session["SecurityKhmer"];
            return View(model);
        }

        // GET: SecurityContracts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SecurityContract securityContract = db.SecurityContracts.Find(id);
            if (securityContract == null)
            {
                return HttpNotFound();
            }
            return View(securityContract);
        }

        // POST: SecurityContracts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,ContractNo,CreateDate,CreditContract,CreditContractDate,Cif,CompanyName,BranchID,BranchName,BranchRepresented,BranchPosition,PropertyEvaluationDate,SecurityAgreementNo,SecurityAgreementDate,Language,FileName")] SecurityContract securityContract)
        {
            if (ModelState.IsValid)
            {
                db.Entry(securityContract).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(securityContract);
        }

        // GET: SecurityContracts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SecurityContract securityContract = db.SecurityContracts.Find(id);

            if (securityContract == null)
            {
                return HttpNotFound();
            }
            SecurityContractEng model = new SecurityContractEng();
            model.ID = securityContract.ID;
            model.ContractNo = securityContract.ContractNo;
            model.CreditContract = securityContract.CreditContract;
            model.CreditContractDate = securityContract.CreditContractDate;
            model.TypeOfLoanContract = securityContract.TypeOfLoanContract;
            model.BranchID = securityContract.BranchID;
            model.BranchName = securityContract.BranchName;
            model.BranchRepresented = securityContract.BranchRepresented;
            model.BranchPosition = securityContract.BranchPosition;
            model.SecurityAgreementNo = securityContract.SecurityAgreementNo;
            model.SecurityAgreementDate = securityContract.SecurityAgreementDate;
            model.PropertyEvaluationDate = securityContract.PropertyEvaluationDate;

            model.Cif = securityContract.Cif;
            model.CompanyName = securityContract.CompanyName;
            Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals(securityContract.Language)).SingleOrDefault();
            model.RegistrationNo = company.RegistrationNo;
            model.RegistrationDate = company.RegistrationDate;
            model.CompanyAddress = company.CompanyAddress;
            model.CompanyTelephone = company.CompanyTelephone;
            model.CompanyDirector = company.CompanyDirector;
            model.CompanyPosition = company.Position;

            List<SecurityCreator> listSecurity = db.SecurityCreators.Where(c => c.SecurityContract.Equals(model.ContractNo)
                                                        && c.Language.Equals(securityContract.Language)).ToList();
            if (listSecurity.Count > 0)
            {
                SecurityCreatorEng security;
                foreach (SecurityCreator item in listSecurity)
                {
                    security = new SecurityCreatorEng();
                    security.Name = item.Name;
                    security.IDNo = item.IDNo;
                    security.IssuedDate = item.IssuedDate;
                    security.IssuedBy = item.IssuedBy;
                    security.Address = item.Address;
                    security.Telephone = item.Telephone;
                    security.Email = item.Email;
                    model.listSecurityCreator.Add(security);
                }
            }
            return View(model);
        }

        // POST: SecurityContracts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SecurityContract securityContract = db.SecurityContracts.Find(id);
            List<SecurityCreator> listSecurity = db.SecurityCreators.Where(c => c.SecurityContract.Equals(securityContract.ContractNo)
                                                        && c.Language.Equals(securityContract.Language)).ToList();
            foreach (SecurityCreator item in listSecurity)
                db.SecurityCreators.Remove(item);
            db.SecurityContracts.Remove(securityContract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult DeleteKhmer(int? id)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SecurityContract securityContract = db.SecurityContracts.Find(id);

            if (securityContract == null)
            {
                return HttpNotFound();
            }
            SecurityContractKhmer model = new SecurityContractKhmer();
            model.ID = securityContract.ID;
            model.ContractNo = securityContract.ContractNo;
            model.CreditContract = securityContract.CreditContract;
            model.CreditContractDate = securityContract.CreditContractDate;
            model.TypeOfLoanContract = securityContract.TypeOfLoanContract;
            model.BranchID = securityContract.BranchID;
            model.BranchName = securityContract.BranchName;
            model.BranchRepresented = securityContract.BranchRepresented;
            model.BranchPosition = securityContract.BranchPosition;
            model.SecurityAgreementNo = securityContract.SecurityAgreementNo;
            model.SecurityAgreementDate = securityContract.SecurityAgreementDate;
            model.PropertyEvaluationDate = securityContract.PropertyEvaluationDate;

            model.Cif = securityContract.Cif;
            model.CompanyName = securityContract.CompanyName;
            Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals(securityContract.Language)).SingleOrDefault();
            model.RegistrationNo = company.RegistrationNo;
            model.RegistrationDate = company.RegistrationDate;
            model.CompanyAddress = company.CompanyAddress;
            model.CompanyTelephone = company.CompanyTelephone;
            model.CompanyDirector = company.CompanyDirector;
            model.CompanyPosition = company.Position;

            List<SecurityCreator> listSecurity = db.SecurityCreators.Where(c => c.SecurityContract.Equals(model.ContractNo)
                                                        && c.Language.Equals(securityContract.Language)).ToList();
            if (listSecurity.Count > 0)
            {
                SecurityCreatorKhmer security;
                foreach (SecurityCreator item in listSecurity)
                {
                    security = new SecurityCreatorKhmer();
                    security.Name = item.Name;
                    security.IDNo = item.IDNo;
                    security.IssuedDate = item.IssuedDate;
                    security.IssuedBy = item.IssuedBy;
                    security.Address = item.Address;
                    security.Telephone = item.Telephone;
                    security.Email = item.Email;
                    model.listSecurityCreator.Add(security);
                }
            }
            return View(model);
        }

        [HttpPost, ActionName("DeleteKhmer")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteKhmerConfirmed(int id)
        {
            SecurityContract securityContract = db.SecurityContracts.Find(id);
            List<SecurityCreator> listSecurity = db.SecurityCreators.Where(c => c.SecurityContract.Equals(securityContract.ContractNo)
                                                        && c.Language.Equals(securityContract.Language)).ToList();
            foreach (SecurityCreator item in listSecurity)
                db.SecurityCreators.Remove(item);
            db.SecurityContracts.Remove(securityContract);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        internal void CreateSecurityDoc(SecurityContract model)
        {
            List<SecurityCreator> listCreator = db.SecurityCreators.Where(c => c.SecurityContract.Equals(model.ContractNo)
                                                        && c.Language.Equals(model.Language)).ToList();
            Branch branch = db.Branches.Where(c => c.BranchID.Equals(model.BranchID)).SingleOrDefault();
            Company company = db.Companies.Where(c => c.Cif.Equals(model.Cif) && c.Language.Equals(model.Language)).SingleOrDefault();
            SecurityCreator creator = db.SecurityCreators.Where(c => c.SecurityContract.Equals(model.ContractNo) && c.Language.Equals(model.Language))
                                                            .FirstOrDefault();
                                               
            string templateFileName = "Security.docx";
            string templatePath = "";
            if (model.Language.Equals("English"))
                templatePath = Server.MapPath("~/Template/English/" + templateFileName);
            else
                templatePath = Server.MapPath("~/Template/Khmer/" + templateFileName);

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            //Spire.Doc.Section section;
            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            replaceDict.Add("[ContractNo]", model.ContractNo);
            
            replaceDict.Add("[BrLicense]", branch.BankLicense);
            replaceDict.Add("[BrNumber]", branch.BranchRegistrationNo);
            
            replaceDict.Add("[BrPhone]", branch.Telephone);
            replaceDict.Add("[BrFax]", branch.Fax);
            replaceDict.Add("[BrEmail]", branch.Email);
            replaceDict.Add("[BrDirector]", model.BranchRepresented);
            replaceDict.Add("[BrPosition]", model.BranchPosition);

            replaceDict.Add("[CompanyName]", model.CompanyName);
            replaceDict.Add("[ComNumber]", company.RegistrationNo);
            replaceDict.Add("[ComDate]", company.RegistrationDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[ComAddr]", company.CompanyAddress);
            replaceDict.Add("[ComPhone]", company.CompanyTelephone);
            replaceDict.Add("[ComDirector]", company.CompanyDirector);
            replaceDict.Add("[ComPosition]", company.Position);

            replaceDict.Add("[CreditContractDate]", model.CreditContractDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[CreditContract]", model.CreditContract);
            replaceDict.Add("[TypeLoan]", model.TypeOfLoanContract);

            replaceDict.Add("[ProDate]", model.PropertyEvaluationDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[SecurityNo]", model.SecurityAgreementNo);
            replaceDict.Add("[SecurityDate]", model.SecurityAgreementDate.ToString("dd/MM/yyyy"));
            string listSecurity = "";
            if (model.Language.Equals("English"))
            {
                replaceDict.Add("[Branch]", branch.BranchName);
                replaceDict.Add("[BrAddr]", branch.BranchAddress);
                foreach (SecurityCreator item in listCreator)
                {
                    listSecurity += "Name: " + item.Name + ". \n - ID No: " + item.IDNo + " on date " + item.IssuedDate.ToString("dd/MM/yyyy")
                        + " issued by " + item.IssuedBy + ". \n - Address: " + item.Address + ". \n - Telephone: " + item.Telephone
                        + "     Email: " + item.Email + ". \n";
                }
                listSecurity += "(Hereinafter called “the Security creditor”) \n";

            }
            else
            {
                replaceDict.Add("[Branch]", branch.BranchNameKhmer);
                replaceDict.Add("[BrAddr]", branch.BranchAddressKhmer);
                foreach (SecurityCreator item in listCreator)
                {
                    listSecurity += "ឈ្មោះ: " + item.Name + " \n - អត្ដសញ្ញាណប័ណ្ណលេខ: " + item.IDNo + " ចុះថ្ងៃទី " + item.IssuedDate.ToString("dd/MM/yyyy")
                        + " ចេញដោយ " + item.IssuedBy + " \n - អាសយដ្ឋាន: " + item.Address + " \n - ទូរសព្ទទំនាក់ទំនង: " + item.Telephone
                        + "     អ៊ីមែល: " + item.Email + " \n";
                }
                listSecurity += "(ចាប់ពីពេលនេះទៅត្រូវបានហៅថា “អ្នកបង្កើតសិទ្ធិប្រាតិភោគដោយអនុប្បទាន”)។ \n";
            }
            replaceDict.Add("[SecurityCreator]", listSecurity);
            replaceDict.Add("[CrName]", creator.Name);
            replaceDict.Add("[CrID]", creator.IDNo);
            replaceDict.Add("[CrDate]", creator.IssuedDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[CrAddr]", creator.Address);

            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            Spire.Doc.PictureWatermark picture = new Spire.Doc.PictureWatermark();
            picture.Picture = System.Drawing.Image.FromFile(Server.MapPath("~/Content/themes/base/images/Logo.png"));
            picture.Scaling = 100;
            picture.IsWashout = true;
            doc.Watermark = picture;

            string wordFileName = "Security_" + model.Cif + "_" + model.BranchID + " "
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
            //string wordFilePath = Server.MapPath("~/Reports/" + hypothecContract.FileName);
            aDoc = wordApp.Documents.Open(ref filename, ref missing, ref readOnly, ref missing, ref missing, ref missing, ref missing,
                                                ref missing, ref missing, ref missing, ref missing, ref osVisible, ref missing, ref missing,
                                                ref missing, ref missing);
            aDoc.Activate();
            model.FileName = wordFileName.Replace(".docx", ".pdf");
            string fileExportNamePath = Server.MapPath("~/Reports/" + model.FileName);
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

            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();

        }

        public FileContentResult GenerateSecurity(int? id)
        {
            string fileExportNamePath = "";
            SecurityContract security = db.SecurityContracts.Find(id);
            if(!string.IsNullOrEmpty(security.FileName))
                fileExportNamePath = Server.MapPath("~/Reports/" + security.FileName);
            else
            {
                CreateSecurityDoc(security);
                fileExportNamePath = Server.MapPath("~/Reports/" + security.FileName);
            }
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
