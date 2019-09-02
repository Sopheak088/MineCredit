using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class Currency
    {
        public int ID { get; set; }
        public string CurrencyID { get; set; }
        public string CurrencyName { get; set; }
    }
}