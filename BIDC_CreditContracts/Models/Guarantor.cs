using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Guarantor
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Language { get;set; }
        public string GuarantorName { get; set; }
        public string Passport { get; set; }
        public DateTime PassportDate { get; set; }
        public string DecideCode { get; set; }
        public bool isLoanContract { get; set; }
    }

    public class GuarantorViewEng
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public bool isSaved { get; set; }
        public string Language { get; set; }

        [Display(Name = "Mr/Mrs/Company name:")]
        public string GuarantorName { get; set; }

        [Display(Name = "Card/Passport No:")]
        public string Passport { get; set; }

        [Display(Name = "Issued date:")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime PassportDate { get; set; }
    }

    public class GuarantorViewKhmer
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public bool isSaved { get; set; }
        public string Language { get; set; }

        [Display(Name = "អ្នកធានា:")]
        public string GuarantorName { get; set; }

        [Display(Name = "អត្តសញ្ញាណប័ណ្ឌ/លិខិតឆ្លងដែន:")]
        public string Passport { get; set; }

        [Display(Name = "កាលបរិច្ឆេទចេញផ្សាយ:")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime PassportDate { get; set; }
    }
}