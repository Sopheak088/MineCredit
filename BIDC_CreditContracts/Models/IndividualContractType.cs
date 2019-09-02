using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class IndividualContractType
    {
        public int ID { get; set; }
        public string TypeName { get; set; }
        public string TypeNameKhmer { get; set; }
        public string StandFor { get; set; }
        public virtual ICollection<IndividualContract> IndividualContracts { get; set; }
    }
}