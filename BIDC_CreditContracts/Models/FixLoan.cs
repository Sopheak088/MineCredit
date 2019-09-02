using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class FixLoan
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public string KindOfCollateral { get; set; }
        public string Ownership { get; set; }
        public string TitleDeedNumbers { get; set; }
        public string TotalSizeIn { get; set; }
        public string PricePerSqmIn { get; set; }
        public float TotalPriceIn { get; set; }
    }

    public class FixLoanEnglish
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        [Display(Name = "Kind of Collateral:")]
        public string KindOfCollateral { get; set; }
        [Display(Name = "Ownership:")]
        public string Ownership { get; set; }
        [Display(Name = "Title Deed Numbers:")]
        public string TitleDeedNumbers { get; set; }
        [Display(Name = "Total size in (sqm):")]
        public string TotalSizeIn { get; set; }
        [Display(Name = "Price per sqm in(USD):")]
        public string PricePerSqmIn { get; set; }
        [Display(Name = "Total price in(USD):")]
        public float TotalPriceIn { get; set; }
        public bool isSaved { get; set; }
    }
}