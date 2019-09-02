using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class MortgageProperty
    {
        public int MortgagePropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public string PlateNumberName { get; set; }
        public string IssuedByName { get; set; }
        public string PlateNumberYear { get; set; }
        public string IssuedByYear { get; set; }
        public string PlateChassis { get; set; }
        public string IssuedByChassis { get; set; }
        public string PlateEngine { get; set; }
        public string IssuedByEngine { get; set; }
        public string PlateVignette { get; set; }
        public string IssuedByVignette { get; set; }
        public string DecideCode { get; set; }
        public bool isLoanContract { get; set; }
        public string CollateralFor { get; set; }
    }

    public class MortgagePropertyView
    {
        public int MortgagePropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
        [Display(Name = "Model name (ឈ្មោះម៉ូដែល):")]
        public string PlateNumberName { get; set; }
        [Display(Name = "Model name (ឈ្មោះម៉ូដែល):")]
        public string IssuedByName { get; set; }
        [Display(Name = "Model year (ឆ្នាំគំរូ):")]
        public string PlateNumberYear { get; set; }
        [Display(Name = "Model year (ឆ្នាំគំរូ):")]
        public string IssuedByYear { get; set; }
        [Display(Name = "Chassis No (លេខស៊ុម):")]
        public string PlateChassis { get; set; }
        [Display(Name = "Chassis No (លេខស៊ុម):")]
        public string IssuedByChassis { get; set; }
        [Display(Name = "Engine No (ម៉ាស៊ីនគ្មាន):")]
        public string PlateEngine { get; set; }
        [Display(Name = "Engine No (ម៉ាស៊ីនគ្មាន):")]
        public string IssuedByEngine { get; set; }
        [Display(Name = "Vignette No (កូនរូបភាព):")]
        public string PlateVignette { get; set; }
        [Display(Name = "Vignette No (កូនរូបភាព):")]
        public string IssuedByVignette { get; set; }
        [Display(Name = "Collateral For:")]
        public string CollateralFor { get; set; }
    }

    public class MortgagePropertyViewKhmer
    {
        public int MortgagePropertyID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
        [Display(Name = "ឈ្មោះម៉ូដែល:")]
        public string PlateNumberName { get; set; }
        [Display(Name = "ឈ្មោះម៉ូដែល:")]
        public string IssuedByName { get; set; }
        [Display(Name = "ឆ្នាំគំរូ:")]
        public string PlateNumberYear { get; set; }
        [Display(Name = "ឆ្នាំគំរូ:")]
        public string IssuedByYear { get; set; }
        [Display(Name = "លេខស៊ុម:")]
        public string PlateChassis { get; set; }
        [Display(Name = "លេខស៊ុម:")]
        public string IssuedByChassis { get; set; }
        [Display(Name = "ម៉ាស៊ីនគ្មាន:")]
        public string PlateEngine { get; set; }
        [Display(Name = "ម៉ាស៊ីនគ្មាន:")]
        public string IssuedByEngine { get; set; }
        [Display(Name = "កូនរូបភាព:")]
        public string PlateVignette { get; set; }
        [Display(Name = "កូនរូបភាព:")]
        public string IssuedByVignette { get; set; }
    }
}