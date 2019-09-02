using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BIDC_CreditContracts.Models;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;

namespace BIDC_CreditContracts.DAL
{
    public class CreditContractContext : DbContext
    {

        public CreditContractContext():base("CreditContractContext")
        {

        }
        public DbSet<Branch> Branches { get; set; }
        public DbSet<Contract> Contracts { get; set; }
        public DbSet<TypeOfContract> TypeOfContracts { get; set; }
        public DbSet<Property> Properties { get; set; }
        public DbSet<MortgageProperty> MortgageProperties { get; set; }
        public DbSet<IndividualContract> IndividualContracts { get; set; }
        public DbSet<IndividualContractType> IndividualContractTypes { get; set; }
        public DbSet<Currency> Currencies { get; set; }
        public DbSet<HousingLoan> HousingLoans { get; set; }
        public DbSet<CarLoan> CarLoans { get; set; }
        public DbSet<FixLoan> FixLoans { get; set; }
        public DbSet<TypeOfCompany> TypeOfCompanies { get; set; }
        public DbSet<TypeOfProperty> TypeOfProperties { get; set; }
        public DbSet<TypeOfPurpose> TypeOfPurposes { get; set; }
        public DbSet<Guarantor> Guarantors { get; set; }
        public DbSet<Hypothecator> Hypothecators { get; set; }
        public DbSet<Debtor> Debtors { get; set; }
        public DbSet<HypothecContract> HypothecContracts { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<BankPosition> BankPositions { get; set; }
        public DbSet<SecurityCreator> SecurityCreators { get; set; }
        public DbSet<SecurityContract> SecurityContracts { get; set; }
        public DbSet<Decide> Decides { get; set; }
        public DbSet<PropertyForDecision> PropertyForDecisions { get; set; }
        public DbSet<PropertyForHypothec> PropertyForHypothecs { get; set; }
        public DbSet<Sex> Sexes { get; set; }
        public DbSet<OtherCollateral> OtherCollaterals { get; set; }
        public DbSet<FixDeposit> FixDeposits { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
        }
    }
}