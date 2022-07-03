using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace Utiles
{
    public static class StringExtension
    {
        public static string NullOrEmpty(this String str)
        {
            return String.IsNullOrEmpty(str) ? null: str ;
        }

        public static bool IsNullOrEmpty(this String str)
        {
            return String.IsNullOrEmpty(str) ;
        }
        public static string RemoveWhitespaces(this String str)
        {
            Regex sWhitespace = new Regex(@"\s+");
            return sWhitespace.Replace(str, "");
        }
    }
}
