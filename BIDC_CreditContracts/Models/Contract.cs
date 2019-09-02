using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Models
{
    public class Contract
    {
        public int ContractID { get; set; }

        [Display(Name = "Contract no:")]
        public string ContractNo { get; set; }

        [Display(Name = "Contract date:")]
        public DateTime ContractDate { get; set; }

        [Display(Name = "Company name:")]
        public string CompanyName { get; set; }

        [Display(Name = "Loan amount:")]
        public double LoanAmount { get; set; }

        [Display(Name = "Interest Rate:")]
        public float InterestRate { get; set; }

        [Display(Name = "Term:")]
        public int Term { get; set; }

        [Display(Name = "Processing Fee:")]
        public float ProcessingFee { get; set; }

        [Display(Name = "Purpose:")]
        public string Purpose { get; set; }

        [Display(Name = "Period of repayment:")]
        public int? GracePeriod { get; set; }

        [Display(Name = "Repayment month:")]
        public string RepaymentPrinciple { get; set; }

        [Display(Name = "Repayment Interest:")]
        public string RepaymentInterest { get; set; }

        public int? LoanWithdraw { get; set; }
        public int? LegalFee { get; set; }
        public string OtherCondition { get; set; }
        public int? LoanRestrucFee { get; set; }
        public int? EarlySettleFee { get; set; }

        public string BankContactPerson { get; set; }
        public string BankContactPosition { get; set; }
        public string BankContactPhone { get; set; }
        public string BankContactEmail { get; set; }
        public string BorrowerContactPerson { get; set; }
        public string BorrowerContactPosition { get; set; }
        public string BorrowerContactPhone { get; set; }
        public string BorrowerContactEmail { get; set; }

        public string BranchID { get; set; }
        public virtual Branch Branch { get; set; }
        public string BranchName { get; set; }
        public string BranchDirector { get; set; }
        public string BranchPosition { get; set; }

        public int TypeOfContractID { get; set; }
        public virtual TypeOfContract TypeOfContract { get; set; }

        public int NumberOfContractKH { get; set; }
        public int NumberOfContractEng { get; set; }
        public int NumberBankKeep { get; set; }
        public int NumberCustomerKeep { get; set; }
        public int NumberOtherKeep { get; set; }

        public string Language { get; set; }
        public string FileName { get; set; }
        public string LoanCurrency { get; set; }
        public string LegalCurrency { get; set; }
        public string inputer { get; set; }
        public string authoriser { get; set; }
        public int Status { get; set; }
        public string OtherPurpose { get; set; }

        public int TypeOfCompanyID { get; set; }
        public virtual TypeOfCompany TypeOfCompany { get; set; }

        public DateTime ApplicationDate { get; set; }
        public string FileGeneralName { get; set; }
        public string FileNameDraft { get; set; }
        public string Cif { get; set; }
        public string DecideCode { get; set; }
        public string FileNameDoc { get; set; }
        public double LCBankGuarantee { get; set; }
    }

    public class CreateContractStep1
    {
        [Display(Name = "Contract for:")]
        public string TypeContract { get; set; }

        public List<SelectListItem> ContractTypeItems { get; set; }

        [Display(Name = "Language:")]
        public string Language { get; set; }

        public List<SelectListItem> LanguageItems { get; set; }

        [Display(Name = "Branch:")]
        public string Branch { get; set; }

        public List<SelectListItem> BranchItems { get; set; }

        [Required]
        [Display(Name = "Decides code:")]
        public string DecideCode { get; set; }
    }

    public class CreateContractStep2
    {
        public string Language { get; set; }
        public string Branch { get; set; }
        public string DecideCode { get; set; }
    }

    public class CreateCompanyContractEng
    {
        [Display(Name = "Decide Code:")]
        public string DecideCode { get; set; }

        [Display(Name = "Contract ID:")]
        public int ContractID { get; set; }

        [Display(Name = "Contract type:")]
        public int TypeOfContractID { get; set; }

        public string BranchID { get; set; }
        public string BranchStandFor { get; set; }

        [Required]
        [Display(Name = "Contract type(*):")]
        public string TypeOfContract { get; set; }

        [Required]
        [Display(Name = "Pre contract no:")]
        public string ContractNo { get; set; }

        [Display(Name = "Contract date(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ContractDate { get; set; }

        [Required]
        [Display(Name = "Company name(*):")]
        public string CompanyName { get; set; }

        [Required]
        [Display(Name = "Company type(*):")]
        public int TypeOfCompanyID { get; set; }

        [Display(Name = "Company type:")]
        public string TypeOfCompany { get; set; }

        [Required]
        [Display(Name = "Registration No(*):")]
        public string RegistrationNo { get; set; }

        [Display(Name = "Registration Date(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RegistrationDate { get; set; }

        [Required]
        [Display(Name = "Address(*):")]
        public string CompanyAddress { get; set; }

        [Required]
        [Display(Name = "Telephone - Fax(*):")]
        public string CompanyTelephone { get; set; }

        [Display(Name = "Email - Website:")]
        public string CompanyEmail { get; set; }

        [Required]
        [Display(Name = "Company Represented(*):")]
        public string CompanyDirector { get; set; }

        [Required]
        [Display(Name = "Company Position(*):")]
        public string CompanyPosition { get; set; }

        [Required]
        [Display(Name = "Loan amount(*):")]
        [Range(1, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LoanAmount { get; set; }

        [Required]
        [Display(Name = "Interest Rate(% per year)*:")]
        [Range(0.01, float.MaxValue, ErrorMessage = "Please enter a value bigger than zero")]
        public float InterestRate { get; set; }

        [Required]
        [Display(Name = "Term (month)*:")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int Term { get; set; }

        [Required]
        [Display(Name = "Processing Fee(% per amount)*:")]
        [Range(0.00, float.MaxValue, ErrorMessage = "Please enter a value bigger than zero")]
        public float ProcessingFee { get; set; }

        [Required]
        [Display(Name = "Purpose(*):")]
        public string Purpose { get; set; }

        [Display(Name = "Grace period of repayment (month):")]
        public int? GracePeriod { get; set; }

        [Display(Name = "Repayment Principle:")]
        public string RepaymentPrinciple { get; set; }

        [Display(Name = "Repayment Interest:")]
        public string RepaymentInterest { get; set; }

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

        public List<PropertyView> HypothecatedProperty { get; set; }

        [Display(Name = "Guarantor Name:")]
        public string GuarantorName { get; set; }

        [Display(Name = "Card/passport no:")]
        public string GuarantorPassportNo { get; set; }

        [Display(Name = "Issued date:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime GuarantorPassportDate { get; set; }

        [Display(Name = "Loan Withdraw(month):")]
        public int? LoanWithdraw { get; set; }

        [Display(Name = "Legal Fee:")]
        public int? LegalFee { get; set; }

        [Required]
        [Display(Name = "Borrower Contact Person(*):")]
        public string BorrowerContactPerson { get; set; }

        [Required]
        [Display(Name = "Borrower Position(*):")]
        public string BorrowerContactPosition { get; set; }

        [Required]
        [Display(Name = "Borrower Phone(*):")]
        public string BorrowerContactPhone { get; set; }

        [Display(Name = "Borrower Email:")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string BorrowerContactEmail { get; set; }

        [Required]
        [Display(Name = "Khmer contract number(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOfContractKH { get; set; }

        [Required]
        [Display(Name = "English contract number(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOfContractEng { get; set; }

        [Required]
        [Display(Name = "Bank keeps(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberBankKeep { get; set; }

        [Required]
        [Display(Name = "Customer keeps(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberCustomerKeep { get; set; }

        [Required]
        [Display(Name = "Other keep(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOtherKeep { get; set; }

        [Required]
        [Display(Name = "Bank Contact Person(*):")]
        public string BankContactPerson { get; set; }

        [Required]
        [Display(Name = "Bank Contact Position(*):")]
        public string BankContactPosition { get; set; }

        [Required]
        [Display(Name = "Bank Contact Phone(*):")]
        public string BankContactPhone { get; set; }

        [Required]
        [Display(Name = "Bank Contact Email(*):")]
        public string BankContactEmail { get; set; }

        [Display(Name = "Other Condition:")]
        public string OtherCondition { get; set; }

        [Display(Name = "Restructure Fee(%):")]
        public int? LoanRestrucFee { get; set; }

        [Display(Name = "Settlement Fee(%):")]
        public int? EarlySettleFee { get; set; }

        [Display(Name = "Model name:")]
        public string PlateNumberName { get; set; }

        [Display(Name = "Model name:")]
        public string IssuedByName { get; set; }

        [Display(Name = "Model year:")]
        public string PlateNumberYear { get; set; }

        [Display(Name = "Model year:")]
        public string IssuedByYear { get; set; }

        [Display(Name = "Chassis No:")]
        public string PlateChassis { get; set; }

        [Display(Name = "Chassis No:")]
        public string IssuedByChassis { get; set; }

        [Display(Name = "Engine No:")]
        public string PlateEngine { get; set; }

        [Display(Name = "Engine No:")]
        public string IssuedByEngine { get; set; }

        [Display(Name = "Vignette No:")]
        public string PlateVignette { get; set; }

        [Display(Name = "Vignette No:")]
        public string IssuedByVignette { get; set; }

        public string Language { get; set; }

        [Required]
        [Display(Name = "Bank Represented(*):")]
        public string BranchDirector { get; set; }

        [Display(Name = "Bank Represented Position(*):")]
        public string BranchPosition { get; set; }

        [Required]
        [Display(Name = "Currency(*):")]
        public string LoanCurrency { get; set; }

        [Display(Name = "Currency:")]
        public string LegalCurrency { get; set; }


        [Display(Name = "Other Purpose(*):")]
        public string OtherPurpose { get; set; }

        [Required]
        [Display(Name = "Contract no(*):")]
        public string ContractNoSecond { get; set; }

        public string numberOfContract { get; set; }

        [Display(Name = "Title deed:")]
        public string TypeOfProperty { get; set; }

        public List<MortgagePropertyView> MortgageProperty { get; set; }
        public List<SelectListItem> ContractTypeItems { get; set; }
        public List<SelectListItem> CurrencyItems { get; set; }
        public List<SelectListItem> CompanyTypeItems { get; set; }
        public List<SelectListItem> PurposeTypeItems { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public List<GuarantorViewEng> Guarantor { get; set; }
        public List<SelectListItem> BranchPositionItems { get; set; }

        [Required]
        [Display(Name = "Application date(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ApplicationDate { get; set; }

        [Required]
        [Display(Name = "Cif:")]
        public string Cif { get; set; }

        public bool flagCompany { get; set; }

        [Display(Name = "LC and Bank Guarantee limit:")]
        [Range(0, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LCBankGuarantee { get; set; }

        [Display(Name = "Owner:")]
        public string Owner { get; set; }

        [Display(Name = "ID Number:")]
        public string IDNumber { get; set; }

        [Display(Name = "Opening Date:")]
        public DateTime OpeningDate { get; set; }

        [Display(Name = "Type Of Deposit:")]
        public string TypeOfDeposit { get; set; }

        //public DateTime ExpiryDate { get; set; }

        public List<FixDepositViewEng> FixDeposit { get; set; }

        public CreateCompanyContractEng()
        {
            HypothecatedProperty = new List<PropertyView>();
            MortgageProperty = new List<MortgagePropertyView>();
            ContractTypeItems = new List<SelectListItem>();
            CurrencyItems = new List<SelectListItem>();
            CompanyTypeItems = new List<SelectListItem>();
            PurposeTypeItems = new List<SelectListItem>();
            PropertyTypeItems = new List<SelectListItem>();
            Guarantor = new List<GuarantorViewEng>();
            flagCompany = false;
            BranchPositionItems = new List<SelectListItem>();
            FixDeposit = new List<FixDepositViewEng>();
        }
    }

    public class SearchContract
    {
        [Display(Name = "From Date:")]
        public string FromDate { get; set; }

        [Display(Name = "To Date:")]
        public string ToDate { get; set; }

        public IEnumerable<Contract> listContractEng { get; set; }
        public IEnumerable<Contract> listContractKhmer { get; set; }

        public SearchContract()
        {
            listContractEng = new List<Contract>();
            listContractKhmer = new List<Contract>();
        }
    }

    public class CreateCompanyContractKhmer
    {
        [Display(Name = "ក្រមសម្រាប់ការសម្រេចចិត្ត:")]
        public string DecideCode { get; set; }

        [Display(Name = "លេខសម្គាល់កិច្ចសន្យា:")]
        public int ContractID { get; set; }

        [Display(Name = "ប្រភេទកិច្ចសន្យា:")]
        public int TypeOfContractID { get; set; }

        public string BranchID { get; set; }
        public string BranchStandFor { get; set; }

        [Display(Name = "ប្រភេទកិច្ចសន្យា:")]
        public string TypeOfContract { get; set; }

        [Required]
        [Display(Name = "កិច្ចសន្យាមុន(*):")]
        public string ContractNo { get; set; }

        [Display(Name = "កាលបរិច្ឆេទកិច្ចសន្យា(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ContractDate { get; set; }

        [Required]
        [Display(Name = "ឈ្មោះ​ក្រុមហ៊ុន(*):")]
        public string CompanyName { get; set; }

        [Required]
        [Display(Name = "ប្រភេទក្រុមហ៊ុន(*):")]
        public int TypeOfCompanyID { get; set; }

        [Display(Name = "ប្រភេទក្រុមហ៊ុន:")]
        public string TypeOfCompany { get; set; }

        [Required]
        [Display(Name = "លេខចុះបញ្ជី(*):")]
        public string RegistrationNo { get; set; }

        [Display(Name = "កាលបរិច្ឆេទ​ចុះបញ្ជី(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime RegistrationDate { get; set; }

        [Required]
        [Display(Name = "អាសយដ្ឋាន(*):")]
        public string CompanyAddress { get; set; }

        [Required]
        [Display(Name = "ទូរស័ព្ទ - ទូរសារ(*):")]
        public string CompanyTelephone { get; set; }

        [Display(Name = "អ៊ីម៉ែល - វេបសាយ:")]
        public string CompanyEmail { get; set; }

        [Required]
        [Display(Name = "តំណាងក្រុមហ៊ុន(*):")]
        public string CompanyDirector { get; set; }

        [Required]
        [Display(Name = "តំណែង(*):")]
        public string CompanyPosition { get; set; }

        [Required]
        [Display(Name = "ចំនួន​ប្រាក់កម្ចី(*):")]
        [Range(1, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LoanAmount { get; set; }

        [Required]
        [Display(Name = "អត្រា​ការ​ប្រាក់ (% ក្នុង​មួយ​ឆ្នាំ)*:")]
        [Range(0.01, float.MaxValue, ErrorMessage = "Please enter a value bigger than zero")]
        public float InterestRate { get; set; }

        [Required]
        [Display(Name = "រយៈពេល(ខែ)*:")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int Term { get; set; }

        [Required]
        [Display(Name = "សាហ៊ុយទម្រង់ការ(%)*:")]
        [Range(0.00, float.MaxValue, ErrorMessage = "Please enter a value bigger than zero")]
        public float ProcessingFee { get; set; }

        [Required]
        [Display(Name = "គោលបំណង(*):")]
        public string Purpose { get; set; }

        [Display(Name = "រយៈពេលអនុគ្រោះសងប្រាក់ដើម:")]
        public int? GracePeriod { get; set; }

        [Display(Name = "កាលបរិច្ឆេទសងដើម :")]
        public string RepaymentPrinciple { get; set; }

        [Display(Name = "កាលបរិចេ្ឆទសងការប្រាក់:")]
        public string RepaymentInterest { get; set; }

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

        public List<PropertyViewKhmer> HypothecatedProperty { get; set; }

        [Display(Name = "អ្នកធានា:")]
        public string GuarantorName { get; set; }

        [Display(Name = "អត្តសញ្ញាណប័ណ្ឌ/លិខិតឆ្លងដែន:")]
        public string GuarantorPassportNo { get; set; }

        [Display(Name = "កាលបរិច្ឆេទចេញផ្សាយ:")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime GuarantorPassportDate { get; set; }

        [Display(Name = "រយៈពេលដក់ប្រាក់(ខែ):")]
        public int? LoanWithdraw { get; set; }

        [Display(Name = "ថ្លៃសេវាផ្នែកច្បាប់:")]
        public int? LegalFee { get; set; }

        [Required]
        [Display(Name = "ទំនាក់ទំនងអ្នកខ្ចី(*):")]
        public string BorrowerContactPerson { get; set; }

        [Required]
        [Display(Name = "តំណែងអ្នកស្នើសុំ(*):")]
        public string BorrowerContactPosition { get; set; }

        [Required]
        [Display(Name = "ទូរស័ព្ទអ្នកខ្ចី(*):")]
        public string BorrowerContactPhone { get; set; }

        [Display(Name = "អ៊ីមែល:")]
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        public string BorrowerContactEmail { get; set; }

        [Required]
        [Display(Name = "ចំនួនកិច្ចសន្យាជាភាសាខ្មែរ(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOfContractKH { get; set; }

        [Required]
        [Display(Name = "ចំនួនកិច្ចសន្យាជាអង់គ្លេស(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOfContractEng { get; set; }

        [Required]
        [Display(Name = "ធនាគាររក្សាទុក(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberBankKeep { get; set; }

        [Required]
        [Display(Name = "អតិថិជនរក្សា(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberCustomerKeep { get; set; }

        [Required]
        [Display(Name = "រក្សាទុកផ្សេងទៀត(*):")]
        [Range(1, int.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public int NumberOtherKeep { get; set; }

        [Required]
        [Display(Name = "អ្នកទំនាក់ទំនងនៅធនាគារ(*):")]
        public string BankContactPerson { get; set; }

        [Required]
        [Display(Name = "តួនាទីអ្នកទំនាក់ទំនងនៅធនាគារ(*):")]
        public string BankContactPosition { get; set; }

        [Required]
        [Display(Name = "ទូរស័ព្ទ(*):")]
        public string BankContactPhone { get; set; }

        [Required]
        [Display(Name = "អ៊ីមែល(*):")]
        public string BankContactEmail { get; set; }

        [Display(Name = "លក្ខខណ្ឌផ្សេងទៀត:")]
        public string OtherCondition { get; set; }

        [Display(Name = "សោហ៊ុយរៀបចំឥណទានឡើងវិញ(%):")]
        public int? LoanRestrucFee { get; set; }

        [Display(Name = "កម្រៃសេវាទូទាត់ដំបូង(%):")]
        public int? EarlySettleFee { get; set; }

        [Display(Name = "ឈ្មោះម៉ូដែល:")]
        public string PlateNumberName { get; set; }

        [Display(Name = "ឈ្មោះម៉ូដែល:")]
        public string IssuedByName { get; set; }

        [Display(Name = "ឆ្នាំគំរូ:")]
        public string PlateNumberYear { get; set; }

        [Display(Name = "ឆ្នាំគំរូ:")]
        public string IssuedByYear { get; set; }

        [Display(Name = "លេខតួ:")]
        public string PlateChassis { get; set; }

        [Display(Name = "លេខតួ:")]
        public string IssuedByChassis { get; set; }

        [Display(Name = "លេខម៉ាស៊ីន:")]
        public string PlateEngine { get; set; }

        [Display(Name = "លេខម៉ាស៊ីន:")]
        public string IssuedByEngine { get; set; }

        [Display(Name = "លេខលតាប័ត្រ:")]
        public string PlateVignette { get; set; }

        [Display(Name = "លេខលតាប័ត្រ:")]
        public string IssuedByVignette { get; set; }

        public string Language { get; set; }

        [Required]
        [Display(Name = "ធនាគារតំណាង(*):")]
        public string BranchDirector { get; set; }

        [Display(Name = "តំណែង:")]
        public string BranchPosition { get; set; }

        [Required]
        [Display(Name = "រូបិយប័ណ្ណ:")]
        public string LoanCurrency { get; set; }

        [Display(Name = "រូបិយប័ណ្ណ:")]
        public string LegalCurrency { get; set; }


        [Display(Name = "គោលបំណងផ្សេងទៀត(*):")]
        public string OtherPurpose { get; set; }

        [Required]
        [Display(Name = "កិច្ចសន្យាលេខ(*):")]
        public string ContractNoSecond { get; set; }

        public string numberOfContract { get; set; }

        [Display(Name = "ប្រភេទប្លង់:")]
        public string TypeOfProperty { get; set; }

        public List<MortgagePropertyViewKhmer> MortgageProperty { get; set; }
        public List<SelectListItem> ContractTypeItems { get; set; }
        public List<SelectListItem> CurrencyItems { get; set; }
        public List<SelectListItem> CompanyTypeItems { get; set; }
        public List<SelectListItem> PurposeTypeItems { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public List<GuarantorViewKhmer> Guarantor { get; set; }
        public List<SelectListItem> BranchPositionItems { get; set; }

        [Required]
        [Display(Name = "កាលបរិច្ឆេទដាក់ពាក្យស្នើសុំ(*):")]
        //[DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        [DisplayFormat(DataFormatString = "{0:dd-MMMM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime ApplicationDate { get; set; }

        [Required]
        [Display(Name = "Cif:")]
        public string Cif { get; set; }

        public bool flagCompany { get; set; }

        [Display(Name = "លិខិតឥណទាន និងការធានាពីធានាគារ:")]
        [Range(0, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LCBankGuarantee { get; set; }

        [Display(Name = "ម្ចាស់:")]
        public string Owner { get; set; }

        [Display(Name = "គណនីបញ្ញើមានកាលកំណត់:")]
        public string IDNumber { get; set; }

        [Display(Name = "បើកកាលបរិច្ឆេទ:")]
        public DateTime OpeningDate { get; set; }

        [Display(Name = "ប្រភេទប្រាក់បញ្ញើ:")]
        public string TypeOfDeposit { get; set; }

        //public DateTime ExpiryDate { get; set; }

        public List<FixDepositViewKhmer> FixDeposit { get; set; }

        public CreateCompanyContractKhmer()
        {
            HypothecatedProperty = new List<PropertyViewKhmer>();
            MortgageProperty = new List<MortgagePropertyViewKhmer>();
            ContractTypeItems = new List<SelectListItem>();
            CurrencyItems = new List<SelectListItem>();
            CompanyTypeItems = new List<SelectListItem>();
            PurposeTypeItems = new List<SelectListItem>();
            PropertyTypeItems = new List<SelectListItem>();
            Guarantor = new List<GuarantorViewKhmer>();
            flagCompany = false;
            BranchPositionItems = new List<SelectListItem>();
            FixDeposit = new List<FixDepositViewKhmer>();
        }
    }
}