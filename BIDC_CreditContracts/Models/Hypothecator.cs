using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Hypothecator
    {
        public int ID { get; set; }
        public string HypothecContract { get;set;}
        public string HypothecatorName { get; set; }
        public string HypothecatorSex { get; set; }
        public DateTime HypothecatorBirthDate { get; set; }
        public string HypothecatorNationality { get; set; }
        public string HypothecatorAddress { get; set; }
        public string HypothecatorVillage { get; set; }
        public string HypothecatorSangkat { get; set; }
        public string HypothecatorKhan { get; set; }
        public string HypothecatorCapital { get; set; }
        public string Language { get; set; }
    }

    public class HypothecatorEng
    {
        public int ID { get; set; }
        public string HypothecContract { get; set; }
        [Display(Name = "Name:")]
        public string HypothecatorName { get; set; }
        [Display(Name = "Sex:")]
        public string HypothecatorSex { get; set; }
        [Display(Name = "Date of Birth:")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime HypothecatorBirthDate { get; set; }
        [Display(Name = "Nationality:")]
        public string HypothecatorNationality { get; set; }
        [Display(Name = "Address:")]
        public string HypothecatorAddress { get; set; }
        [Display(Name = "Village:")]
        public string HypothecatorVillage { get; set; }
        [Display(Name = "Commune/Sangkat:")]
        public string HypothecatorSangkat { get; set; }
        [Display(Name = "District/Khan:")]
        public string HypothecatorKhan { get; set; }
        [Display(Name = "Capital/Province:")]
        public string HypothecatorCapital { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }

    public class HypothecatorKhmer
    {
        public int ID { get; set; }
        public string HypothecContract { get; set; }
        [Display(Name = "ឈ្មោះ:")]
        public string HypothecatorName { get; set; }
        [Display(Name = "ការរួមភេទ:")]
        public string HypothecatorSex { get; set; }
        [Display(Name = "ថ្ងៃកំណើត:")]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime HypothecatorBirthDate { get; set; }
        [Display(Name = "សញ្ជាតិ:")]
        public string HypothecatorNationality { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string HypothecatorAddress { get; set; }
        [Display(Name = "ភូមិ:")]
        public string HypothecatorVillage { get; set; }
        [Display(Name = "ឃុំ / សង្កាត់:")]
        public string HypothecatorSangkat { get; set; }
        [Display(Name = "ស្រុក / ខណ្ឌ:")]
        public string HypothecatorKhan { get; set; }
        [Display(Name = "រាជធានី / ខេត្ត:")]
        public string HypothecatorCapital { get; set; }
        public string Language { get; set; }
        public bool isSaved { get; set; }
    }
}