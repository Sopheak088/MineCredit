using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class TypeOfContract
    {
        public int ID { get; set; }
        public string TypeName { get; set; }
        public string StandFor { get; set; }
        public string TypeNameKhmer { get; set; }

        public virtual ICollection<Contract> Contracts { get; set; }
    }
}