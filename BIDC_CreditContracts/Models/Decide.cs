using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Models
{
    public class Decide
    {
        public int ID { get; set; }
        public string DecideCode { get; set; }
        public string CreditProposalReport { get; set; }
        public DateTime CreditProposalDate { get; set; }
        public string RequestBy { get; set; }
        public string Cif { get; set; }
        public string CustomerName { get; set; }
        public string CustomerAddress { get; set; }
        public string Representative { get; set; }
        public double LoanAmount { get; set; }
        public double OutstandingLoan { get; set; }
        public DateTime OutstandingDate { get; set; }
        public string Currency { get; set; }
        public double NewLoanAmount { get; set; }
        public string TypeOfLoan { get; set; }
        public string Purpose { get; set; }
        public float InterestRate { get; set; }
        public float ProcessingFee { get; set; }
        public string RepaymentMethod { get; set; }
        public string DisbursementTime { get; set; }
        public string Condition { get; set; }
        public string OtherPurpose { get; set; }
        public string OtherCondition { get; set; }
        public string FileName { get; set; }
        public DateTime CreateDate { get; set; }
        public int Term { get; set; }
        public string BoardManagement { get; set; }
        public string FollowBy { get; set; }
        public double LCBankGuarantee { get; set; }
    }

    public class CreateDecideStep1
    {
        [Required]
        [Display(Name = "Decide Code:")]
        public string DecideCode { get; set; }
    }

    public class CreateDecide
    {
        public int ID { get; set; }
        [Display(Name = "Decide Code:")]
        public string DecideCode { get; set; }
        [Required]
        [Display(Name = "Credit Proposal Report(*):")]
        public string CreditProposalReport { get; set; }
        [Required]
        [Display(Name = "Credit Proposal Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime CreditProposalDate { get; set; }
        [Display(Name = "Follow by:")]
        public string FollowBy { get; set; }

        [Required]
        [Display(Name = "Requested by(*):")]
        public string RequestBy { get; set; }

        [Display(Name = "CIF(if any):")]
        public string Cif { get; set; }
        [Required]
        [Display(Name = "Customer Name(*):")]
        public string CustomerName { get; set; }
        [Required]
        [Display(Name = "Customer Address(*):")]
        public string CustomerAddress { get; set; }
        
        [Display(Name = "Representative (if any):")]
        public string Representative { get; set; }
        [Required]
        [Display(Name = "Existing Loan Amount(*):")]
        [Range(0, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LoanAmount { get; set; }
        [Required]
        [Display(Name = "Outstanding Loan(*):")]
        [Range(0, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double OutstandingLoan { get; set; }
        [Required]
        [Display(Name = "Outstanding Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true)]
        public DateTime OutstandingDate { get; set; }

        [Display(Name = "Currency:")]
        public string Currency { get; set; }
        [Required]
        [Display(Name = "New Loan Amount(*):")]
        [Range(1, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double NewLoanAmount { get; set; }

        [Display(Name = "LC and Bank Guarantee limit:")]
        [Range(0, double.MaxValue, ErrorMessage = "Please enter a value bigger than {1}")]
        public double LCBankGuarantee { get; set; }

        [Required]
        [Display(Name = "Term (month):")]
        public int Term { get; set; }

        [Display(Name = "Type Of Loan:")]
        public string TypeOfLoan { get; set; }
        [Required]
        [Display(Name = "Purpose(*):")]
        public string Purpose { get; set; }
        [Required]
        [Display(Name = "Other Purpose(*):")]
        public string OtherPurpose { get; set; }
        [Required]
        [Display(Name = "Interest Rate *(%/year):")]
        [Range(0.01, float.MaxValue, ErrorMessage = "Please enter a value bigger than zero")]
        public float InterestRate { get; set; }
        [Required]
        [Display(Name = "Processing Fee *(%/total amount):")]
        [Range(0.00, double.MaxValue, ErrorMessage = "Please enter a value equal or bigger than zero")]
        public float ProcessingFee { get; set; }
        [Required]
        [Display(Name = "Repayment Method(*):")]
        public string RepaymentMethod { get; set; }
        [Required]
        [Display(Name = "Disbursement Time(*):")]
        public string DisbursementTime { get; set; }

        [Display(Name = "Condition for customer:")]
        public string Condition { get; set; }
        [Display(Name = "Other Condition:")]
        public string OtherCondition { get; set; }

        [Display(Name = "Board of management:")]
        public string BoardManagement { get; set; }

        [Display(Name = "Title deed:")]
        public string TypeOfProperty { get; set; }
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
        [Display(Name = "Collateral For:")]
        public string CollateralProperty { get; set; }

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
        [Display(Name = "Collateral For:")]
        public string CollateralMortgate { get; set; }

        [Display(Name = "Asset Information:")]
        public string AssetInformation { get; set; }
        [Display(Name = "Issued By:")]
        public string IssuedBy { get; set; }
        [Display(Name = "Collateral For:")]
        public string OtherCollateralFor { get; set; }

        public List<SelectListItem> PurposeTypeItems { get; set; }
        public List<SelectListItem> ContractTypeItems { get; set; }
        public List<SelectListItem> CurrencyItems { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public List<SelectListItem> CollateralForItems { get; set; }
        public List<SelectListItem> BoardManagementItems { get; set; }

        public List<MortgagePropertyView> NewMortgageProperty { get; set; }
        public List<GuarantorViewEng> NewGuarantor { get; set; }
        public List<PropertyView> NewProperty { get; set; }
        public List<OtherCollateralView> NewOtherCollateral { get; set; }

        //public List<MortgagePropertyView> OldMortgageProperty { get; set; }
        //public List<GuarantorViewEng> OldGuarantor { get; set; }
        //public List<PropertyView> OldProperty { get; set; }

        public CreateDecide()
        {
            PurposeTypeItems = new List<SelectListItem>();
            ContractTypeItems = new List<SelectListItem>();
            CurrencyItems = new List<SelectListItem>();
            NewMortgageProperty = new List<MortgagePropertyView>();
            NewGuarantor = new List<GuarantorViewEng>();
            NewProperty = new List<PropertyView>();
            NewOtherCollateral = new List<OtherCollateralView>();
            CollateralForItems = new List<SelectListItem>();
            BoardManagementItems = new List<SelectListItem>();
            //OldMortgageProperty = new List<MortgagePropertyView>();
            //OldGuarantor = new List<GuarantorViewEng>();
            //OldProperty = new List<PropertyView>();
            PropertyTypeItems = new List<SelectListItem>();
        }
    }

    public class SearchDecide
    {
        [Display(Name = "From Date:")]
        public string FromDate { get; set; }

        [Display(Name = "To Date:")]
        public string ToDate { get; set; }
        public IEnumerable<Decide> listDecides { get; set; }
        public SearchDecide()
        {
            listDecides = new List<Decide>();
        }
    }
}