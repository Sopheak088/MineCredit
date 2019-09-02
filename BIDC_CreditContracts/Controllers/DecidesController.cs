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
using Spire.Doc.Documents;
using BIDC_CreditContracts.Repositories;

namespace BIDC_CreditContracts.Controllers
{
    public class DecidesController : Controller
    {
        private CreditContractContext db = new CreditContractContext();

        // GET: Decides
        public ActionResult Index()
        {
            //return View(db.Decides.ToList());
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
        public ActionResult Search(SearchDecide model){
            if (Session["BranchID"] != null)
            {
                return RedirectToAction("Search", new { fromDate = model.FromDate, toDate = model.ToDate });
            }
            else
                return RedirectToAction("LogOff", "Account");
        }

        public ActionResult Search(string fromDate, string toDate){
            SearchDecide model = new SearchDecide();
            DateTime fromSearchDate;
            DateTime toSearchDate;
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
            model.listDecides = db.Decides.Where(c => c.CreateDate.CompareTo(fromSearchDate) >= 0 && c.CreateDate.CompareTo(toSearchDate) <= 0)
                                                .ToList();
            return View(model);
        }

        // GET: Decides/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Decide decide = db.Decides.Find(id);
            if (decide == null)
            {
                return HttpNotFound();
            }
            return View(decide);
        }

        public ActionResult CreateStep1()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateStep1(CreateDecideStep1 model)
        {
            if (ModelState.IsValid)
            {
                int flagDecide = db.Decides.Where(c => c.DecideCode.Equals(model.DecideCode.Trim())).Count();
                if(flagDecide>0)
                {
                    ModelState.AddModelError("", "Decide already have in system. Please insert new Decides");
                    return View(model);
                }
                else
                {
                    Session["DecideCode"] = model.DecideCode.Trim();
                    return RedirectToAction("Create");
                }
            }

            return View(model);
        }

