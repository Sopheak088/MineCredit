using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Models
{
    public class HypothecContract
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }

        public string CreditContract { get; set; }
        public string TypeOfLoanContract { get; set; }
        public DateTime CreditContractDate { get; set; }
        public double CreditContractAmount { get; set; }
        public string CreditContractCurrency { get; set; }
        public float CreditContractInterestRate { get; set; }
        public int Damages { get; set; }

        public string Cif { get; set; }
        public string CompanyName { get; set; }
        public string TypeOfcompany { get; set; }
        public int TypeOfCompanyID { get; set; }
        public string CompRegistrationNo { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyDirector { get; set; }
        
        public string inputer { get; set; }
        public string authoriser { get; set; }
        public int Status { get; set; }
        public string FileName { get; set; }
        public string FileNameAnnex { get; set; }
        public string Language { get; set; }
        public DateTime CreateDate { get; set; }

        public string BranchID { get; set; }
        public virtual Branch Branch { get; set; }
        public string BranchName { get; set; }
        public string BranchDirector { get; set; }
    }

    public class CreateHypothecContractEng
    {
        public int ID { get; set; }
        [Display(Name = "Pre Hypothec Contract(*):")]
        public string ContractNo { get; set; }
        [Required]
        [Display(Name = "Hypothec Contract(*):")]
        public string ContractNoSecond { get; set; }
        [Display(Name = "Loan Contract:")]
        public string CreditContractTemp { get; set; }
        [Display(Name = "Loan Contract No(*):")]
        public string CreditContract { get; set; }
        public string Cif { get; set; }
        [Display(Name = "Branch:")]
        public string BranchID { get; set; }
        [Display(Name = "Branch:")]
        public string BranchName { get; set; }
        [Display(Name = "Branch Represented:")]
        public string BranchDirector { get; set; }
        [Display(Name = "Type of company:")]
        public int TypeOfCompanyID { get; set; }
        [Display(Name = "Type of company:")]
        public string TypeOfCompany { get; set; }
        [Display(Name = "Company Name(*):")]
        public string CompanyName { get; set; }
        [Display(Name = "Registration No(*):")]
        public string CompanyRegistrationNo { get; set; }
        [Display(Name = "Company Address(*):")]
        public string CompanyAddress { get; set; }
        [Display(Name = "Company Represented(*):")]
        public string CompanyDirector { get; set; }

        [Display(Name = "Loan Contract Date:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreditContractDate { get; set; }
        [Display(Name = "Loan Amount(*):")]
        public double CreditContractAmount { get; set; }
        [Display(Name = "Interest Rate(%)*:")]
        public float CreditContractInterestRate { get; set; }

        [Required]
        [Display(Name = "Damages (%)*:")]
        public int Damages { get; set; }

        [Display(Name = "Name:")]
        public string HypothecatorName { get; set; }
        [Display(Name = "Sex:")]
        public string HypothecatorSex { get; set; }
        [Display(Name = "Date of Birth:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime HypothecatorBirthDate { get; set; }
        [Display(Name = "Nationality:")]
        public string HypothecatorNationality { get; set; }
        [Display(Name = "Address:")]
        public string HypothecatorAddress { get; set; }
        [Display(Name = "Village:")]
        public string HypothecatorVillage { get; set; }
        [Display(Name = "Commune/Sangkat:")]
        public string HypothecatorSangkat { get; set; }
        [Display(Name = "District/Khan:")]
        public string HypothecatorKhan { get; set; }
        [Display(Name = "Capital/Province:")]
        public string HypothecatorCapital { get; set; }

        [Display(Name = "Name:")]
        public string DebtorName { get; set; }
        [Display(Name = "Sex:")]
        public string DebtorSex { get; set; }
        [Display(Name = "Date of Birth:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DebtorBirthDate { get; set; }
        [Display(Name = "Nationality:")]
        public string DebtorNationality { get; set; }
        [Display(Name = "Address:")]
        public string DebtorAddress { get; set; }
        [Display(Name = "Village:")]
        public string DebtorVillage { get; set; }
        [Display(Name = "Commune/Sangkat:")]
        public string DebtorSangkat { get; set; }
        [Display(Name = "District/Khan:")]
        public string DebtorKhan { get; set; }
        [Display(Name = "Capital/Province:")]
        public string DebtorCapital { get; set; }

        [Display(Name = "Ownership:")]
        public string Ownership { get; set; }
        [Display(Name = "Pacel number:")]
        public string Pacelnumber { get; set; }
        [Display(Name = "Title number:")]
        public string TitleNumber { get; set; }
        [Display(Name = "Location:")]
        public string Location { get; set; }
        [Display(Name = "Total Size(m2):")]
        public string TotalSize { get; set; }
        [Display(Name = "Title deed:")]
        public string TypeOfProperty { get; set; }
        [Display(Name = "Type Loan Contract:")]
        public string TypeOfLoanContract { get; set; }
        public string Currency { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public List<HypothecatorEng> listHypothecator { get; set; }
        public List<DebtorEng> listDebtor { get; set; }
        public List<PropertyView> listProperty { get; set; }
        public List<SelectListItem> SexItems { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public List<SelectListItem> BranchItems { get; set; }
        public List<SelectListItem> CompanyItems { get; set; }
        public List<SelectListItem> TypeLoanContractItems { get; set; }
        public List<SelectListItem> CCyItems { get; set; }
        public CreateHypothecContractEng()
        {
            listHypothecator = new List<HypothecatorEng>();
            listDebtor = new List<DebtorEng>();
            listProperty = new List<PropertyView>();
            PropertyTypeItems = new List<SelectListItem>();
            BranchItems = new List<SelectListItem>();
            CompanyItems = new List<SelectListItem>();
            TypeLoanContractItems = new List<SelectListItem>();
            CCyItems = new List<SelectListItem>();
            SexItems = new List<SelectListItem>();
        }
    }

    public class SearchHypothecContract
    {
        [Display(Name = "From Date:")]
        public string FromDate { get; set; }

        [Display(Name = "To Date:")]
        public string ToDate { get; set; }
        public IEnumerable<HypothecContract> listHypothecContractEng { get; set; }
        public IEnumerable<HypothecContract> listHypothecContractKhmer { get; set; }

        public SearchHypothecContract()
        {
            listHypothecContractEng = new List<HypothecContract>();
            listHypothecContractKhmer = new List<HypothecContract>();
        }
    }

    public class CreateHypothecStep1
    {
        [Display(Name = "Language:")]
        public string Language { get; set; }
        public List<SelectListItem> LanguageItems { get; set; }

        [Required]
        [Display(Name = "Cif:")]
        public string Cif { get; set; }
        
    }

    public class CreateHypothecStep2Eng
    {
        public string Cif { get; set; }
        [Display(Name = "Loan Contract No(*):")]
        public string CreditContract { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public CreateHypothecStep2Eng()
        {
            CreditContractItems = new List<SelectListItem>();
        }
    }

    public class CreateHypothecStep2Khmer
    {
        public string Cif { get; set; }
        [Display(Name = "កិច្ចសន្យាប្រាក់កម្ចី(*):")]
        public string CreditContract { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public CreateHypothecStep2Khmer()
        {
            CreditContractItems = new List<SelectListItem>();
        }
    }

    public class CreateHypothecContractKhmer
    {
        public int ID { get; set; }

        [Display(Name = "កិច្ចសន្យាមុន(*):")]
        public string ContractNo { get; set; }
        [Required]
        [Display(Name = "កិច្ចសន្យា(*):")]
        public string ContractNoSecond { get; set; }

        [Display(Name = "កិច្ចសន្យាប្រាក់កម្ចី(*):")]
        public string CreditContract { get; set; }

        public string Cif { get; set; }

        [Display(Name = "សាខា:")]
        public string BranchID { get; set; }
        [Display(Name = "សាខា:")]
        public string BranchName { get; set; }
        [Display(Name = "សាខាតំណាង(*):")]
        public string BranchDirector { get; set; }
        [Display(Name = "ប្រភេទក្រុមហ៊ុន(*):")]
        public int TypeOfCompanyID { get; set; }
        [Display(Name = "ប្រភេទក្រុមហ៊ុន(*):")]
        public string TypeOfCompany { get; set; }
        [Display(Name = "ឈ្មោះ​ក្រុមហ៊ុន(*):")]
        public string CompanyName { get; set; }
        [Display(Name = "លេខចុះបញ្ជី(*):")]
        public string CompanyRegistrationNo { get; set; }
        [Display(Name = "អាសយដ្ឋាន(*):")]
        public string CompanyAddress { get; set; }
        [Display(Name = "ប្រធាន/នាយក(*):")]
        public string CompanyDirector { get; set; }

        [Display(Name = "កាលបរិច្ឆេទកិច្ចសន្យាប្រាក់កម្ចី(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreditContractDate { get; set; }
        [Display(Name = "ចំនួន​ប្រាក់កម្ចី(*):")]
        public double CreditContractAmount { get; set; }
        [Display(Name = "អត្រា​ការ​ប្រាក់ (% ក្នុង​មួយ​ឆ្នាំ)*:")]
        public float CreditContractInterestRate { get; set; }

        [Required]
        [Display(Name = "ការខូចខាត (%):")]
        public int Damages { get; set; }

        [Display(Name = "ឈ្មោះ:")]
        public string HypothecatorName { get; set; }
        [Display(Name = "ភេទ:")]
        public string HypothecatorSex { get; set; }
        [Display(Name = "ថ្ងៃកំណើត:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime HypothecatorBirthDate { get; set; }
        [Display(Name = "សញ្ជាតិ:")]
        public string HypothecatorNationality { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string HypothecatorAddress { get; set; }
        [Display(Name = "ភូមិ:")]
        public string HypothecatorVillage { get; set; }
        [Display(Name = "ឃុំ / សង្កាត់:")]
        public string HypothecatorSangkat { get; set; }
        [Display(Name = "ស្រុក / ខណ្ឌ:")]
        public string HypothecatorKhan { get; set; }
        [Display(Name = "រាជធានី / ខេត្ត:")]
        public string HypothecatorCapital { get; set; }

        [Display(Name = "ឈ្មោះ:")]
        public string DebtorName { get; set; }
        [Display(Name = "ការរួមភេទ:")]
        public string DebtorSex { get; set; }
        [Display(Name = "ថ្ងៃកំណើត:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime DebtorBirthDate { get; set; }
        [Display(Name = "សញ្ជាតិ:")]
        public string DebtorNationality { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string DebtorAddress { get; set; }
        [Display(Name = "ភូមិ:")]
        public string DebtorVillage { get; set; }
        [Display(Name = "ឃុំ / សង្កាត់:")]
        public string DebtorSangkat { get; set; }
        [Display(Name = "ស្រុក / ខណ្ឌ:")]
        public string DebtorKhan { get; set; }
        [Display(Name = "រាជធានី / ខេត្ត:")]
        public string DebtorCapital { get; set; }

        [Display(Name = "កម្មសិទ្ធករ:")]
        public string Ownership { get; set; }
        [Display(Name = "លេខក្បាលដី:")]
        public string Pacelnumber { get; set; }
        [Display(Name = "លេខបណ្ណ៍:")]
        public string TitleNumber { get; set; }
        [Display(Name = "ទីតាំង:")]
        public string Location { get; set; }
        [Display(Name = "ទំហំសរុប(m2):")]
        public string TotalSize { get; set; }
        [Display(Name = "ប្រភេទប្លង់:")]
        public string TypeOfProperty { get; set; }
        [Display(Name = "ប្រភេទកិច្ចសន្យា:")]
        public string TypeOfLoanContract { get; set; }
        public string Currency { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public List<HypothecatorKhmer> listHypothecator { get; set; }
        public List<DebtorKhmer> listDebtor { get; set; }
        public List<PropertyViewKhmer> listProperty { get; set; }
        public List<SelectListItem> SexItems { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public List<SelectListItem> BranchItems { get; set; }
        public List<SelectListItem> CompanyItems { get; set; }
        public List<SelectListItem> TypeLoanContractItems { get; set; }
        public List<SelectListItem> CCyItems { get; set; }
        public CreateHypothecContractKhmer()
        {
            listHypothecator = new List<HypothecatorKhmer>();
            listDebtor = new List<DebtorKhmer>();
            listProperty = new List<PropertyViewKhmer>();
            PropertyTypeItems = new List<SelectListItem>();
            BranchItems = new List<SelectListItem>();
            CompanyItems = new List<SelectListItem>();
            TypeLoanContractItems = new List<SelectListItem>();
            CCyItems = new List<SelectListItem>();
            SexItems = new List<SelectListItem>();
        }
    }
}