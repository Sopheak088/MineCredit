using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class FixDeposit
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        public string Owner { get; set; }
        public string IDNumber { get; set; }
        public DateTime OpeningDate { get; set; }
        public string TypeOfDeposit { get; set; }
        public string Language { get; set; }
    }

    public class FixDepositViewEng
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        [Display(Name = "Owner:")]
        public string Owner { get; set; }
        [Display(Name = "ID Number:")]
        public string IDNumber { get; set; }
        [Display(Name = "Opening Date:")]
        public DateTime OpeningDate { get; set; }
        [Display(Name = "Type Of Deposit:")]
        public string TypeOfDeposit { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }

    public class FixDepositViewKhmer
    {
        public int ID { get; set; }
        public string ContractNo { get; set; }
        [Display(Name = "ម្ចាស់:")]
        public string Owner { get; set; }
        [Display(Name = "គណនីបញ្ញើមានកាលកំណត់:")]
        public string IDNumber { get; set; }
        [Display(Name = "បើកកាលបរិច្ឆេទ:")]
        public DateTime OpeningDate { get; set; }
        [Display(Name = "ប្រភេទប្រាក់បញ្ញើ:")]
        public string TypeOfDeposit { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }
}