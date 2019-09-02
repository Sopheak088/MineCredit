using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class CarLoan
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        public string Description { get; set; }
        public string Type { get; set; }
        public float Value { get; set; }
    }

    public class CarLoanEnglish
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get; set; }
        [Display(Name = "Desciption:")]
        public string Description { get; set; }
        [Display(Name = "Type:")]
        public string Type { get; set; }
        [Display(Name = "Value (USD):")]
        public float Value { get; set; }
        public bool isSaved { get; set; }
    }
}