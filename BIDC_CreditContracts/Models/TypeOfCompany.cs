using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class TypeOfCompany
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string NameKhmer { get; set; }
        public virtual ICollection<Contract> Contracts { get; set; }
        public virtual ICollection<Company> Companies { get; set; }
    }
}