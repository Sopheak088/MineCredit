using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Property
    {
        public int PropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public string Ownership { get; set; }
        public string Pacelnumber { get; set; }
        public string TitleNumber { get; set; }
        public string Location { get; set; }
        public string TypeOfProperty { get; set; }
        public string TotalSize { get; set; }
        //public string HypothecContractNo { get; set; }
        //public string DecideCode { get; set; }
        //public bool isLoanContract { get; set; }
        //public string CollateralFor { get; set; }
    }

    public class PropertyForDecision
    {
        [Key]
        public int PropertyID { get; set; }
        public string DecideCode { get; set; }
        public string Ownership { get; set; }
        public string Pacelnumber { get; set; }
        public string TitleNumber { get; set; }
        public string Location { get; set; }
        public string TypeOfProperty { get; set; }
        public string TotalSize { get; set; }
        public bool isLoanContract { get; set; }
        public string CollateralFor { get; set; }
        public string Language { get; set; }
    }

    public class PropertyForHypothec
    {
        [Key]
        public int PropertyID { get; set; }
        public string HypothecContractNo { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public string Ownership { get; set; }
        public string Pacelnumber { get; set; }
        public string TitleNumber { get; set; }
        public string Location { get; set; }
        public string TypeOfProperty { get; set; }
        public string TotalSize { get; set; }
    }

    public class PropertyView
    {
        public int PropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }

        [Display(Name = "Ownership:")]
        public string Ownership { get; set; }

        [Display(Name = "Pacel number:")]
        public string Pacelnumber { get; set; }

        [Display(Name = "Title number:")]
        public string TitleNumber { get; set; }

        [Display(Name = "Location:")]
        public string Location { get; set; }

        [Display(Name = "Type Property:")]
        public string TypeOfProperty { get; set; }
        [Display(Name = "Total Size:")]
        public string TotalSize { get; set; }
        [Display(Name = "Collateral For:")]
        public string CollateralFor { get; set; }
    }

    public class PropertyViewKhmer
    {
        public int PropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }

        [Display(Name = "ភាពជាម្ចាស់:")]
        public string Ownership { get; set; }

        [Display(Name = "លេខប៉ាក់:")]
        public string Pacelnumber { get; set; }

        [Display(Name = "លេខចំណងជើង:")]
        public string TitleNumber { get; set; }

        [Display(Name = "ទីតាំង:")]
        public string Location { get; set; }
        [Display(Name = "វាយបញ្ចូលលក្ខណសម្បត្តិ:")]
        public string TypeOfProperty { get; set; }
        [Display(Name = "ទំហំសរុប:")]
        public string TotalSize { get; set; }
    }
}