        // GET: Decides/Create
        public ActionResult Create()
        {
            CreateDecide model = new CreateDecide();
            Session["NewProperty"] = null;
            Session["OldProperty"] = null;
            Session["NewMortgage"] = null;
            Session["OldMortgage"] = null;
            Session["OldGuarantor"] = null;
            Session["NewGuarantor"] = null;
            Session["NewOtherCollateral"] = null;
            model.DecideCode = (string)Session["DecideCode"];
            model.CreditProposalDate = DateTime.Parse("01/01/2017", CultureInfo.CreateSpecificCulture("fr-FR"));
            //model.OldGuarantorPassportDate = model.GuarantorPassportDate = DateTime.Parse("01/01/1950", CultureInfo.CreateSpecificCulture("fr-FR"));
            model.OutstandingDate = DateTime.Today;
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
                    Text = item.Name,
                    Value = item.Name
                });
            }
            List<TypeOfContract> listContractType = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName
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

            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.NewLoan,
                Value = Constances.NewLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.ExistLoan,
                Value = Constances.ExistLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.BothOfLoan,
                Value = Constances.BothOfLoan
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.CEO,
                Value = Constances.CEO
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.PTGD,
                Value = Constances.PTGD
            });
            return View(model);
        }

        // POST: Decides/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CreateDecide model)
        {
            List<Currency> listCurrency;
            List<TypeOfPurpose> listPurpose;
            List<TypeOfContract> listContractType;
            List<TypeOfProperty> listProperty;
            if (ModelState.IsValid)
            {
                Decide decide = new Decide();
                decide.DecideCode = model.DecideCode;
                decide.CreditProposalReport = model.CreditProposalReport;
                decide.CreditProposalDate = model.CreditProposalDate;
                decide.RequestBy = model.RequestBy;
                decide.CustomerName = model.CustomerName;
                decide.Cif = model.Cif;
                decide.CustomerAddress = model.CustomerAddress;
                decide.Representative = model.Representative;
                decide.LoanAmount = model.LoanAmount;
                decide.OutstandingLoan = model.OutstandingLoan;
                decide.OutstandingDate = model.OutstandingDate;
                decide.NewLoanAmount = model.NewLoanAmount;
                decide.TypeOfLoan = model.TypeOfLoan;
                decide.Purpose = model.Purpose;
                decide.OtherPurpose = model.OtherPurpose;
                decide.InterestRate = model.InterestRate;
                decide.ProcessingFee = model.ProcessingFee;
                decide.RepaymentMethod = model.RepaymentMethod;
                decide.DisbursementTime = model.DisbursementTime;
                decide.Condition = model.Condition;
                decide.Currency = model.Currency;
                decide.CreateDate = DateTime.Now;
                decide.OtherCondition = model.OtherCondition;
                decide.Term = model.Term;
                decide.BoardManagement = model.BoardManagement;
                decide.FollowBy = model.FollowBy;
                decide.LCBankGuarantee = model.LCBankGuarantee;
                PropertyForDecision property;
                //if (Session["OldProperty"] != null)
                //{
                //    List<PropertyView> listOldProperty = (List<PropertyView>)Session["OldProperty"];
                    
                //    foreach (PropertyView item in listOldProperty)
                //    {
                //        property = new Property();
                //        property.Ownership = item.Ownership;
                //        property.Pacelnumber = item.Pacelnumber;
                //        property.TitleNumber = item.TitleNumber;
                //        property.Location = item.Location;
                //        property.TypeOfProperty = item.TypeOfProperty;
                //        property.TotalSize = item.TotalSize;
                //        property.isLoanContract = false;
                //        property.DecideCode = decide.DecideCode;
                //        db.Properties.Add(property);
                //        db.SaveChanges();
                //    }
                //}
                //Session["OldProperty"] = null;

                //Guarantor guarantor;
                //if (Session["OldGuarantor"] != null)
                //{
                //    List<GuarantorViewEng> listOldGuarantor = (List<GuarantorViewEng>)Session["OldGuarantor"];
                    
                //    foreach (GuarantorViewEng item in listOldGuarantor)
                //    {
                //        guarantor = new Guarantor();
                //        guarantor.GuarantorName = item.GuarantorName;
                //        guarantor.Passport = item.Passport;
                //        guarantor.PassportDate = item.PassportDate;
                //        guarantor.isLoanContract = false;
                //        guarantor.DecideCode = decide.DecideCode;
                //        db.Guarantors.Add(guarantor);
                //        db.SaveChanges();
                //    }
                //}
                //Session["OldGuarantor"] = null;

                
                //if (Session["OldMortgage"] != null)
                //{
                //    List<MortgagePropertyView> listOldMortgage = (List<MortgagePropertyView>)Session["OldMortgage"];

                //    foreach (MortgagePropertyView item in listOldMortgage)
                //    {
                //        mortgageProperty = new MortgageProperty();
                //        mortgageProperty.PlateNumberName = item.PlateNumberName;
                //        mortgageProperty.IssuedByName = item.IssuedByName;
                //        mortgageProperty.PlateNumberYear = item.PlateNumberYear;
                //        mortgageProperty.IssuedByYear = item.IssuedByYear;
                //        mortgageProperty.PlateChassis = item.PlateChassis;
                //        mortgageProperty.IssuedByChassis = item.IssuedByChassis;
                //        mortgageProperty.PlateEngine = item.PlateEngine;
                //        mortgageProperty.IssuedByEngine = item.IssuedByEngine;
                //        mortgageProperty.PlateVignette = item.PlateVignette;
                //        mortgageProperty.IssuedByVignette = item.IssuedByVignette;
                //        mortgageProperty.isLoanContract = false;
                //        mortgageProperty.DecideCode = decide.DecideCode;
                //        db.MortgageProperties.Add(mortgageProperty);
                //        db.SaveChanges();
                //    }
                //}
                //Session["OldMortgage"] = null;

                if (Session["NewProperty"] != null)
                {
                    List<PropertyView> listNewProperty = (List<PropertyView>)Session["NewProperty"];

                    foreach (PropertyView item in listNewProperty)
                    {
                        property = new PropertyForDecision();
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.DecideCode = decide.DecideCode;
                        property.CollateralFor = item.CollateralFor;
                        if (!property.CollateralFor.Equals(Constances.ExistLoan))
                            property.isLoanContract = true;
                        else
                            property.isLoanContract = false;
                        db.PropertyForDecisions.Add(property);
                        db.SaveChanges();
                    }
                }
                Session["NewProperty"] = null;

                //if (Session["NewGuarantor"] != null)
                //{
                //    List<GuarantorViewEng> listNewGuarantor = (List<GuarantorViewEng>)Session["NewGuarantor"];

                //    foreach (GuarantorViewEng item in listNewGuarantor)
                //    {
                //        guarantor = new Guarantor();
                //        guarantor.GuarantorName = item.GuarantorName;
                //        guarantor.Passport = item.Passport;
                //        guarantor.PassportDate = item.PassportDate;
                //        guarantor.isLoanContract = true;
                //        guarantor.DecideCode = decide.DecideCode;
                //        db.Guarantors.Add(guarantor);
                //        db.SaveChanges();
                //    }
                //}
                //Session["NewGuarantor"] = null;

                MortgageProperty mortgageProperty;
                if (Session["NewMortgage"] != null)
                {
                    List<MortgagePropertyView> listNewMortgage = (List<MortgagePropertyView>)Session["NewMortgage"];

                    foreach (MortgagePropertyView item in listNewMortgage)
                    {
                        mortgageProperty = new MortgageProperty();
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
                        mortgageProperty.DecideCode = decide.DecideCode;
                        mortgageProperty.CollateralFor = item.CollateralFor;
                        if (!mortgageProperty.CollateralFor.Equals(Constances.ExistLoan))
                            mortgageProperty.isLoanContract = true;
                        else
                            mortgageProperty.isLoanContract = false;
                        db.MortgageProperties.Add(mortgageProperty);
                        db.SaveChanges();
                    }
                }
                Session["NewMortgage"] = null;

                OtherCollateral otherCollateral;
                if (Session["NewOtherCollateral"] != null)
                {
                    List<OtherCollateralView> listOtherCollateral = (List<OtherCollateralView>)Session["NewOtherCollateral"];
                    foreach (OtherCollateralView item in listOtherCollateral)
                    {
                        otherCollateral = new OtherCollateral();
                        otherCollateral.AssetInformation = item.AssetInformation;
                        otherCollateral.IssuedBy = item.IssuedBy;
                        otherCollateral.DecideCode = decide.DecideCode;
                        otherCollateral.CollateralFor = item.CollateralFor;
                        if (!otherCollateral.CollateralFor.Equals(Constances.ExistLoan))
                            otherCollateral.isLoanContract = true;
                        else
                            otherCollateral.isLoanContract = false;
                        db.OtherCollaterals.Add(otherCollateral);
                        db.SaveChanges();
                    }
                }
                Session["NewOtherCollateral"] = null;

                db.Decides.Add(decide);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name,
                    Selected = item.Name.Equals(model.Purpose) ? true : false
                });
            }
            listContractType = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = item.TypeName.Equals(model.TypeOfLoan) ? true : false
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
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.NewLoan,
                Value = Constances.NewLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.ExistLoan,
                Value = Constances.ExistLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.BothOfLoan,
                Value = Constances.BothOfLoan
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.CEO,
                Value = Constances.CEO,
                Selected = Constances.CEO.Equals(model.BoardManagement) ? true : false
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.PTGD,
                Value = Constances.PTGD,
                Selected = Constances.PTGD.Equals(model.BoardManagement) ? true : false
            });
            return View(model);
        }

        // GET: Decides/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Decide decide = db.Decides.Find(id);
            if (decide == null)
            {
                return HttpNotFound();
            }
            CreateDecide model = new CreateDecide();
            model.ID = decide.ID;
            model.DecideCode = decide.DecideCode;
            model.CreditProposalDate = decide.CreditProposalDate;
            model.CreditProposalReport = decide.CreditProposalReport;
            model.RequestBy = decide.RequestBy;
            model.CustomerName = decide.CustomerName;
            model.Cif = decide.Cif;
            model.CustomerAddress = decide.CustomerAddress;
            model.Representative = decide.Representative;
            model.LoanAmount = decide.LoanAmount;
            model.OutstandingLoan = decide.OutstandingLoan;
            model.OutstandingDate = decide.OutstandingDate;
            model.Currency = decide.Currency;
            model.NewLoanAmount = decide.NewLoanAmount;
            model.TypeOfLoan = decide.TypeOfLoan;
            model.Purpose = decide.Purpose;
            model.OtherPurpose = decide.OtherPurpose;
            model.Term = decide.Term;
            model.InterestRate = decide.InterestRate;
            model.ProcessingFee = decide.ProcessingFee;
            model.RepaymentMethod = decide.RepaymentMethod;
            model.DisbursementTime = decide.DisbursementTime;
            model.BoardManagement = decide.BoardManagement;
            model.Condition = decide.Condition;
            model.OtherCondition = decide.OtherCondition;
            model.FollowBy = decide.FollowBy;
            model.LCBankGuarantee = decide.LCBankGuarantee;

            List<PropertyForDecision> listProperty = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
            if (listProperty.Count > 0)
            {
                PropertyView propertyView;
                foreach (PropertyForDecision item in listProperty)
                {
                    propertyView = new PropertyView();
                    propertyView.Ownership = item.Ownership;
                    propertyView.TitleNumber = item.TitleNumber;
                    propertyView.Pacelnumber = item.Pacelnumber;
                    propertyView.Location = item.Location;
                    propertyView.TypeOfProperty = item.TypeOfProperty;
                    propertyView.TotalSize = item.TotalSize;
                    propertyView.CollateralFor = item.CollateralFor;
                    propertyView.isSaved = true;
                    model.NewProperty.Add(propertyView);
                }
            }
            Session["NewProperty"] = model.NewProperty;

            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
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
                    mortgagePropertyView.CollateralFor = item.CollateralFor;
                    mortgagePropertyView.isSaved = true;
                    model.NewMortgageProperty.Add(mortgagePropertyView);
                }
            }
            Session["NewMortgage"] = model.NewMortgageProperty;

            List<OtherCollateral> listOtherCollateral = db.OtherCollaterals.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
            if (listOtherCollateral.Count > 0)
            {
                OtherCollateralView otherCollateralView;
                foreach (OtherCollateral item in listOtherCollateral)
                {
                    otherCollateralView = new OtherCollateralView();
                    otherCollateralView.AssetInformation = item.AssetInformation;
                    otherCollateralView.IssuedBy = item.IssuedBy;
                    otherCollateralView.CollateralFor = item.CollateralFor;
                    otherCollateralView.isSaved = true;
                    model.NewOtherCollateral.Add(otherCollateralView);
                }
            }
            Session["NewOtherCollateral"] = model.NewOtherCollateral;

            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name,
                    Selected = item.Name.Equals(model.Purpose) ? true : false
                });
            }
            List<TypeOfContract> listContractType = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = item.TypeName.Equals(model.TypeOfLoan) ? true : false
                });
            }
            List<TypeOfProperty> listTypeProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listTypeProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.NewLoan,
                Value = Constances.NewLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.ExistLoan,
                Value = Constances.ExistLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.BothOfLoan,
                Value = Constances.BothOfLoan
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.CEO,
                Value = Constances.CEO,
                Selected = Constances.CEO.Equals(model.BoardManagement) ? true : false
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.PTGD,
                Value = Constances.PTGD,
                Selected = Constances.PTGD.Equals(model.BoardManagement) ? true : false
            });
            return View(model);
        }

        // POST: Decides/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CreateDecide model)
        {
            if (ModelState.IsValid)
            {
                Decide decide = db.Decides.Find(model.ID);
                decide.CreditProposalReport = model.CreditProposalReport;
                decide.CreditProposalDate = model.CreditProposalDate;
                decide.RequestBy = model.RequestBy;
                decide.CustomerName = model.CustomerName;
                decide.Cif = model.Cif;
                decide.CustomerAddress = model.CustomerAddress;
                decide.Representative = model.Representative;
                decide.LoanAmount = model.LoanAmount;
                decide.OutstandingLoan = model.OutstandingLoan;
                decide.OutstandingDate = model.OutstandingDate;
                decide.NewLoanAmount = model.NewLoanAmount;
                decide.TypeOfLoan = model.TypeOfLoan;
                decide.Purpose = model.Purpose;
                decide.OtherPurpose = model.OtherPurpose;
                decide.InterestRate = model.InterestRate;
                decide.ProcessingFee = model.ProcessingFee;
                decide.RepaymentMethod = model.RepaymentMethod;
                decide.DisbursementTime = model.DisbursementTime;
                decide.Condition = model.Condition;
                decide.Currency = model.Currency;
                decide.OtherCondition = model.OtherCondition;
                decide.Term = model.Term;
                decide.BoardManagement = model.BoardManagement;
                decide.FollowBy = model.FollowBy;
                decide.LCBankGuarantee = model.LCBankGuarantee;

                List<PropertyForDecision> listPropertyOld = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
                foreach (PropertyForDecision item in listPropertyOld)
                {
                    db.PropertyForDecisions.Remove(item);
                }
                PropertyForDecision property;
                if (Session["NewProperty"] != null)
                {
                    List<PropertyView> listNewProperty = (List<PropertyView>)Session["NewProperty"];

                    foreach (PropertyView item in listNewProperty)
                    {
                        property = new PropertyForDecision();
                        property.Ownership = item.Ownership;
                        property.Pacelnumber = item.Pacelnumber;
                        property.TitleNumber = item.TitleNumber;
                        property.Location = item.Location;
                        property.TypeOfProperty = item.TypeOfProperty;
                        property.TotalSize = item.TotalSize;
                        property.DecideCode = decide.DecideCode;
                        property.CollateralFor = item.CollateralFor;
                        if (!property.CollateralFor.Equals(Constances.ExistLoan))
                            property.isLoanContract = true;
                        else
                            property.isLoanContract = false;
                        db.PropertyForDecisions.Add(property);
                        db.SaveChanges();
                    }
                }
                Session["NewProperty"] = null;

                List<MortgageProperty> _listMortgageProperty = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
                foreach (MortgageProperty item in _listMortgageProperty)
                {
                    db.MortgageProperties.Remove(item);
                }
                MortgageProperty mortgageProperty;
                if (Session["NewMortgage"] != null)
                {
                    List<MortgagePropertyView> listNewMortgage = (List<MortgagePropertyView>)Session["NewMortgage"];

                    foreach (MortgagePropertyView item in listNewMortgage)
                    {
                        mortgageProperty = new MortgageProperty();
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
                        mortgageProperty.DecideCode = decide.DecideCode;
                        mortgageProperty.CollateralFor = item.CollateralFor;
                        if (!mortgageProperty.CollateralFor.Equals(Constances.ExistLoan))
                            mortgageProperty.isLoanContract = true;
                        else
                            mortgageProperty.isLoanContract = false;
                        db.MortgageProperties.Add(mortgageProperty);
                        db.SaveChanges();
                    }
                }
                Session["NewMortgage"] = null;

                List<OtherCollateral> _listOtherCollateral = db.OtherCollaterals.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
                foreach (OtherCollateral item in _listOtherCollateral)
                {
                    db.OtherCollaterals.Remove(item);
                }
                OtherCollateral otherCollateral;
                if (Session["NewOtherCollateral"] != null)
                {
                    List<OtherCollateralView> listOtherCollateral = (List<OtherCollateralView>)Session["NewOtherCollateral"];
                    foreach (OtherCollateralView item in listOtherCollateral)
                    {
                        otherCollateral = new OtherCollateral();
                        otherCollateral.AssetInformation = item.AssetInformation;
                        otherCollateral.IssuedBy = item.IssuedBy;
                        otherCollateral.DecideCode = decide.DecideCode;
                        otherCollateral.CollateralFor = item.CollateralFor;
                        if (!otherCollateral.CollateralFor.Equals(Constances.ExistLoan))
                            otherCollateral.isLoanContract = true;
                        else
                            otherCollateral.isLoanContract = false;
                        db.OtherCollaterals.Add(otherCollateral);
                        db.SaveChanges();
                    }
                }
                Session["NewOtherCollateral"] = null;

                decide.FileName = "";
                db.Entry(decide).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            else
                ModelState.AddModelError("", "Some information is wrong or missing, check again");

            List<Currency> listCurrency = db.Currencies.ToList();
            foreach (Currency item in listCurrency)
            {
                model.CurrencyItems.Add(new SelectListItem
                {
                    Text = item.CurrencyName,
                    Value = item.CurrencyID,
                    Selected = item.CurrencyID.Equals(model.Currency) ? true : false
                });
            }
            List<TypeOfPurpose> listPurpose = db.TypeOfPurposes.ToList();
            foreach (TypeOfPurpose item in listPurpose)
            {
                model.PurposeTypeItems.Add(new SelectListItem
                {
                    Text = item.Name,
                    Value = item.Name,
                    Selected = item.Name.Equals(model.Purpose) ? true : false
                });
            }
            List<TypeOfContract> listContractType = db.TypeOfContracts.ToList();
            foreach (TypeOfContract item in listContractType)
            {
                model.ContractTypeItems.Add(new SelectListItem
                {
                    Text = item.TypeName,
                    Value = item.TypeName,
                    Selected = item.TypeName.Equals(model.TypeOfLoan) ? true : false
                });
            }
            List<TypeOfProperty> listTypeProperty = db.TypeOfProperties.ToList();
            foreach (TypeOfProperty item in listTypeProperty)
            {
                model.PropertyTypeItems.Add(new SelectListItem
                {
                    Text = item.PropertyName,
                    Value = item.PropertyName
                });
            }
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.NewLoan,
                Value = Constances.NewLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.ExistLoan,
                Value = Constances.ExistLoan
            });
            model.CollateralForItems.Add(new SelectListItem
            {
                Text = Constances.BothOfLoan,
                Value = Constances.BothOfLoan
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.CEO,
                Value = Constances.CEO,
                Selected = Constances.CEO.Equals(model.BoardManagement) ? true : false
            });
            model.BoardManagementItems.Add(new SelectListItem
            {
                Text = Constances.PTGD,
                Value = Constances.PTGD,
                Selected = Constances.PTGD.Equals(model.BoardManagement) ? true : false
            });

            return View(model);
        }

        // GET: Decides/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Decide decide = db.Decides.Find(id);
            if (decide == null)
            {
                return HttpNotFound();
            }
            CreateDecide model = new CreateDecide();
            model.ID = decide.ID;
            model.DecideCode = decide.DecideCode;
            model.CreditProposalReport = decide.CreditProposalReport;
            model.CreditProposalDate = decide.CreditProposalDate;
            model.RequestBy = decide.RequestBy;
            model.CustomerName = decide.CustomerName;
            model.Cif = decide.Cif;
            model.CustomerAddress = decide.CustomerAddress;
            model.Representative = decide.Representative;
            model.LoanAmount = decide.LoanAmount;
            model.Currency = decide.Currency;
            model.OutstandingLoan = decide.OutstandingLoan;
            model.OutstandingDate = decide.OutstandingDate;
            model.NewLoanAmount = decide.NewLoanAmount;
            model.TypeOfLoan = decide.TypeOfLoan;
            model.OtherPurpose = decide.OtherPurpose;
            model.Purpose = decide.Purpose;
            model.InterestRate = decide.InterestRate;
            model.ProcessingFee = decide.ProcessingFee;
            model.RepaymentMethod = decide.RepaymentMethod;
            model.DisbursementTime = decide.DisbursementTime;
            model.Condition = decide.Condition;
            model.OtherCondition = decide.OtherCondition;
            model.FollowBy = decide.FollowBy;
            model.BoardManagement = decide.BoardManagement;
            model.LCBankGuarantee = decide.LCBankGuarantee;
            return View(model);
        }

        // POST: Decides/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Decide decide = db.Decides.Find(id);
            List<PropertyForDecision> listProperty = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(decide.DecideCode)).ToList();
            foreach (PropertyForDecision item in listProperty)
            {
                db.PropertyForDecisions.Remove(item);
            }
            List<MortgageProperty> listMortgageProperty = db.MortgageProperties.Where(c => c.DecideCode.Equals(decide.DecideCode)).ToList();
            foreach (MortgageProperty item in listMortgageProperty)
            {
                db.MortgageProperties.Remove(item);
            }
            List<Guarantor> listGuarantor = db.Guarantors.Where(c => c.DecideCode.Equals(decide.DecideCode)).ToList();
            foreach (Guarantor item in listGuarantor)
            {
                db.Guarantors.Remove(item);
            }
            List<OtherCollateral> listOtherCollateral = db.OtherCollaterals.Where(c => c.DecideCode.Equals(decide.DecideCode)).ToList();
            foreach (OtherCollateral item in listOtherCollateral)
            {
                db.OtherCollaterals.Remove(item);
            }
            db.Decides.Remove(decide);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        internal void CreateDecideDoc(Decide model)
        {
            //string templateFileName = "Decision.docx";
            string templatePath = Server.MapPath("~/Template/English/Decision.docx");
            List<PropertyForDecision> listOldProperty = db.PropertyForDecisions.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
            int numberOldProperty = listOldProperty.Count;
            //List<Guarantor> listOldGuarantor = db.Guarantors.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == false).ToList();
            //int numberOldGuarantor = listOldGuarantor.Count;
            List<MortgageProperty> listOldMortgage = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
            int numberOldMortProperty = listOldMortgage.Count;
            List<OtherCollateral> listOtherCollateral = db.OtherCollaterals.Where(c => c.DecideCode.Equals(model.DecideCode)).ToList();
            int numberOtherCollateral = listOtherCollateral.Count;
            //List<Property> listNewProperty = db.Properties.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
            //int numberNewProperty = listNewProperty.Count;
            //List<Guarantor> listNewGuarantor = db.Guarantors.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
            //int numberNewGuarantor = listNewGuarantor.Count;
            //List<MortgageProperty> listNewMortgage = db.MortgageProperties.Where(c => c.DecideCode.Equals(model.DecideCode) && c.isLoanContract == true).ToList();
            //int numberNewMortgage = listNewMortgage.Count;

            Spire.Doc.Document doc = new Spire.Doc.Document();
            doc.LoadFromFile(templatePath);
            Spire.Doc.Section section;

            Dictionary<string, string> replaceDict = new Dictionary<string, string>();
            replaceDict.Add("[Code]", model.DecideCode);
            replaceDict.Add("[Proposal]", model.CreditProposalReport);
            replaceDict.Add("[ProDate]", model.CreditProposalDate.ToString("dd/MM/yyyy"));
            replaceDict.Add("[RequestBy]", model.RequestBy + ".");
            if(!string.IsNullOrEmpty(model.FollowBy))
                replaceDict.Add("[FollowBy]","\n" + model.FollowBy);
            else
                doc.Replace("[FollowBy]", "", false, true);
            replaceDict.Add("[CustomerName]", model.CustomerName);
            if(!string.IsNullOrEmpty(model.Cif))
                replaceDict.Add("[Cif]", "\nCIF: "+ model.Cif);
            else
                doc.Replace("[Cif]", "", false, true);
            replaceDict.Add("[Address]", model.CustomerAddress);
            if (!string.IsNullOrEmpty(model.Representative))
                replaceDict.Add("[Representative]", "\nRepresentative: " + model.Representative);
            else
                doc.Replace("[Representative]", "", false, true);
            if(model.LoanAmount > 0)
                replaceDict.Add("[LoanAmount]", model.LoanAmount.ToString("###,###,###.00") + " " + model.Currency);
            else
                replaceDict.Add("[LoanAmount]", "N/A");
            
            if(model.OutstandingLoan > 0)
            {
                replaceDict.Add("[OutDate]", "(on " + model.OutstandingDate.ToString("dd/MM/yyyy") + "): ");
                replaceDict.Add("[OutLoan]", model.OutstandingLoan.ToString("###,###,###.00") + " " + model.Currency );
            }
            else
            {
                replaceDict.Add("[OutDate]", ":");
                replaceDict.Add("[OutLoan]", "N/A");
            }
            
            replaceDict.Add("[NewLoan]", model.NewLoanAmount.ToString("###,###,###.00") + " " + model.Currency);
            if (model.LCBankGuarantee > 0)
                replaceDict.Add("[LCBG]", model.LCBankGuarantee.ToString("###,###,###.00") + " " + model.Currency);
            else
                replaceDict.Add("[LCBG]", "N/A");
            replaceDict.Add("[TypeLoan]", model.TypeOfLoan);
            replaceDict.Add("[Purpose]", model.OtherPurpose);
            replaceDict.Add("[Term]", model.Term.ToString());
            replaceDict.Add("[Rate]", model.InterestRate.ToString() + " % per year");
            replaceDict.Add("[Fee]", model.ProcessingFee.ToString() + " % per total amount");
            replaceDict.Add("[Repay]", model.RepaymentMethod);
            replaceDict.Add("[Disbur]", model.DisbursementTime);
            if(!string.IsNullOrEmpty(model.Condition))
                replaceDict.Add("[Condition]", model.Condition);
            else
                replaceDict.Add("[Condition]", "N/A");
            if (!string.IsNullOrEmpty(model.OtherCondition))
                replaceDict.Add("[OtherCondition]", model.OtherCondition);
            else
                replaceDict.Add("[OtherCondition]", "N/A");
            replaceDict.Add("[BoardManagement]", model.BoardManagement);
            //string oldCollateral = "";
            //if (numberOldProperty > 0)
            //    oldCollateral += "\n- Hypothecated Property: \n[OldProperty]";
            //if (numberOldGuarantor > 0)
            //    oldCollateral += "\n- Guaranty: \n[OldGuaranty]";
            //if (numberOldMortProperty > 0)
            //    oldCollateral += "\n- Mortgage the movable property: \n[OldMortgage] \n";

            //if (!string.IsNullOrEmpty(oldCollateral))
            //    replaceDict.Add("[OldCollateral]", oldCollateral);
            //else
            //    replaceDict.Add("[OldCollateral]", "N/A");

            //string newCollateral = "";
            //if (numberNewProperty > 0)
            //    newCollateral += "\n- Hypothecated Property: \n[NewProperty]";
            //if (numberNewGuarantor > 0)
            //    newCollateral += "\n- Guaranty: \n[NewGuaranty]";
            //if (numberNewMortgage > 0)
            //    newCollateral += "\n- Mortgage the movable property: \n[NewMortgage] \n";

            //if (!string.IsNullOrEmpty(newCollateral))
            //    replaceDict.Add("[NewCollateral]", newCollateral);
            //else
            //    replaceDict.Add("[NewCollateral]", "N/A");

            foreach (KeyValuePair<string, string> kvp in replaceDict)
            {
                doc.Replace(kvp.Key, kvp.Value, true, true);
            }

            int i = 1;
            if (numberOldProperty > 0)
            {
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[OldProperty]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOldProperty + 1, 7);

                table.Rows[0].Cells[0].Width = 20F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 80F;
                table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = table.Rows[0].Cells[5].Width = 80F;
                table.Rows[0].Cells[6].Width = 70F;
                //Create Header
                String[] Header = new String[] { "No.", "Pacel number", "Title deed number", "Ownership", "Total size (m2)","Location","Collateral for" };

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    TR.CharacterFormat.FontSize = 10;
                    p.Format.AfterSpacing = 0;
                }
                foreach (PropertyForDecision item in listOldProperty)
                {
                    table.Rows[i].Cells[0].Width = 20F;
                    table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 80F;
                    table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = table.Rows[i].Cells[5].Width = 80F;
                    table.Rows[i].Cells[6].Width = 70F;
                    TableRow DataRow = table.Rows[i];
                    Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
                    Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
                    t0.CharacterFormat.FontSize = 10;
                    p0.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Pacelnumber);
                    t1.CharacterFormat.FontSize = 10;
                    t1.CharacterFormat.FontName = "Khmer OS Battambang";
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.TitleNumber);
                    t2.CharacterFormat.FontSize = 10;
                    t2.CharacterFormat.FontName = "Khmer OS Battambang";
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.Ownership);
                    t3.CharacterFormat.FontSize = 10;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.TotalSize);
                    t4.CharacterFormat.FontSize = 10;
                    p4.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p5 = DataRow.Cells[5].AddParagraph();
                    Spire.Doc.Fields.TextRange t5 = p5.AppendText(item.Location);
                    t5.CharacterFormat.FontSize = 10;
                    p5.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p6 = DataRow.Cells[6].AddParagraph();
                    Spire.Doc.Fields.TextRange t6 = p6.AppendText(item.CollateralFor);
                    t6.CharacterFormat.FontSize = 10;
                    p6.Format.AfterSpacing = 0;
                    i++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
                doc.Replace("[OldProperty]", "N/A", false, true);

            int j = 1;
            if (numberOldMortProperty > 0)
            {
                doc.Replace("[Mortgage]", "- Mortgage the movable property", false, true);
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[OldMortgage]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOldMortProperty + 1, 5);

                table.Rows[0].Cells[0].Width = 20F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                table.Rows[0].Cells[4].Width = 70F;
                //Create Header
                String[] Header = new String[] { "No.", "Asset Information", "Plate Number", "Issued By", "Collateral for" };

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    TR.CharacterFormat.FontSize = 10;
                    p.Format.AfterSpacing = 0;
                }

                foreach (MortgageProperty item in listOldMortgage)
                {
                    table.Rows[j].Cells[0].Width = 20F;
                    table.Rows[j].Cells[1].Width = table.Rows[j].Cells[2].Width = 100F;
                    table.Rows[j].Cells[3].Width = 100F;
                    table.Rows[j].Cells[4].Width = 70F;
                    table[j, 0].AddParagraph().AppendText(j.ToString());
                    TableRow DataRow = table.Rows[j];
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(" - Model name: \n - Model year: \n - Chassis No: \n - Engine No: \n - Vignette No:");
                    t1.CharacterFormat.FontSize = 10;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(" " + item.PlateNumberName + " \n " + item.PlateNumberYear + " \n " + item.PlateChassis
                                            + "  \n " + item.PlateEngine + " \n " + item.PlateVignette);
                    t2.CharacterFormat.FontSize = 10;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(" " + item.IssuedByName + " \n " + item.IssuedByYear + " \n " + item.IssuedByChassis + " \n "
                                            + item.IssuedByEngine + " \n " + item.IssuedByVignette);
                    t3.CharacterFormat.FontSize = 10;
                    p3.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
                    Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.CollateralFor);
                    t4.CharacterFormat.FontSize = 10;
                    p3.Format.AfterSpacing = 0;

                    table.Rows[j].Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    j++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
            {
                doc.Replace("[Mortgage]", "", false, true);
                doc.Replace("[OldMortgage]", "", false, true);
            }

            int l = 1;
            if (numberOtherCollateral > 0)
            {
                doc.Replace("[OtherCollateral]", "-	Other collateral:", false, true);
                section = doc.Sections[0];
                TextSelection selection = doc.FindString("[Collateral]", true, true);
                Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
                Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
                Body body = paragraph.OwnerTextBody;
                int index = body.ChildObjects.IndexOf(paragraph);
                //Create Table
                Spire.Doc.Table table = section.AddTable(true);
                //Add Cells
                table.ResetCells(numberOtherCollateral + 1, 4);

                table.Rows[0].Cells[0].Width = 20F;
                table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
                //Create Header
                String[] Header = new String[] { "No.", "Asset Information", "Issued By", "Collateral for" };

                TableRow FRow = table.Rows[0];
                for (int k = 0; k < Header.Length; k++)
                {
                    Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
                    FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
                    p.Format.HorizontalAlignment = HorizontalAlignment.Center;
                    Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
                    TR.CharacterFormat.Bold = true;
                    TR.CharacterFormat.FontSize = 10;
                    p.Format.AfterSpacing = 0;
                }

                foreach (OtherCollateral item in listOtherCollateral)
                {
                    table.Rows[l].Cells[0].Width = 20F;
                    table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = 100F;
                    table.Rows[l].Cells[3].Width = 100F;
                    table[l, 0].AddParagraph().AppendText(l.ToString());
                    TableRow DataRow = table.Rows[l];
                    Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
                    Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.AssetInformation);
                    t1.CharacterFormat.FontSize = 10;
                    p1.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
                    Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.IssuedBy);
                    t2.CharacterFormat.FontSize = 10;
                    p2.Format.AfterSpacing = 0;
                    Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
                    Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.CollateralFor);
                    t3.CharacterFormat.FontSize = 10;
                    p3.Format.AfterSpacing = 0;

                    l++;
                }
                body.ChildObjects.Remove(paragraph);
                body.ChildObjects.Insert(index, table);
            }
            else
            {
                doc.Replace("[OtherCollateral]", "", false, true);
                doc.Replace("[Collateral]", "", false, true);
            }
            //int l = 1;
            //if (numberOldGuarantor > 0)
            //{
            //    section = doc.Sections[0];
            //    TextSelection selection = doc.FindString("[OldGuaranty]", true, true);
            //    Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
            //    Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
            //    Body body = paragraph.OwnerTextBody;
            //    int index = body.ChildObjects.IndexOf(paragraph);
            //    //Create Table
            //    Spire.Doc.Table table = section.AddTable(true);
            //    //Add Cells
            //    table.ResetCells(numberOldGuarantor + 1, 4);
            //    table.Rows[0].Cells[0].Width = 30F;
            //    table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
            //    //Create Header
            //    String[] Header = new String[] { "No", "Guarantor name", "ID Card/Passport", "Issued on" };
            //    TableRow FRow = table.Rows[0];
            //    for (int k = 0; k < Header.Length; k++)
            //    {
            //        Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
            //        FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            //        p.Format.HorizontalAlignment = HorizontalAlignment.Center;
            //        Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
            //        TR.CharacterFormat.Bold = true;
            //        TR.CharacterFormat.FontSize = 10;
            //        p.Format.AfterSpacing = 0;
            //    }
            //    foreach (Guarantor item in listOldGuarantor)
            //    {
            //        table.Rows[l].Cells[0].Width = 30F;
            //        table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = table.Rows[l].Cells[3].Width = 100F;
            //        TableRow DataRow = table.Rows[l];
            //        Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
            //        Spire.Doc.Fields.TextRange t0 = p0.AppendText(l.ToString());
            //        t0.CharacterFormat.FontSize = 10;
            //        p0.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
            //        Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.GuarantorName);
            //        t1.CharacterFormat.FontSize = 10;
            //        p1.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
            //        Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Passport);
            //        t2.CharacterFormat.FontSize = 10;
            //        p2.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
            //        Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.PassportDate.ToString("dd/MM/yyyy"));
            //        t3.CharacterFormat.FontSize = 10;
            //        p3.Format.AfterSpacing = 0;
            //        l++;
            //    }
            //    body.ChildObjects.Remove(paragraph);
            //    body.ChildObjects.Insert(index, table);
            //}
            //else
            //    doc.Replace("[OldGuaranty]", "N/A", false, true);

            //i = 1;
            //if (numberNewProperty > 0)
            //{
            //    section = doc.Sections[0];
            //    TextSelection selection = doc.FindString("[NewProperty]", true, true);
            //    Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
            //    Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
            //    Body body = paragraph.OwnerTextBody;
            //    int index = body.ChildObjects.IndexOf(paragraph);
            //    //Create Table
            //    Spire.Doc.Table table = section.AddTable(true);
            //    //Add Cells
            //    table.ResetCells(numberNewProperty + 1, 5);

            //    table.Rows[0].Cells[0].Width = 30F;
            //    table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = 85F;
            //    table.Rows[0].Cells[3].Width = table.Rows[0].Cells[4].Width = 85F;
            //    //Create Header
            //    String[] Header = new String[] { "No", "Ownership", "Pacel number", "Title deed number", "Location" };

            //    TableRow FRow = table.Rows[0];
            //    for (int k = 0; k < Header.Length; k++)
            //    {
            //        Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
            //        FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            //        p.Format.HorizontalAlignment = HorizontalAlignment.Center;
            //        Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
            //        TR.CharacterFormat.Bold = true;
            //        TR.CharacterFormat.FontSize = 10;
            //        p.Format.AfterSpacing = 0;
            //    }
            //    foreach (Property item in listNewProperty)
            //    {
            //        table.Rows[i].Cells[0].Width = 30F;
            //        table.Rows[i].Cells[1].Width = table.Rows[i].Cells[2].Width = 85F;
            //        table.Rows[i].Cells[3].Width = table.Rows[i].Cells[4].Width = 85F;
            //        TableRow DataRow = table.Rows[i];
            //        Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
            //        Spire.Doc.Fields.TextRange t0 = p0.AppendText(i.ToString());
            //        t0.CharacterFormat.FontSize = 10;
            //        p0.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
            //        Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.Ownership);
            //        t1.CharacterFormat.FontSize = 10;
            //        p1.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
            //        Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Pacelnumber);
            //        t2.CharacterFormat.FontSize = 10;
            //        p2.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
            //        Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.TitleNumber);
            //        t3.CharacterFormat.FontSize = 10;
            //        p3.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p4 = DataRow.Cells[4].AddParagraph();
            //        Spire.Doc.Fields.TextRange t4 = p4.AppendText(item.Location);
            //        t4.CharacterFormat.FontSize = 10;
            //        p4.Format.AfterSpacing = 0;
            //        i++;
            //    }
            //    body.ChildObjects.Remove(paragraph);
            //    body.ChildObjects.Insert(index, table);
            //}
            //else
            //    doc.Replace("[NewProperty]", "N/A", false, true);

            //j = 1;
            //if (numberNewMortgage > 0)
            //{
            //    section = doc.Sections[0];
            //    TextSelection selection = doc.FindString("[NewMortgage]", true, true);
            //    Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
            //    Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
            //    Body body = paragraph.OwnerTextBody;
            //    int index = body.ChildObjects.IndexOf(paragraph);
            //    //Create Table
            //    Spire.Doc.Table table = section.AddTable(true);
            //    //Add Cells
            //    table.ResetCells(numberNewMortgage + 1, 4);

            //    table.Rows[0].Cells[0].Width = 30F;
            //    table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
            //    //Create Header
            //    String[] Header = new String[] { "No.", "Asset Information", "Plate Number", "Issued By" };

            //    TableRow FRow = table.Rows[0];
            //    for (int k = 0; k < Header.Length; k++)
            //    {
            //        Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
            //        FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            //        p.Format.HorizontalAlignment = HorizontalAlignment.Center;
            //        Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
            //        TR.CharacterFormat.Bold = true;
            //        TR.CharacterFormat.FontSize = 10;
            //        p.Format.AfterSpacing = 0;
            //    }

            //    foreach (MortgageProperty item in listNewMortgage)
            //    {
            //        table.Rows[j].Cells[0].Width = 30F;
            //        table.Rows[j].Cells[1].Width = table.Rows[j].Cells[2].Width = 100F;
            //        table.Rows[j].Cells[3].Width = 100F;
            //        table[j, 0].AddParagraph().AppendText(j.ToString());
            //        TableRow DataRow = table.Rows[j];
            //        Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
            //        p1.AppendText(" - Model name: \n - Model year: \n - Chassis No: \n - Engine No: \n - Vignette No:");
            //        p1.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
            //        Spire.Doc.Fields.TextRange t2 = p2.AppendText(" " + item.PlateNumberName + " \n " + item.PlateNumberYear + " \n " + item.PlateChassis
            //                                + "  \n " + item.PlateEngine + " \n " + item.PlateVignette);
            //        t2.CharacterFormat.FontSize = 10;
            //        p2.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
            //        Spire.Doc.Fields.TextRange t3 = p3.AppendText(" " + item.IssuedByName + " \n " + item.IssuedByYear + " \n " + item.IssuedByChassis + " \n "
            //                                + item.IssuedByEngine + " \n " + item.IssuedByVignette);
            //        t3.CharacterFormat.FontSize = 10;
            //        p3.Format.AfterSpacing = 0;

            //        table.Rows[j].Cells[0].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            //        j++;
            //    }
            //    body.ChildObjects.Remove(paragraph);
            //    body.ChildObjects.Insert(index, table);
            //}
            //else
            //    doc.Replace("[NewMortgage]", "N/A", false, true);

            //l = 1;
            //if (numberNewGuarantor > 0)
            //{
            //    section = doc.Sections[0];
            //    TextSelection selection = doc.FindString("[NewGuaranty]", true, true);
            //    Spire.Doc.Fields.TextRange range = selection.GetAsOneRange();
            //    Spire.Doc.Documents.Paragraph paragraph = range.OwnerParagraph;
            //    Body body = paragraph.OwnerTextBody;
            //    int index = body.ChildObjects.IndexOf(paragraph);
            //    //Create Table
            //    Spire.Doc.Table table = section.AddTable(true);
            //    //Add Cells
            //    table.ResetCells(numberNewGuarantor + 1, 4);
            //    table.Rows[0].Cells[0].Width = 30F;
            //    table.Rows[0].Cells[1].Width = table.Rows[0].Cells[2].Width = table.Rows[0].Cells[3].Width = 100F;
            //    //Create Header
            //    String[] Header = new String[] { "No", "Guarantor name", "ID Card/Passport", "Issued on" };
            //    TableRow FRow = table.Rows[0];
            //    for (int k = 0; k < Header.Length; k++)
            //    {
            //        Spire.Doc.Documents.Paragraph p = FRow.Cells[k].AddParagraph();
            //        FRow.Cells[k].CellFormat.VerticalAlignment = VerticalAlignment.Middle;
            //        p.Format.HorizontalAlignment = HorizontalAlignment.Center;
            //        Spire.Doc.Fields.TextRange TR = p.AppendText(Header[k]);
            //        TR.CharacterFormat.Bold = true;
            //        TR.CharacterFormat.FontSize = 10;
            //        p.Format.AfterSpacing = 0;
            //    }
            //    foreach (Guarantor item in listNewGuarantor)
            //    {
            //        table.Rows[l].Cells[0].Width = 30F;
            //        table.Rows[l].Cells[1].Width = table.Rows[l].Cells[2].Width = table.Rows[l].Cells[3].Width = 100F;
            //        TableRow DataRow = table.Rows[l];
            //        Spire.Doc.Documents.Paragraph p0 = DataRow.Cells[0].AddParagraph();
            //        Spire.Doc.Fields.TextRange t0 = p0.AppendText(l.ToString());
            //        t0.CharacterFormat.FontSize = 10;
            //        p0.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p1 = DataRow.Cells[1].AddParagraph();
            //        Spire.Doc.Fields.TextRange t1 = p1.AppendText(item.GuarantorName);
            //        t1.CharacterFormat.FontSize = 10;
            //        p1.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p2 = DataRow.Cells[2].AddParagraph();
            //        Spire.Doc.Fields.TextRange t2 = p2.AppendText(item.Passport);
            //        t2.CharacterFormat.FontSize = 10;
            //        p2.Format.AfterSpacing = 0;
            //        Spire.Doc.Documents.Paragraph p3 = DataRow.Cells[3].AddParagraph();
            //        Spire.Doc.Fields.TextRange t3 = p3.AppendText(item.PassportDate.ToString("dd/MM/yyyy"));
            //        t3.CharacterFormat.FontSize = 10;
            //        p3.Format.AfterSpacing = 0;
            //        l++;
            //    }
            //    body.ChildObjects.Remove(paragraph);
            //    body.ChildObjects.Insert(index, table);
            //}
            //else
            //    doc.Replace("[NewGuaranty]", "N/A", false, true);

            model.FileName = "Decision " + DateTime.Now.ToString("yyyyMMdd HHmmss") + ".docx";
            string wordFilePath = Server.MapPath("~/Reports/" + model.FileName);
            doc.SaveToFile(wordFilePath, FileFormat.Docx);
            doc.Close();

            db.Entry(model).State = EntityState.Modified;
            db.SaveChanges();
        }

        public FileContentResult GenerateDecide(int? id)
        {
            string fileExportNamePath = "";
            Decide decide = db.Decides.Find(id);
            if (!string.IsNullOrEmpty(decide.FileName))
                fileExportNamePath = Server.MapPath("~/Reports/" + decide.FileName);
            else
            {
                CreateDecideDoc(decide);
                fileExportNamePath = Server.MapPath("~/Reports/" + decide.FileName);
            }
            var mimeType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
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
