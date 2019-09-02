using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class TypeOfConstruction
    {
        public int ID { get; set; }
        public string ConstructionTypeName { get; set; }

        public virtual ICollection<Property> Properties { get; set; }
    }
}