using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Branch
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public string BranchID { get; set; }
        public string BranchName { get; set; }
        public string BranchRegistrationNo { get; set; }
        public DateTime BranchRegisrationDate { get; set; }
        public string BranchAddress { get; set; }
        public string Telephone { get; set; }
        public string Fax { get; set; }
        public string Email { get; set; }
        //public string BranchDirector { get; set; }
        public string BankLicense { get; set; }
        public DateTime LicenseDate { get; set; }
        public string BranchNameKhmer { get; set; }
        public string BranchAddressKhmer { get; set; }
        public string BranchStandFor { get; set; }

        public virtual ICollection<Contract> Contracts { get; set; }
        public virtual ICollection<IndividualContract> IndividualContracts { get; set; }
        public virtual ICollection<HypothecContract> HypothecContracts { get; set; }
    }
}