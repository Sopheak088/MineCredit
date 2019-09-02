using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BIDC_CreditContracts.Models
{
    public class IndividualContract
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public DateTime ContractDate { get; set; }
        public string BankRepresented { get; set; }
        public string BankPosition { get; set; }
        public string CustomerName { get; set; }
        public string CustomerID { get; set; }
        public DateTime CusIssuedDate { get; set; }
        public string CustAddress { get; set; }
        public string CustPhone { get; set; }
        public float LoanAmount { get; set; }
        public string Purpose { get; set; }
        public int? LoanTerm { get; set; }
        public float InterestRate { get; set; }
        public DateTime InterestDate { get; set; }
        public int? PrincipalPayment { get; set; }
        public float? ProcessingFee { get; set; }
        public string WithdrawTerm { get; set; }
        public string OriginalLoan { get; set; }
        public string PaymentInterest { get; set; }
        public string AccountNo { get; set; }
        public string Language { get; set; }
        public string FileName { get; set; }

        public int IndividualContractType_ID { get; set; }
        public virtual IndividualContractType IndividualContractType { get; set; }

        public string BranchID { get; set; }
        public string BanchName { get; set; }
        public virtual Branch Branch { get; set; }

        public string LoanCurrency { get; set; }
        public string OtherContract { get; set; }
        public string OtherPurpose { get; set; }
    }

    public class CreateIndividualContractEng
    {
        public int ID { get; set; }

        [Required]
        [Display(Name = "Pre contract no:")]
        public string ContractNo { get; set; }

        [Required]
        [Display(Name = "Contract no(*):")]
        public string ContractNoSecond { get; set; }

        public string BranchID { get; set; }

        [Required]
        [Display(Name = "Contract date:")]
        public DateTime ContractDate { get; set; }

        [Required]
        [Display(Name = "Represented by:")]
        public string BankRepresented { get; set; }

        [Display(Name = "Position:")]
        public string BankPosition { get; set; }

        [Required]
        [Display(Name = "Customer name:")]
        public string CustomerName { get; set; }

        [Required]
        [Display(Name = "ID No:")]
        public string CustomerID { get; set; }

        [Required]
        [Display(Name = "Issued date:")]
        public DateTime CusIssuedDate { get; set; }

        [Required]
        [Display(Name = "Current Address:")]
        public string CustAddress { get; set; }

        [Required]
        [Display(Name = "Mobile Number:")]
        public string CustPhone { get; set; }

        [Required]
        [Display(Name = "Loan Amount:")]
        public float LoanAmount { get; set; }

        [Required]
        [Display(Name = "Purpose:")]
        public string Purpose { get; set; }
       
        [Display(Name = "Loan Term:")]
        public int? LoanTerm { get; set; }

        [Required]
        [Display(Name = "InterestRate:")]
        public float InterestRate { get; set; }

        [Display(Name = "Interest date:")]
        public DateTime InterestDate { get; set; }

        [Display(Name = "Principal Payment:")]
        public int? PrincipalPayment { get; set; }

        [Display(Name = "Account No:")]
        public string AccountNo { get; set; }

        [Display(Name = "Processing Fee:")]
        public float ProcessingFee { get; set; }

        [Display(Name = "Withdraw Term:")]
        public string WithdrawTerm { get; set; }

        [Display(Name = "Original Loan:")]
        public string OriginalLoan { get; set; }

        [Display(Name = "Payment Interest:")]
        public string PaymentInterest { get; set; }

        public string Language { get; set; }
        public string FileName { get; set; }

        [Display(Name = "Contract type:")]
        public int IndividualTypeID { get; set; }

        [Display(Name = "Contract type:")]
        public string IndividualType { get; set; }

        public List<HousingLoanEnglish> listHousingLoan { get; set; }
        public List<CarLoanEnglish> listCarLoan { get; set; }
        public List<FixLoanEnglish> listFixLoan { get; set; }

        [Display(Name = "Detail of collateral:")]
        public string OtherContract { get; set; }

        public string BranchStandFor { get; set; }
        public string NumberOfContract { get; set; }
        public int TotalValueCarLoan { get; set; }
        public int TotalValueFixLoan { get; set; }
        public int TotalValueHousingLoan { get; set; }

        [Display(Name = "Description:")]
        public string CarLoanDescription { get; set; }
        [Display(Name = "Type:")]
        public string CarLoanType { get; set; }
        [Display(Name = "Value:")]
        public float CardLoanValue { get; set; }

        [Display(Name = "Kind of Callateral:")]
        public string FixLoanCollateralType {get;set;}
        [Display(Name = "Ownership:")]
        public string FixLoanOwnership {get;set;}
        [Display(Name = "Title Deed Number:")]
        public string FixLoanTitleDeedNumber { get; set; }
        [Display(Name = "Total Size In:")]
        public string FixLoanTotalSizeIn { get; set; }
        [Display(Name = "Price per sqm In:")]
        public string FixLoanPricePerSqm { get; set; }
        [Display(Name = "Tota price in:")]
        public float FixLoanTotalPriceIn { get; set; }

        [Display(Name = "Type:")]
        public string HosingLoanCollateralType { get; set; }
        [Display(Name = "Description:")]
        public string HousingLoanDescription { get; set; }
        [Display(Name = "Total size:")]
        public string HousingLoanTotalSize { get; set; }
        [Display(Name = "Value:")]
        public float HousingLoanValue { get; set; }

        [Required]
        [Display(Name = "Other Purpose:")]
        public string OtherPurpose { get; set; }

        public List<SelectListItem> ContractTypeItems { get; set; }
        public List<SelectListItem> PurposeTypeItems { get; set; }
        public List<SelectListItem> PropertyTypeItems { get; set; }
        public CreateIndividualContractEng()
        {
            listHousingLoan = new List<HousingLoanEnglish>();
            listCarLoan = new List<CarLoanEnglish>();
            listFixLoan = new List<FixLoanEnglish>();
            ContractTypeItems = new List<SelectListItem>();
            PurposeTypeItems = new List<SelectListItem>();
            PropertyTypeItems = new List<SelectListItem>();
        }
    }
}