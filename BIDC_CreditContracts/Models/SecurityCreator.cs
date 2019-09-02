using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class SecurityCreator
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string IDNo { get; set; }
        public DateTime IssuedDate { get; set; }
        public string IssuedBy { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
        public string Language { get; set; }
        public string SecurityContract { get; set; }
    }

    public class SecurityCreatorEng
    {
        public int ID { get; set; }
        [Display(Name = "Name:")]
        public string Name { get; set; }
        [Display(Name = "Identity Card No:")]
        public string IDNo { get; set; }
        [Display(Name = "Issued Date:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime IssuedDate { get; set; }
        [Display(Name = "Issued By:")]
        public string IssuedBy { get; set; }
        [Display(Name = "Address:")]
        public string Address { get; set; }
        [Display(Name = "Telephone:")]
        public string Telephone { get; set; }
        [Display(Name = "Email:")]
        public string Email { get; set; }
        public string Language { get; set; }
        public string SecurityContract { get; set; }
        public bool isSaved { get; set; }
    }

    public class SecurityCreatorKhmer 
    {
        public int ID { get; set; }
        [Display(Name = "ឈ្មោះ:")]
        public string Name { get; set; }
        [Display(Name = "គ្មានអត្តសញ្ញាណប័ណ្ណ:")]
        public string IDNo { get; set; }
        [Display(Name = "កាលបរិច្ឆេទចេញផ្សាយ:")]
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}")]
        public DateTime IssuedDate { get; set; }
        [Display(Name = "ចេញដោយ:")]
        public string IssuedBy { get; set; }
        [Display(Name = "អាសយដ្ឋាន:")]
        public string Address { get; set; }
        [Display(Name = "ទូរស័ព្ទ:")]
        public string Telephone { get; set; }
        [Display(Name = "អ៊ីមែល:")]
        public string Email { get; set; }
        public string Language { get; set; }
        public string SecurityContract { get; set; }
        public bool isSaved { get; set; }
    }
}