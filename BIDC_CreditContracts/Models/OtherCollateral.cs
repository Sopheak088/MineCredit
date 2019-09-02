using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace BIDC_CreditContracts.Models
{
    public class OtherCollateral
    {
        public int ID { get; set; }
        public string AssetInformation { get; set; }
        public string IssuedBy { get; set; }
        public string DecideCode { get; set; }
        public bool isLoanContract { get; set; }
        public string CollateralFor { get; set; }
    }

    public class OtherCollateralView
    {
        public int OtherCollateralID { get; set; }
        [Display(Name = "Asset Information:")]
        public string AssetInformation { get; set; }
        [Display(Name = "Issued By:")]
        public string IssuedBy { get; set; }
        [Display(Name = "Collateral For:")]
        public string CollateralFor { get; set; }
        public bool isSaved { get; set; }
    }
}