using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class TypeOfProperty
    {
        public int ID { get; set; }
        public string PropertyName { get; set; }
        public string PropertyNameKhmer { get; set; }
        //public virtual ICollection<Property> Properties { get; set; }
    }
}