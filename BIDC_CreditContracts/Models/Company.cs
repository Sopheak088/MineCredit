using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Company
    {
        public int ID { get; set; }
        public string Cif { get; set; }

        [Display(Name = "Company name:")]
        public string CompanyName { get; set; }

        [Display(Name = "Registration No:")]
        public string RegistrationNo { get; set; }

        [Display(Name = "Registration Date:")]
        public DateTime RegistrationDate { get; set; }

        [Display(Name = "Address:")]
        public string CompanyAddress { get; set; }

        [Display(Name = "Telephone:")]
        public string CompanyTelephone { get; set; }

        [Display(Name = "Email:")]
        public string CompanyEmail { get; set; }

        [Display(Name = "Chairperson/ Director:")]
        public string CompanyDirector { get; set; }

        public string Position { get; set; }

        public string Language { get; set; }

        public int TypeOfCompanyID { get; set; }
        public virtual TypeOfCompany TypeOfCompany { get; set; }

    }
}