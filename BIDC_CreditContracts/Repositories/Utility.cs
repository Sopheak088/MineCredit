using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Spire.Doc;
using Spire.Doc.Documents;
using BIDC_CreditContracts.DAL;
using BIDC_CreditContracts.Models;

namespace BIDC_CreditContracts.Repositories
{
    public class Utility
    {

        public string EngNumberToWords(int number)
        {
            if (number == 0)
                return "Zero";

            if (number < 0)
                return "Minus " + EngNumberToWords(Math.Abs(number));

            string words = "";

            if ((number / 1000000) > 0)
            {
                words += EngNumberToWords(number / 1000000) + " Million ";
                number %= 1000000;
            }

            if ((number / 1000) > 0)
            {
                words += EngNumberToWords(number / 1000) + " Thousand ";
                number %= 1000;
            }

            if ((number / 100) > 0)
            {
                words += EngNumberToWords(number / 100) + " Hundred ";
                number %= 100;
            }

            if (number > 0)
            {
                if (words != "")
                    words += "and ";

                var unitsMap = new[] { "Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen" };
                var tensMap = new[] { "Zero", "Ten", "Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += "-" + unitsMap[number % 10];
                }
            }

            return words;
        }

        public string KhmerNumberToWords(int number)
        {
            if (number == 0)
                return "សូន្យ";

            if (number < 0)
                return "ដក " + KhmerNumberToWords(Math.Abs(number));

            string words = "";

            if ((number / 1000000) > 0)
            {
                words += KhmerNumberToWords(number / 1000000) + "លាន";
                number %= 1000000;
            }

            //if ((number / 100000) > 0)
            //{
            //    words += KhmerNumberToWords(number / 100000) + "សែន";
            //    number %= 100000;
            //}

            //if ((number / 10000) > 0)
            //{
            //    words += KhmerNumberToWords(number / 10000) + "ម៉ឺន";
            //    number %= 10000;
            //}

            if ((number / 1000) > 0)
            {
                words += KhmerNumberToWords(number / 1000) + "ពាន់";
                number %= 1000;
            }

            if ((number / 100) > 0)
            {
                words += KhmerNumberToWords(number / 100) + "រយ";
                number %= 100;
            }

            if (number > 0)
            {
                if (words != "")
                    words += "";

                var unitsMap = new[] { "សូន្យ", "មូយ", "ពីរ", "បី", "បួន", "ប្រាំ", "ប្រាំមួយ", "ប្រាំពីរ", "ប្រាំបី", "ប្រាំបួន", "ដប់", "ដប់មួយ", "ដប់ពីរ", "ដប់បី", "ដប់បួន", "ដប់ប្រាំ", "ដប់ប្រាំមួយ", "ដប់ប្រាំពីរ", "ដប់ប្រាំបី", "ដប់ប្រាំបូន" };
                var tensMap = new[] { "សូន្យ", "ដប់", "ម្ភៃ", "សាមសិប", "សែសិប", "ហាសិប", "ហុកសិប", "ចិតសិប", "ប៉ែតសិប", "កៅសិប" };

                if (number < 20)
                    words += unitsMap[number];
                else
                {
                    words += tensMap[number / 10];
                    if ((number % 10) > 0)
                        words += "-" + unitsMap[number % 10];
                }
            }

            return words;
        }

        
    }
}