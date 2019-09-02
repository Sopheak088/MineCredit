using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Models
{
    public class SecurityContract
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public DateTime CreateDate { get; set; }
        public string CreditContract { get; set; }
        public DateTime CreditContractDate { get; set; }
        public string TypeOfLoanContract { get; set; }
        public string Cif { get; set; }
        public string CompanyName { get; set; }
        public string BranchID { get; set; }
        public string BranchName { get; set; }
        public string BranchRepresented { get; set; }
        public string BranchPosition { get; set; }
        public DateTime PropertyEvaluationDate { get; set; }
        public string SecurityAgreementNo { get; set; }
        public DateTime SecurityAgreementDate { get; set; }
        public string Language { get; set; }
        public string FileName { get; set; }
    }
    public class CreateSecurityContractStep1
    {
        [Display(Name = "Language:")]
        public string Language { get; set; }
        public List<SelectListItem> LanguageItems { get; set; }

        [Required]
        [Display(Name = "Cif:")]
        public string Cif { get; set; }
    }

    public class CreateSecurityContractStep2Eng
    {
        public string Cif { get; set; }
        [Display(Name = "Loan Contract No(*):")]
        public string CreditContract { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public CreateSecurityContractStep2Eng()
        {
            CreditContractItems = new List<SelectListItem>();
        }
    }

    public class CreateSecurityContractStep2Khmer
    {
        public string Cif { get; set; }
        [Display(Name = "កិច្ចសន្យាឥណទាន(*):")]
        public string CreditContract { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public CreateSecurityContractStep2Khmer()
        {
            CreditContractItems = new List<SelectListItem>();
        }
    }

    public class SecurityContractEng
    {
        public int ID { get; set; }
        [Display(Name = "Pre Security Contract(*):")]
        public string ContractNo { get; set; }
        [Required]
        [Display(Name = "Security Contract(*):")]
        public string ContractNoSecond { get; set; }
        [Display(Name = "Create Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreateDate { get; set; }

        [Required]
        [Display(Name = "Loan Contract No(*):")]
        public string CreditContract { get; set; }
        [Display(Name = "Loan Contract Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreditContractDate { get; set; }
        [Display(Name = "Type Loan Contract:")]
        public string TypeOfLoanContract { get; set; }

        [Display(Name = "Branch:")]
        public string BranchID { get; set; }
        [Display(Name = "Branch:")]
        public string BranchName { get; set; }
        [Display(Name = "Branch Represented:")]
        public string BranchRepresented { get; set; }
        [Display(Name = "Position:")]
        public string BranchPosition { get; set; }

        [Display(Name = "Property Evaluation Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime PropertyEvaluationDate { get; set; }
        [Required]
        [Display(Name = "Security Agreement No:")]
        public string SecurityAgreementNo { get; set; }
        [Display(Name = "Security Agreement Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime SecurityAgreementDate { get; set; }

        [Display(Name = "Name:")]
        public string Name { get; set; }
        [Display(Name = "Identity Card No:")]
        public string IDNo { get; set; }
        [Display(Name = "Issued Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime IssuedDate { get; set; }
        [Display(Name = "Issued By:")]
        public string IssuedBy { get; set; }
        [Display(Name = "Address:")]
        public string Address { get; set; }
        [Display(Name = "Telephone:")]
        public string Telephone { get; set; }
        [Display(Name = "Email:")]
        public string Email { get; set; }

        [Display(Name = "Cif:")]
        public string Cif { get; set; }
        [Required]
        [Display(Name = "Company name:")]
        public string CompanyName { get; set; }
        [Required]
        [Display(Name = "Registration No:")]
        public string RegistrationNo { get; set; }
        [Display(Name = "Registration Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RegistrationDate { get; set; }
        [Required]
        [Display(Name = "Address:")]
        public string CompanyAddress { get; set; }
        [Required]
        [Display(Name = "Telephone:")]
        public string CompanyTelephone { get; set; }
        [Required]
        [Display(Name = "Company Represented:")]
        public string CompanyDirector { get; set; }
        [Display(Name = "Position:")]
        public string CompanyPosition { get; set; }

        public bool flagCompany { get; set; }
        public bool flagCreditContract { get; set; }
        public List<SelectListItem> BranchItems { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public List<SelectListItem> TypeLoanContractItems { get; set; }
        public List<SelectListItem> BranchPositionItems { get; set; }
        public List<SecurityCreatorEng> listSecurityCreator { get; set; }
        public SecurityContractEng()
        {
            flagCompany = false;
            flagCreditContract = false;
            BranchItems = new List<SelectListItem>();
            CreditContractItems = new List<SelectListItem>();
            TypeLoanContractItems = new List<SelectListItem>();
            BranchPositionItems = new List<SelectListItem>();
            listSecurityCreator = new List<SecurityCreatorEng>();
        }
    }

    public class SecurityContractKhmer
    {
        public int ID { get; set; }
        [Display(Name = "កិច្ចសន្យាមុន(*):")]
        public string ContractNo { get; set; }
        [Required]
        [Display(Name = "កិច្ចសន្យា(*):")]
        public string ContractNoSecond { get; set; }
        [Display(Name = "កាលបរិច្ឆេទកិច្ចសន្យា:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreateDate { get; set; }

        [Required]
        [Display(Name = "កិច្ចសន្យាឥណទាន(*):")]
        public string CreditContract { get; set; }
        [Display(Name = "កាលបរិច្ឆេទនៃកិច្ចសន្យាឥណទាន:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreditContractDate { get; set; }
        [Display(Name = "ប្រភេទកិច្ចសន្យា:")]
        public string TypeOfLoanContract { get; set; }

        [Display(Name = "សាខា:")]
        public string BranchID { get; set; }
        [Display(Name = "សាខា:")]
        public string BranchName { get; set; }
        [Display(Name = "សាខាតំណាង:")]
        public string BranchRepresented { get; set; }
        [Display(Name = "តំណែង:")]
        public string BranchPosition { get; set; }

        [Display(Name = "កាលបរិច្ឆេទវាយតម្លៃអចលនទ្រព្យ:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime PropertyEvaluationDate { get; set; }
        [Required]
        [Display(Name = "កិច្ចព្រមព្រៀងសន្តិសុខ:")]
        public string SecurityAgreementNo { get; set; }
        [Display(Name = "កាលបរិច្ឆេទនៃកិច្ចព្រមព្រៀងសន្តិសុខ:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime SecurityAgreementDate { get; set; }

        [Display(Name = "ឈ្មោះ:")]
        public string Name { get; set; }
        [Display(Name = "គ្មានអត្តសញ្ញាណប័ណ្ណ:")]
        public string IDNo { get; set; }
        [Display(Name = "កាលបរិច្ឆេទចេញផ្សាយ:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime IssuedDate { get; set; }
        [Display(Name = "ចេញដោយ:")]
        public string IssuedBy { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string Address { get; set; }
        [Display(Name = "ទូរស័ព្ទ:")]
        public string Telephone { get; set; }
        [Display(Name = "អ៊ីមែល:")]
        public string Email { get; set; }

        [Display(Name = "Cif:")]
        public string Cif { get; set; }
        [Required]
        [Display(Name = "ឈ្មោះ​ក្រុមហ៊ុន(*):")]
        public string CompanyName { get; set; }
        [Required]
        [Display(Name = "លេខចុះបញ្ជី(*):")]
        public string RegistrationNo { get; set; }
        [Display(Name = "កាលបរិច្ឆេទ​ចុះបញ្ជី(*):")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RegistrationDate { get; set; }
        [Required]
        [Display(Name = "អាសយដ្ឋាន(*):")]
        public string CompanyAddress { get; set; }
        [Required]
        [Display(Name = "ទូរស័ព្ទ(*):")]
        public string CompanyTelephone { get; set; }
        [Required]
        [Display(Name = "តំណាងក្រុមហ៊ុន(*):")]
        public string CompanyDirector { get; set; }
        [Required]
        [Display(Name = "តំណែង(*):")]
        public string CompanyPosition { get; set; }

        public bool flagCompany { get; set; }
        public bool flagCreditContract { get; set; }
        public List<SelectListItem> BranchItems { get; set; }
        public List<SelectListItem> CreditContractItems { get; set; }
        public List<SelectListItem> TypeLoanContractItems { get; set; }
        public List<SelectListItem> BranchPositionItems { get; set; }
        public List<SecurityCreatorKhmer> listSecurityCreator { get; set; }
        public SecurityContractKhmer()
        {
            flagCompany = false;
            flagCreditContract = false;
            BranchItems = new List<SelectListItem>();
            CreditContractItems = new List<SelectListItem>();
            TypeLoanContractItems = new List<SelectListItem>();
            BranchPositionItems = new List<SelectListItem>();
            listSecurityCreator = new List<SecurityCreatorKhmer>();
        }
    }

    public class SearchSecurityContract
    {
        [Display(Name = "From Date:")]
        public string FromDate { get; set; }

        [Display(Name = "To Date:")]
        public string ToDate { get; set; }
        public IEnumerable<SecurityContract> listSecurityContractEng { get; set; }
        public IEnumerable<SecurityContract> listSecurityContractKhmer { get; set; }

        public SearchSecurityContract()
        {
            listSecurityContractEng = new List<SecurityContract>();
            listSecurityContractKhmer = new List<SecurityContract>();
        }
    }
}