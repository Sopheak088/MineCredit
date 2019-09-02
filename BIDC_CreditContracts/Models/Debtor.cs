using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Debtor
    {
        public int ID { get; set; }
        public string HypothecContract { get; set; }
        public string DebtorName { get; set; }
        public string DebtorSex { get; set; }
        public DateTime DebtorBirthDate { get; set; }
        public string DebtorNationality { get; set; }
        public string DebtorAddress { get; set; }
        public string DebtorVillage { get; set; }
        public string DebtorSangkat { get; set; }
        public string DebtorKhan { get; set; }
        public string DebtorCapital { get; set; }
        public string Language { get; set; }
    }

    public class DebtorEng
    {
        public int ID { get; set; }
        public string HypothecContract { get; set; }
        [Display(Name = "Name:")]
        public string DebtorName { get; set; }
        [Display(Name = "Sex:")]
        public string DebtorSex { get; set; }
        [Display(Name = "Date of Birth:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime DebtorBirthDate { get; set; }
        [Display(Name = "Nationality:")]
        public string DebtorNationality { get; set; }
        [Display(Name = "Address:")]
        public string DebtorAddress { get; set; }
        [Display(Name = "Village:")]
        public string DebtorVillage { get; set; }
        [Display(Name = "Commune/Sangkat:")]
        public string DebtorSangkat { get; set; }
        [Display(Name = "District/Khan:")]
        public string DebtorKhan { get; set; }
        [Display(Name = "Capital/Province:")]
        public string DebtorCapital { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }

    public class DebtorKhmer
    {
        public int ID { get; set; }
        public string HypothecContract { get; set; }
        [Display(Name = "ឈ្មោះ:")]
        public string DebtorName { get; set; }
        [Display(Name = "ការរួមភេទ:")]
        public string DebtorSex { get; set; }
        [Display(Name = "ថ្ងៃកំណើត:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime DebtorBirthDate { get; set; }
        [Display(Name = "សញ្ជាតិ:")]
        public string DebtorNationality { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string DebtorAddress { get; set; }
        [Display(Name = "ភូមិ:")]
        public string DebtorVillage { get; set; }
        [Display(Name = "ឃុំ / សង្កាត់:")]
        public string DebtorSangkat { get; set; }
        [Display(Name = "ស្រុក / ខណ្ឌ:")]
        public string DebtorKhan { get; set; }
        [Display(Name = "រាជធានី / ខេត្ត:")]
        public string DebtorCapital { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }
}